"""AST audit: catch self-deadlock patterns with the daemon's EC lock.

Lesson learned in v1.9.13 (found with py-spy on a frozen daemon):
`self.lock` is a NON-REENTRANT threading.Lock, and connect() acquires it
internally. Calling self.connect() while already holding `with self.lock:`
freezes the calling thread forever and starves every other EC user
(health loop, watchdog, dashboard POSTs).

This audit flags any call to self.connect() inside a `with self.lock:`
(or `with self.<*lock*>:`) body in the main modules. Exit code 1 = found.
"""
import ast
import pathlib
import sys

FILES = [
    "clevo_daemon.py",
    "clevo_ec.py",
    "clevo_backlight_gui.py",
    "config.py",
    "hotkeys.py",
]

LOCK_ATTR_HINT = "lock"          # matches self.lock / self.ec_lock / ...
CALLED_WITH_LOCK = {"connect"}   # methods that acquire self.lock internally
DEADLOCK_LOCKS = {"lock"}        # locks connect() acquires internally —
                                 # holding THESE while calling connect() is a
                                 # self-deadlock; other locks (_auto_lock,
                                 # _hist_lock) are different locks, not a
                                 # re-entrance risk (no reverse order exists)


def is_self_attr(node, attr):
    return (isinstance(node, ast.Attribute)
            and isinstance(node.value, ast.Name)
            and node.value.id == "self"
            and node.attr == attr)


def lock_name(context_expr):
    """'lock' if the with-item is `with self.<*lock*>:` else None."""
    if is_self_attr(context_expr, "__any__"):
        return None
    if (isinstance(context_expr, ast.Attribute)
            and isinstance(context_expr.value, ast.Name)
            and context_expr.value.id == "self"
            and LOCK_ATTR_HINT in context_expr.attr):
        return context_expr.attr
    return None


def audit_file(path):
    tree = ast.parse(pathlib.Path(path).read_text(encoding="utf-8"))
    hits = []
    for node in ast.walk(tree):
        if not isinstance(node, (ast.With, ast.AsyncWith)):
            continue
        held = [lock_name(it.context_expr) for it in node.items]
        held = [h for h in held if h in DEADLOCK_LOCKS]
        if not held:
            continue
        for sub in ast.walk(ast.Module(body=node.body, type_ignores=[])):
            if isinstance(sub, ast.Call) and isinstance(sub.func, ast.Attribute):
                if sub.func.attr in CALLED_WITH_LOCK and is_self_attr(sub.func, sub.func.attr):
                    line = sub.lineno
                    hits.append((path, line, held[0], sub.func.attr))
    return hits


def main():
    all_hits = []
    for f in FILES:
        try:
            all_hits += audit_file(f)
        except (OSError, SyntaxError) as e:
            print(f"{f}: cannot audit ({e})")
            all_hits.append((f, 0, "?", "syntax"))
    for path, line, lock, called in all_hits:
        print(f"LOCK AUDIT FAIL: {path}:{line} calls self.{called}() "
              f"while holding 'with self.{lock}:' -> self-deadlock "
              f"(threading.Lock is non-reentrant)")
    if all_hits:
        print("LOCK AUDIT: FAIL")
        return 1
    print("LOCK AUDIT: CLEAN — no self.connect() inside held self.lock blocks")
    return 0


if __name__ == "__main__":
    sys.exit(main())
