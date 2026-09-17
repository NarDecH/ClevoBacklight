"""AST audit: find self.<attr> references that are never defined on the class.

Catches runtime AttributeError bugs (like a missing _set_status) that
py_compile and imports cannot see.
"""
import ast
import pathlib
import sys

FILES = [
    "clevo_ec.py",
    "clevo_backlight_gui.py",
    "clevo_daemon.py",
    "config.py",
    "hotkeys.py",
    "clevo_music.py",
    "launcher.py",
]

IGNORE = {"__class__", "__dict__", "__module__", "__name__", "__qualname__",
          "_stop"}   # _stop shadows threading.Thread._stop() — never use it

# attributes provided by stdlib base classes used in nested handler classes
BASE_ATTRS = {
    "BaseHTTPRequestHandler": {
        "path", "wfile", "client_address", "headers", "rfile", "server",
        "command", "request_version", "requestline"},
}
BASE_METHODS = {
    "BaseHTTPRequestHandler": {
        "send_response", "send_header", "end_headers", "send_error",
        "log_message", "do_GET", "do_POST", "address_string"},
}


def _walk_own(node):
    """Yield node's subtree but do NOT descend into nested ClassDefs
    (a class defined inside a method belongs to itself, not the outer one)."""
    if isinstance(node, ast.ClassDef):
        return
    yield node
    for child in ast.iter_child_nodes(node):
        yield from _walk_own(child)


def audit_file(path):
    tree = ast.parse(pathlib.Path(path).read_text(encoding="utf-8"))
    problems = []
    for cls in [n for n in ast.walk(tree) if isinstance(n, ast.ClassDef)]:
        defined = set()

        # 1) direct class body: method defs + class-level constants
        #    (incl. constants inside class-level if/try blocks)
        def add_target(t):
            if isinstance(t, ast.Name):
                defined.add(t.id)               # class constant
            elif (isinstance(t, ast.Attribute)
                    and isinstance(t.value, ast.Name)
                    and t.value.id == "self"):
                defined.add(t.attr)             # self.x = ...

        for node in cls.body:
            if isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
                defined.add(node.name)
            elif isinstance(node, ast.Assign):
                for t in node.targets:
                    add_target(t)
            elif isinstance(node, ast.AnnAssign):
                add_target(node.target)
            elif isinstance(node, (ast.If, ast.Try)):
                for sub in ast.walk(node):
                    if isinstance(sub, ast.Assign):
                        for t in sub.targets:
                            add_target(t)

        # 2) anywhere inside methods: self.x = ... / ann / aug assignments
        #    (skipping nested class bodies)
        for node in _walk_own(cls):
            if not isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef)):
                continue
            for sub in _walk_own(node):
                targets = []
                if isinstance(sub, ast.Assign):
                    targets = sub.targets
                elif isinstance(sub, (ast.AnnAssign, ast.AugAssign)):
                    targets = [sub.target]
                for t in targets:
                    if (isinstance(t, ast.Attribute)
                            and isinstance(t.value, ast.Name)
                            and t.value.id == "self"):
                        defined.add(t.attr)

        # collect every self.x reference
        bases = {b.id for b in cls.bases if isinstance(b, ast.Name)}
        base_attrs = set()
        base_methods = set()
        for b in bases:
            base_attrs |= BASE_ATTRS.get(b, set())
            base_methods |= BASE_METHODS.get(b, set())
        missing = set()
        for node in _walk_own(cls):
            if (isinstance(node, ast.Attribute)
                    and isinstance(node.value, ast.Name)
                    and node.value.id == "self"
                    and node.attr not in defined
                    and node.attr not in IGNORE
                    and node.attr not in base_attrs
                    and node.attr not in base_methods):
                missing.add(node.attr)
        if missing:
            problems.append((cls.name, sorted(missing)))
    return problems


def main():
    bad = False
    for f in FILES:
        try:
            for cls, miss in audit_file(f):
                print(f"{f}: class {cls} -> MISSING attrs: {miss}")
                bad = True
        except SyntaxError as e:
            print(f"{f}: SYNTAX ERROR {e}")
            bad = True
    print("AUDIT:", "FAIL" if bad else "CLEAN — no missing self.* attributes")
    sys.exit(1 if bad else 0)


if __name__ == "__main__":
    main()
