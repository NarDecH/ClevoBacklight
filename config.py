"""
config.py — persistent settings for the Clevo keyboard backlight controller.

Saved as settings.json next to this file:
{
  "power": true,
  "brightness": 3,            # 0-3
  "colors": ["00FF88", "00FF88", "00FF88"],   # per-zone RRGGBB, zone0=left
  "mode": "custom",           # custom|breathe|cycle|random|dance|tempo|flash|wave
  "speed": 4,                 # 0 (fastest) .. 9 (slowest)
  "hotkeys": {
      "toggle": "Ctrl+Alt+L",
      "brightness_down": "Ctrl+Alt+Down",
      "brightness_up": "Ctrl+Alt+Up",
      "cycle_color": "Ctrl+Alt+C",
      "music": "Ctrl+Alt+M",
      "ambient": "Ctrl+Alt+A"
  },
  "palette": ["FF3B30", "FF9500", "FFCC00", "34C759", "00FF88",
              "00C7BE", "30B0C7", "007AFF", "5856D6", "AF52DE",
              "FF2D55", "FFFFFF"],
  "autostart": false
}

Hotkey string grammar (case-insensitive): modifiers + key joined by '+',
e.g. "Ctrl+Alt+L", "Win+Shift+B", "Ctrl+Alt+Down".
  modifiers: Ctrl, Shift, Alt, Win
  keys:      A-Z, 0-9, F1-F24, Down/Up/Left/Right,
             Insert/Home/PageUp/Delete/End/PageDown, Space, Tab, Enter, Esc,
             Backspace, Pause, CapsLock, Numpad0-9
"""
import json
import os
import re
import sys
import threading
import time

try:
    import clevo_ec
except ImportError:            # allow running from another cwd via launcher
    sys_dir = os.path.dirname(os.path.abspath(__file__))
    if sys_dir not in os.path.sys.path:
        os.path.sys.path.insert(0, sys_dir)
    import clevo_ec

try:
    import clevo_temp          # hardware profile registry (tiny module, no EC)
except ImportError:
    clevo_temp = None

def app_base():
    """Directory where user files live (exe dir when frozen, else this file's dir)."""
    if getattr(sys, "frozen", False):
        return os.path.dirname(os.path.abspath(sys.executable))
    return os.path.dirname(os.path.abspath(__file__))


CONFIG_PATH = os.path.join(app_base(), "settings.json")

DEFAULTS = {
    "power": True,
    "brightness": 3,
    "colors": ["00FF88", "00FF88", "00FF88"],
    "mode": "custom",
    "speed": 4,
    "hotkeys": {
        "toggle": "Ctrl+Alt+L",
        "brightness_down": "Ctrl+Alt+Down",
        "brightness_up": "Ctrl+Alt+Up",
        "cycle_color": "Ctrl+Alt+C",
        "cycle_profile": "Ctrl+Alt+P",
        "music": "Ctrl+Alt+M",
        "ambient": "Ctrl+Alt+A",
    },
    "palette": ["FF3B30", "FF9500", "FFCC00", "34C759", "00FF88",
                "00C7BE", "30B0C7", "007AFF", "5856D6", "AF52DE",
                "FF2D55", "FFFFFF"],
    "profiles": {
        "gaming": {"brightness": 3, "colors": ["FF3B30", "FF3B30", "FF3B30"],
                   "mode": "custom", "speed": 4},
        "work":   {"brightness": 2, "colors": ["30B0C7", "30B0C7", "30B0C7"],
                   "mode": "custom", "speed": 4},
        "night":  {"brightness": 0, "colors": ["FF9500", "FF9500", "FF9500"],
                   "mode": "custom", "speed": 4},
    },
    "active_profile": "",
    "auto_profiles": {"enabled": False, "games": {}, "restore_profile": "", "poll_seconds": 5},
    "schedule": {"enabled": False, "slots": []},
    "battery": {"enabled": False, "profile": "", "brightness": 1,
                 "low_percent": 0},
    "engines": {"music_sensitivity": 1.0, "music_gradient": False,
                "music_gradient_color": "FF0080", "ambient_mix": 0.35,
                "ambient_interval": 0.25, "temp_source": "cpu", "temp_reg": None},
    "health_check": {"enabled": True, "interval": 60},
    "hardware": {"profile": "n957tp6", "temp_reg_override": None},
    "notifications": {"enabled": True, "on_ec_fail": True, "on_ec_recover": True,
                      "temp_threshold": 90, "on_fan_stall": True,
                      "discord_webhook": "", "telegram_token": "",
                      "telegram_chat_id": ""},
    "dashboard": {"enabled": True, "bind": "loopback", "token": "",
                  "serve_history_csv": True, "allow_control": False},
    "autostart": False,
    "updates": {"enabled": False, "repo": "NarDecH/ClevoBacklight", "interval_s": 21600},
}

