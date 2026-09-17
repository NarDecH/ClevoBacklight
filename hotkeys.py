"""
hotkeys.py — global hotkeys on Windows via RegisterHotKey.

Usage:
    hk = HotkeyManager()
    hk.add("toggle", (MOD_CONTROL | MOD_ALT, 'L'), callback)
    hk.run_forever(nonblocking=True)   # daemon thread
    hk.stop()                          # wake the message loop and quit it

Each hotkey is single-shot: callback fires once per WM_HOTKEY message.
Hold-to-repeat is intentionally NOT implemented (hold-repeat via posted
WM_APP messages is unreliable on Windows 11 24H2+ / build 26100+).
"""
import ctypes
import threading
import time

from ctypes import wintypes

user32 = ctypes.WinDLL("user32", use_last_error=True)
kernel32 = ctypes.WinDLL("kernel32", use_last_error=True)

user32.RegisterHotKey.argtypes = [wintypes.HWND, ctypes.c_int, wintypes.UINT, wintypes.UINT]
user32.RegisterHotKey.restype = wintypes.BOOL
user32.UnregisterHotKey.argtypes = [wintypes.HWND, ctypes.c_int]
user32.UnregisterHotKey.restype = wintypes.BOOL
user32.PostThreadMessageW.argtypes = [wintypes.DWORD, wintypes.UINT,
                                      wintypes.WPARAM, wintypes.LPARAM]
user32.PostThreadMessageW.restype = wintypes.BOOL
kernel32.GetCurrentThreadId.restype = wintypes.DWORD

WM_QUIT = 0x0012
WM_HOTKEY = 0x0312

MOD_ALT = 0x0001
MOD_CONTROL = 0x0002
MOD_SHIFT = 0x0004
MOD_WIN = 0x0008


class HotkeyManager:
    """Register global hotkeys and dispatch them to callbacks on one thread."""

    def __init__(self):
        self._items = {}            # id -> (mod, vk, name, callback)
        self._by_combo = {}         # (mod, vk) -> id
        self._thread = None
        self._thread_id = 0
        self._next_id = 1
        self._lock = threading.Lock()
        self._started = threading.Event()
        self._stop_evt = threading.Event()

    def add(self, name, combo, callback):
        """combo = (mod_flags, vk_code) as produced by config.parse_hotkey()."""
        with self._lock:
            if name in self._items:
                self.remove(name)
            self._items[name] = {
                "combo": combo, "callback": callback, "id": self._next_id,
            }
            self._next_id += 1
        self._registered_ok = None
        # If the loop is already running, register on the fly.
        if self._started.is_set():
            self._register_in_thread()

    def remove(self, name):
        with self._lock:
            item = self._items.pop(name, None)
            if not item:
                return False
        if self._started.is_set():
            user32.UnregisterHotKey(None, item["id"])
        return True

    def names(self):
        with self._lock:
            return sorted(self._items.keys())

    # ---- thread ----
    def run_forever(self, nonblocking=False):
        def _loop():
            self._thread_id = kernel32.GetCurrentThreadId()
            self._register_in_thread()
            self._started.set()
            msg = wintypes.MSG()
            lpmsg = ctypes.byref(msg)
            while not self._stop_evt.is_set():
                r = user32.GetMessageW(lpmsg, None, 0, 0)
                if r <= 0:
                    break
                if msg.message == WM_HOTKEY:
                    with self._lock:
                        item = next(
                            (it for it in self._items.values()
                             if it["id"] == msg.wParam), None)
                    if item:
                        try:
                            item["callback"]()
                        except Exception:
                            pass
            # unregister all on exit
            with self._lock:
                for it in self._items.values():
                    user32.UnregisterHotKey(None, it["id"])
            self._started.clear()

        if nonblocking:
            self._thread = threading.Thread(target=_loop, name="ClevoHotkeys", daemon=True)
            self._thread.start()
            return None
        _loop()
        return None

    def _register_in_thread(self):
        with self._lock:
            for it in self._items.values():
                mod, vk = it["combo"]
                if not user32.RegisterHotKey(None, it["id"], mod, vk):
                    # keep going; a conflicting combo simply stays dead
                    pass

    def stop(self):
        self._stop_evt.set()
        if self._thread_id:
            user32.PostThreadMessageW(self._thread_id, WM_QUIT, 0, 0)
        if self._thread:
            self._thread.join(timeout=3)