APP_VERSION = "1.9.11"

MODES = ["custom", "breathe", "cycle", "random", "dance", "tempo", "flash", "wave"]

MOD_MAP = {"ctrl": 0x0002, "shift": 0x0004, "alt": 0x0001, "win": 0x0008}
KEY_MAP = {}
for _i in range(26):
    KEY_MAP[chr(ord("a") + _i)] = 0x41 + _i
for _i in range(10):
    KEY_MAP[str(_i)] = 0x30 + _i
for _i in range(1, 25):
    KEY_MAP[f"f{_i}"] = 0x6F + _i
_KEY_NAMES = {
    "down": 0x28, "up": 0x26, "left": 0x25, "right": 0x27,
    "insert": 0x2D, "home": 0x24, "pageup": 0x21,
    "delete": 0x2E, "end": 0x23, "pagedown": 0x22,
    "space": 0x20, "tab": 0x09, "enter": 0x0D, "esc": 0x1B,
    "backspace": 0x08, "pause": 0x13, "capslock": 0x14,
}
for _n, _c in _KEY_NAMES.items():
    KEY_MAP[_n] = _c
for _i in range(10):
    KEY_MAP[f"numpad{_i}"] = 0x60 + _i

HOTKEY_RE = re.compile(
    r"^(?:(ctrl|shift|alt|win)\+)*([a-z0-9]|f([1-9]|1[0-9]|2[0-4])|"
    r"down|up|left|right|insert|home|pageup|delete|end|pagedown|space|tab|"
    r"enter|esc|backspace|pause|capslock|numpad[0-9])$")


def parse_hotkey(text):
    """'Ctrl+Alt+L' -> (mod_flags, vk_code) or None if invalid."""
    if not text:
        return None
    t = text.strip().lower()
    if not HOTKEY_RE.match(t):
        return None
    mods = 0
    key = None
    for part in t.split("+"):
        if part in MOD_MAP:
            mods |= MOD_MAP[part]
        elif part:                       # last part = the key
            key = KEY_MAP[part]
    if key is None:
        return None
    return (mods, key)


class Settings:
    """Thread-safe JSON-backed settings store with sane defaults."""

    def __init__(self, path=CONFIG_PATH):
        self.path = path
        self.lock = threading.RLock()
        self.data = self._load()

    # ---- persistence ----
    def _load(self):
        merged = json.loads(json.dumps(DEFAULTS))       # deep copy of defaults
        try:
            with open(self.path, "r", encoding="utf-8") as f:
                user = json.load(f)
        except (OSError, ValueError):
            user = {}
        for key, val in user.items():
            if key == "hotkeys" and isinstance(val, dict):
                merged["hotkeys"].update(val)
            else:
                merged[key] = val
        # validate shapes
        merged["colors"] = [
            self._norm_color(c) for c in
            (merged["colors"] if isinstance(merged["colors"], list) else [])
        ][:3]
        while len(merged["colors"]) < 3:
            merged["colors"].append("FFFFFF")
        merged["brightness"] = max(0, min(3, int(merged.get("brightness", 3))))
        merged["speed"] = max(0, min(9, int(merged.get("speed", 4))))
        if merged.get("mode") not in MODES:
            merged["mode"] = "custom"
        merged["palette"] = [self._norm_color(c) for c in
                             merged.get("palette", DEFAULTS["palette"])] or \
                            list(DEFAULTS["palette"])
        hk = merged.get("hotkeys", {})
        for name in DEFAULTS["hotkeys"]:
            if not parse_hotkey(hk.get(name, "")):
                hk[name] = DEFAULTS["hotkeys"][name]
        merged["profiles"] = self._validate_profiles(merged.get("profiles"))
        if merged.get("active_profile") not in merged["profiles"]:
            merged["active_profile"] = ""
        merged["auto_profiles"] = self._validate_auto_profiles(merged.get("auto_profiles"),
                                                               merged["profiles"])
        merged["schedule"] = self._validate_schedule(merged.get("schedule"),
                                                      merged["profiles"])
        merged["battery"] = self._validate_battery(merged.get("battery"),
                                                    merged["profiles"])
        merged["engines"] = self._validate_engines(merged.get("engines"))
        merged["health_check"] = self._validate_health(merged.get("health_check"))
        merged["hardware"] = self._validate_hardware(merged.get("hardware"))
        merged["notifications"] = self._validate_notifications(merged.get("notifications"))
        merged["dashboard"] = self._validate_dashboard(merged.get("dashboard"))
        merged["updates"] = self._validate_updates(merged.get("updates"))
        return merged

    def _validate_updates(self, raw):
        """{"enabled": bool, "repo": "owner/name", "interval_s": 600-86400}.
        repo empty = check the project's own GitHub releases."""
        out = json.loads(json.dumps(DEFAULTS["updates"]))
        if not isinstance(raw, dict):
            return out
        out["enabled"] = bool(raw.get("enabled", False))
        repo = raw.get("repo")
        out["repo"] = repo.strip() if isinstance(repo, str) else ""
        try:
            out["interval_s"] = max(600, min(86400,
                int(raw.get("interval_s", out["interval_s"]) or out["interval_s"])))
        except (TypeError, ValueError):
            out["interval_s"] = 21600
        return out

    def _validate_battery(self, raw, profiles):
        """{"enabled": bool, "profile": name-or-empty, "brightness": 0-3-or-null,
        "low_percent": 0-95 (0 = level-aware dimming disabled)}."""
        out = json.loads(json.dumps(DEFAULTS["battery"]))
        if not isinstance(raw, dict):
            return out
        out["enabled"] = bool(raw.get("enabled", False))
        prof = raw.get("profile")
        out["profile"] = prof if isinstance(prof, str) and prof in profiles else ""
        try:
            b = raw.get("brightness", out["brightness"])
            out["brightness"] = None if b in (None, "") else max(0, min(3, int(b)))
        except (TypeError, ValueError):
            out["brightness"] = 1
        try:
            out["low_percent"] = max(0, min(95, int(raw.get("low_percent", 0) or 0)))
        except (TypeError, ValueError):
            out["low_percent"] = 0
        return out

    def _validate_engines(self, raw):
        """Renderer defaults used by the GUI *and* the daemon hotkey toggles."""
        out = json.loads(json.dumps(DEFAULTS["engines"]))
        if not isinstance(raw, dict):
            return out
        try:
            out["music_sensitivity"] = max(0.1, min(5.0,
                float(raw.get("music_sensitivity", out["music_sensitivity"]))))
        except (TypeError, ValueError):
            pass
        out["music_gradient"] = bool(raw.get("music_gradient", out["music_gradient"]))
        gc = raw.get("music_gradient_color")
        if isinstance(gc, str):
            out["music_gradient_color"] = self._norm_color(gc)
        try:
            out["ambient_mix"] = max(0.0, min(1.0,
                float(raw.get("ambient_mix", out["ambient_mix"]))))
        except (TypeError, ValueError):
            pass
        try:
            out["ambient_interval"] = max(0.05, min(5.0,
                float(raw.get("ambient_interval", out["ambient_interval"]))))
        except (TypeError, ValueError):
            pass
        if raw.get("temp_source") in ("cpu", "gpu"):
            out["temp_source"] = raw["temp_source"]
        try:
            reg = raw.get("temp_reg")
            if reg in (None, ""):
                out["temp_reg"] = None
            else:
                val = int(str(reg), 0)
                out["temp_reg"] = val if 0 <= val <= 255 else None
        except (TypeError, ValueError):
            out["temp_reg"] = None
        return out

    def _validate_health(self, raw):
        """{"enabled": bool, "interval": seconds-between-status.json-writes}."""
        out = json.loads(json.dumps(DEFAULTS["health_check"]))
        if not isinstance(raw, dict):
            return out
        out["enabled"] = bool(raw.get("enabled", out["enabled"]))
        try:
            out["interval"] = max(15, min(3600, int(raw.get("interval", out["interval"]))))
        except (TypeError, ValueError):
            pass
        return out

    def _validate_hardware(self, raw):
        """{"profile": model-key, "temp_reg_override": 0-255-or-null}.

        Unknown profiles fall back to n957tp6 (the verified built-in map).
        """
        out = {"profile": "n957tp6", "temp_reg_override": None}
        if not isinstance(raw, dict):
            return out
        prof = raw.get("profile")
        known = (clevo_temp.hardware_templates()
                 if clevo_temp is not None else {"n957tp6": ""})
        if prof in known:
            out["profile"] = prof
        ov = raw.get("temp_reg_override")
        if ov in (None, ""):
            out["temp_reg_override"] = None
        else:
            try:
                val = int(str(ov), 0)
                out["temp_reg_override"] = val if 0 <= val <= 255 else None
            except (TypeError, ValueError):
                out["temp_reg_override"] = None
        return out

    def _validate_notifications(self, raw):
        """{"enabled": bool, "on_ec_fail": bool, "on_ec_recover": bool,
        "temp_threshold": 60-110, "on_fan_stall": bool}."""
        out = json.loads(json.dumps(DEFAULTS["notifications"]))
        if not isinstance(raw, dict):
            return out
        for key in ("enabled", "on_ec_fail", "on_ec_recover", "on_fan_stall"):
            out[key] = bool(raw.get(key, out[key]))
        try:
            out["temp_threshold"] = max(60, min(110,
                int(raw.get("temp_threshold", out["temp_threshold"]))))
        except (TypeError, ValueError):
            pass
        hook = raw.get("discord_webhook")
        out["discord_webhook"] = hook.strip() if isinstance(hook, str) else ""
        tok = raw.get("telegram_token")
        out["telegram_token"] = tok.strip() if isinstance(tok, str) else ""
        chat = raw.get("telegram_chat_id")
        out["telegram_chat_id"] = chat.strip() if isinstance(chat, str) else ""
        return out

    def _validate_dashboard(self, raw):
        """{"enabled": bool, "bind": "loopback"|"lan", "token": str}.

        A LAN bind without a token is rejected at use time by the daemon
        (falls back to loopback) — validated here only for shape.
        """
        out = {"enabled": True, "bind": "loopback", "token": ""}
        if not isinstance(raw, dict):
            return out
        out["enabled"] = bool(raw.get("enabled", True))
        if raw.get("bind") in ("loopback", "lan"):
            out["bind"] = raw["bind"]
        tok = raw.get("token")
        out["token"] = tok.strip() if isinstance(tok, str) else ""
        out["serve_history_csv"] = bool(raw.get("serve_history_csv", True))
        out["allow_control"] = bool(raw.get("allow_control", False))
        return out

    def _validate_auto_profiles(self, raw, profiles):
        """{"enabled": bool, "games": {"game.exe": "profile"}, ...} — drop bad rows."""
        out = json.loads(json.dumps(DEFAULTS["auto_profiles"]))
        if not isinstance(raw, dict):
            return out
        out["enabled"] = bool(raw.get("enabled", False))
        out["poll_seconds"] = max(2, min(60, int(raw.get("poll_seconds", 5) or 5)))
        games = raw.get("games")
        if isinstance(games, dict):
            for exe, prof in games.items():
                if (isinstance(exe, str) and exe.strip().lower().endswith(".exe")
                        and isinstance(prof, str) and prof in profiles):
                    out["games"][exe.strip().lower()] = prof
        rp = raw.get("restore_profile")
        out["restore_profile"] = rp if isinstance(rp, str) and rp in profiles else ""
        return out

    def _validate_schedule(self, raw, profiles):
        """{"enabled": bool, "slots": [{"time": "HH:MM", "profile": name}]} — sorted, deduped."""
        out = {"enabled": False, "slots": []}
        if not isinstance(raw, dict):
            return out
        out["enabled"] = bool(raw.get("enabled", False))
        seen = set()
        slots = raw.get("slots")
        if isinstance(slots, list):
            for s in slots:
                try:
                    hh, mm = str(s.get("time", "")).strip().split(":")
                    hh, mm = int(hh), int(mm)
                    if not (0 <= hh <= 23 and 0 <= mm <= 59):
                        continue
                    prof = s.get("profile")
                    key = "%02d:%02d" % (hh, mm)
                    if prof not in profiles or key in seen:
                        continue
                    seen.add(key)
                    out["slots"].append({"time": key, "profile": prof})
                except (AttributeError, ValueError):
                    continue
        out["slots"].sort(key=lambda s: s["time"])
        return out

    def _validate_profiles(self, raw):
        """Sanitize the profiles dict; fall back to defaults when broken."""
        if not isinstance(raw, dict) or not raw:
            return json.loads(json.dumps(DEFAULTS["profiles"]))
        out = {}
        for name, prof in raw.items():
            if not isinstance(name, str) or not name.strip() or not isinstance(prof, dict):
                continue
            p = json.loads(json.dumps(DEFAULTS["profiles"]["work"]))  # shape template
            try:
                p["brightness"] = max(0, min(3, int(prof.get("brightness", p["brightness"]))))
                p["speed"] = max(0, min(9, int(prof.get("speed", p["speed"]))))
                if prof.get("mode") in MODES:
                    p["mode"] = prof["mode"]
                cols = [self._norm_color(c) for c in
                        (prof.get("colors") if isinstance(prof.get("colors"), list) else [])][:3]
                while len(cols) < 3:
                    cols.append("FFFFFF")
                p["colors"] = cols
            except (TypeError, ValueError):
                continue
            out[name.strip()] = p
        if not out:
            out = json.loads(json.dumps(DEFAULTS["profiles"]))
        return out

    def save(self):
        with self.lock:
            tmp = self.path + ".tmp"
            with open(tmp, "w", encoding="utf-8") as f:
                json.dump(self.data, f, indent=2, ensure_ascii=False)
            os.replace(tmp, self.path)

    # ---- normalization helpers ----
    @staticmethod
    def _norm_color(c):
        if not isinstance(c, str):
            return "FFFFFF"
        c = c.strip().lstrip("#").upper()
        if not re.fullmatch(r"[0-9A-F]{6}", c):
            return "FFFFFF"
        return c

    # ---- typed accessors ----
    def get(self, key, default=None):
        with self.lock:
            return self.data.get(key, default)

    def set(self, key, value, save=True):
        with self.lock:
            self.data[key] = value
            if save:
                self.save()

    def colors_rgb(self):
        """Zone colors as [(r,g,b), ...] for GUI previews."""
        out = []
        with self.lock:
            for c in self.data["colors"]:
                out.append((int(c[0:2], 16), int(c[2:4], 16), int(c[4:6], 16)))
        return out

    def snapshot(self):
        with self.lock:
            return json.loads(json.dumps(self.data))


def apply_battery_state(kb, settings, on_battery):
    """Push the battery (or AC) variant of the current settings to the EC.

    Never mutates the saved settings: on battery we clamp brightness / apply
    the chosen profile as a pass-through; back on AC the main state returns.
    """
    snap = settings.snapshot()
    bat = snap.get("battery", {})
    if on_battery and bat.get("enabled"):
        if bat.get("profile") in snap.get("profiles", {}):
            prof = json.loads(json.dumps(snap["profiles"][bat["profile"]]))
            prof["power"] = True
            return apply_state(kb, prof)
        if bat.get("brightness") is not None:
            snap["brightness"] = min(int(snap["brightness"]), int(bat["brightness"]))
            snap["power"] = True
            return apply_state(kb, snap)
    return apply_state(kb, snap)


def apply_battery_low(kb, settings, pct):
    """Level-aware low-battery dimming (needs battery.enabled + a brightness cap).

    pct >= low_percent          -> unchanged (normal state)
    low/2 <= pct < low_percent  -> cap at the battery saver brightness
    pct < low/2                 -> cap at 1 (critical: one step above dark)

    Never mutates the saved settings — the daemon calls this on every level
    crossing while unplugged; plugging back in restores the main state.
    """
    snap = settings.snapshot()
    bat = snap.get("battery", {})
    low = int(bat.get("low_percent") or 0)
    cap = bat.get("brightness")
    if low <= 0 or cap is None:
        return apply_state(kb, snap)
    if pct >= low:
        return apply_state(kb, snap)
    if pct < max(1, low // 2):
        snap["brightness"] = min(int(snap["brightness"]), int(cap), 1)
    else:
        snap["brightness"] = min(int(snap["brightness"]), int(cap))
    snap["power"] = True
    return apply_state(kb, snap)


def current_schedule_slot(slots, now_hhmm):
    """Which schedule slot covers time now_hhmm ('HH:MM')?

    Latest slot with time <= now; before the first slot of the day the LAST
    slot wraps across midnight. slots must be sorted by time. None if empty.
    """
    if not slots:
        return None
    cur = slots[-1]                     # default: wrap past midnight
    for s in slots:
        if s["time"] <= now_hhmm:
            cur = s
        else:
            break
    return cur


def apply_profile(kb, settings, name):
    """Load profile <name> into the main settings (marked active), save, push to EC.

    Returns the merged state that was applied. Raises KeyError for unknown names.
    """
    profiles = settings.get("profiles")
    if name not in profiles:
        raise KeyError("unknown profile %r (have: %s)" % (name, sorted(profiles)))
    with settings.lock:
        prof = profiles[name]
        settings.data["power"] = True
        for key in ("brightness", "colors", "mode", "speed"):
            settings.data[key] = json.loads(json.dumps(prof[key]))
        settings.data["active_profile"] = name
        settings.save()
        state = settings.snapshot()
    state["power"] = True
    apply_state(kb, state)
    return state


def apply_state(kb, state):
    """Push a settings snapshot to the keyboard in a robust order.

    Order matters on this EC: colors/brightness while off are ignored, so
    power on first, then visual properties, then the effect mode.
    """
    kb.power_on(bool(state.get("power", True)))
    kb.set_brightness(int(state.get("brightness", 3)))
    for zone, hexcol in enumerate(state.get("colors", ["FFFFFF"] * 3)):
        r, g, b = (int(hexcol[0:2], 16), int(hexcol[2:4], 16), int(hexcol[4:6], 16))
        kb.set_zone_color(zone, r, g, b)
    mode = state.get("mode", "custom")
    if mode != "custom":
        kb.set_mode(mode)
        kb.set_speed(int(state.get("speed", 4)))
    return state


def read_back(kb):
    """Best-effort live state probe (returns dict with what we can know).

    The mailbox has no reliable read-back for every field, so this reports
    the tracked settings instead of hardware truth.
    """
    st = Settings()
    return st.snapshot()


def format_uptime(seconds):
    m, s = divmod(int(seconds), 60)
    h, m = divmod(m, 60)
    return f"{h:d}:{m:02d}:{s:02d}" if h else f"{m:d}:{s:02d}"


def human_now():
    return time.strftime("%Y-%m-%d %H:%M:%S")
