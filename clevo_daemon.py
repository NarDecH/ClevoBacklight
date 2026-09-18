"""
clevo_daemon.py — headless background service for the Clevo keyboard backlight.

Responsibilities:
  * apply saved settings at startup (boot restore)
  * re-apply after sleep/resume (4s debounce)
  * re-apply after display change (hotplug: dock/undock)
  * global hotkeys (toggle / brightness / cycle color / cycle profile)
  * hotkey-toggled realtime engines: music (Ctrl+Alt+M), ambient (Ctrl+Alt+A)
    -- one engine at a time, toggled from the tray or hotkeys, stopped on quit
  * health check: probes the EC + CPU temperature periodically and writes
    status.json (external monitors can read it; the tray shows a summary)
  * status history (history.json) + localhost dashboard server:
    http://127.0.0.1:8787  (live status + sparkline graphs, tray opens it)
  * Windows toast notifications: EC failure/recovery, CPU over threshold,
    engine died unexpectedly (PowerShell toast backend, no extra deps)
  * tray icon (pystray) with enable, brightness, presets, profiles, exit
  * Ctrl+Alt+K to kill the daemon instantly (safety stop)

Run:  pythonw clevo_daemon.py        (no console window)
"""
import ctypes
import datetime
import json
import os
import subprocess
import sys
import threading
import time
from ctypes import wintypes
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import urllib.request
from urllib import parse as urllib_parse
from xml.sax.saxutils import escape

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import config
import hotkeys
import clevo_ec
import clevo_fan
import clevo_temp

from PIL import Image, ImageDraw

try:
    import pystray
    HAS_TRAY = True
except ImportError:
    HAS_TRAY = False

user32 = ctypes.WinDLL("user32", use_last_error=True)
psapi = ctypes.WinDLL("psapi", use_last_error=True)
kernel32q = ctypes.WinDLL("kernel32", use_last_error=True)
kernel32 = ctypes.WinDLL("kernel32", use_last_error=True)   # monitor: GetModuleHandleW


def foreground_exe():
    """Executable name (lowercase, e.g. 'cyberpunk2077.exe') of the foreground
    window, or '' when unknown. No heavy deps — window title stays untouched."""
    try:
        hwnd = user32.GetForegroundWindow()
        if not hwnd:
            return ""
        pid = ctypes.wintypes.DWORD()
        user32.GetWindowThreadProcessId(hwnd, ctypes.byref(pid))
        if not pid.value:
            return ""
        PROCESS_QUERY_LIMITED_INFORMATION = 0x1000
        h = kernel32q.OpenProcess(PROCESS_QUERY_LIMITED_INFORMATION, False, pid.value)
        if not h:
            return ""
        try:
            buf = ctypes.create_unicode_buffer(260)
            n = psapi.GetModuleBaseNameW(h, None, buf, 260)
            return buf.value.lower() if n else ""
        finally:
            kernel32q.CloseHandle(h)
    except Exception:
        return ""

WM_POWERBROADCAST = 0x0218
PBT_APMSUSPEND = 0x0004
PBT_APMRESUMEAUTOMATIC = 0x0012
WM_DISPLAYCHANGE = 0x007E
WM_DEVICECHANGE = 0x0219
DBT_DEVNODES_CHANGED = 0x0007
HWND_MESSAGE = -3

KILL_HOTKEY = (hotkeys.MOD_CONTROL | hotkeys.MOD_ALT, 0x4B)   # Ctrl+Alt+K (safety stop, not configurable)

STATUS_PATH = os.path.join(config.app_base(), "status.json")
HISTORY_PATH = os.path.join(config.app_base(), "history.json")
HISTORY_MAX = 720                       # samples kept in RAM + history.json
DAILY_PATH = os.path.join(config.app_base(), "daily_stats.json")
DAILY_MAX = 60                          # days of aggregate stats kept on disk
BACKUP_KEEP = 7                         # datestamped backup sets kept on disk
EVENTS_PATH = os.path.join(config.app_base(), "events.jsonl")
EVENTS_MAX = 5000                       # JSONL lines kept (file is trimmed on rotate)

# event kinds written to events.jsonl
EV_START, EV_SETTING, EV_ENGINE, EV_NOTIFY, EV_UPDATE = (
    "start", "setting", "engine", "notify", "update")

CSV_HEADERS = ["time", "version", "ec_ok", "cpu_temp", "cpu_rpm", "gpu_rpm",
               "cpu_duty_pct", "gpu_duty_pct", "power", "engines",
               "seconds_since_last_ok", "error"]


def _csv_cell(v):
    """CSV cell: None -> empty, bool -> 1/0, strings quoted when needed."""
    if v is None:
        return ""
    if isinstance(v, bool):
        return "1" if v else "0"
    if isinstance(v, (int, float)):
        return str(v)
    s = str(v)
    if any(c in s for c in (",", "\n", "\r", '"')):
        s = '"' + s.replace('"', '""') + '"'
    return s


def history_csv_rows(rows):
    """Yield one list-of-cells per history sample (shared by the dashboard
    download endpoint and `clevo_ec.py --export-csv`)."""
    for p in rows:
        if not isinstance(p, dict):
            continue
        fan = p.get("fan") if isinstance(p.get("fan"), dict) else {}
        yield [
            _csv_cell(p.get("time")),
            _csv_cell(p.get("version")),
            _csv_cell(p.get("ec_ok")),
            _csv_cell(p.get("cpu_temp")),
            _csv_cell(fan.get("cpu_rpm")),
            _csv_cell(fan.get("gpu_rpm")),
            _csv_cell(fan.get("cpu_duty_pct")),
            _csv_cell(fan.get("gpu_duty_pct")),
            _csv_cell(p.get("power")),
            _csv_cell(";".join(p.get("engines") or [])),
            _csv_cell(p.get("seconds_since_last_ok")),
            _csv_cell(p.get("error")),
        ]
DASH_PORT = 8787


def acquire_single_instance():
    """Global named mutex held for the process lifetime.

    Returns (handle, None) or (None, reason) so a second daemon (or a
    scheduled task firing twice) can never fight over the EC + hotkeys.
    """
    k32 = ctypes.WinDLL("kernel32", use_last_error=True)
    k32.CreateMutexW.restype = ctypes.c_void_p
    k32.CreateMutexW.argtypes = [ctypes.c_void_p, ctypes.c_int, ctypes.c_wchar_p]
    h = k32.CreateMutexW(None, 1, "Global\\ClevoBacklightDaemon")
    if not h:
        return None, "CreateMutexW failed: %d" % ctypes.get_last_error()
    if ctypes.get_last_error() == 183:            # ERROR_ALREADY_EXISTS
        k32.CloseHandle(h)
        return None, "another daemon instance is already running"
    return h, None


def elog(kind, **fields):
    """Append one structured event to events.jsonl (best-effort, thread-safe
    via the GIL's append atomicity; file trimmed once it passes EVENTS_MAX)."""
    try:
        rec = {"time": config.human_now(), "kind": kind}
        rec.update(fields)
        line = json.dumps(rec, ensure_ascii=False)
        path = EVENTS_PATH
        size = os.path.getsize(path) if os.path.isfile(path) else 0
        if size > EVENTS_MAX * 160:            # rough byte cap -> trim oldest half
            try:
                with open(path, "r", encoding="utf-8") as f:
                    lines = f.readlines()
                with open(path, "w", encoding="utf-8") as f:
                    f.writelines(lines[-EVENTS_MAX // 2:])
            except OSError:
                pass
        with open(path, "a", encoding="utf-8") as f:
            f.write(line + "\n")
    except Exception as exc:
        log("elog failed: %s" % exc)


def read_events(limit=200):
    """Last `limit` events (oldest first) or [] when the file is missing."""
    try:
        with open(EVENTS_PATH, "r", encoding="utf-8") as f:
            lines = f.readlines()
        out = []
        for ln in lines[-limit:]:
            try:
                out.append(json.loads(ln))
            except ValueError:
                continue
        return out
    except OSError:
        return []


def discord_post(hook, title, msg, username="Clevo Backlight"):
    """Fire-and-forget Discord webhook post (plain HTTP, no dependency).
    Never raises — failures are logged and dropped."""
    try:
        body = json.dumps({"username": username,
                           "content": "**%s**\n%s" % (title, msg)}).encode("utf-8")
        req = urllib.request.Request(
            hook, data=body,
            headers={"Content-Type": "application/json"}, method="POST")
        with urllib.request.urlopen(req, timeout=5) as resp:
            resp.read()
        return True
    except Exception as exc:
        log("discord post failed: %s" % exc)
        return False


def telegram_post(token, chat_id, title, msg):
    """Fire-and-forget Telegram bot message (plain HTTP, no dependency).
    Never raises — failures are logged and dropped."""
    try:
        text = "*%s*\n%s" % (title.replace("*", ""), msg)
        body = urllib_parse.urlencode({"chat_id": chat_id, "text": text,
                                       "parse_mode": "Markdown"}).encode("utf-8")
        url = "https://api.telegram.org/bot%s/sendMessage" % token
        req = urllib.request.Request(url, data=body, method="POST")
        with urllib.request.urlopen(req, timeout=5) as resp:
            resp.read()
        return True
    except Exception as exc:
        log("telegram post failed: %s" % exc)
        return False


class AuthGuard:
    """Token-guess protection for the dashboard (v1.9.12).

    Every failed auth is logged with the client IP into events.jsonl (kind
    "auth_fail"); after LIMIT failures within WINDOW seconds the client IP
    is blocked for BLOCK_S seconds. A toast+notify fires at most once per
    NOTIFY_EVERY seconds so the user hears about an intruder unobtrusively.
    """

    WINDOW = 60.0            # seconds
    LIMIT = 5                # failures per window before the IP gets blocked
    BLOCK_S = 300.0          # block duration after tripping the limit
    NOTIFY_EVERY = 600.0     # min spacing between intruder toasts

    def __init__(self, daemon=None):
        self.daemon = daemon
        self.lock = threading.Lock()
        self.fails = {}       # ip -> [timestamps]
        self.blocked = {}     # ip -> block-until (monotonic time)
        self._notified_until = 0.0

    def check(self, ip):
        """False (= refuse before touching tokens) when the IP is blocked."""
        now = time.monotonic()
        with self.lock:
            if now < self.blocked.get(ip, 0.0):
                return False
            lst = self.fails.get(ip)
            if lst:
                lst[:] = [t for t in lst if now - t < self.WINDOW]
            return True

    def fail(self, ip):
        now = time.monotonic()
        blocked_now = False
        with self.lock:
            lst = self.fails.setdefault(ip, [])
            lst.append(now)
            lst[:] = [t for t in lst if now - t < self.WINDOW]
            if len(lst) >= self.LIMIT:
                self.blocked[ip] = now + self.BLOCK_S
                self.fails.pop(ip, None)
                blocked_now = True
        elog(EV_NOTIFY, nkind="auth_fail", ip=ip)
        log("auth_fail from %s" % ip)
        if blocked_now:
            self._alarm(ip)

    def _alarm(self, ip):
        with self.lock:
            now = time.monotonic()
            if now < self._notified_until:
                return
            self._notified_until = now + self.NOTIFY_EVERY
        if self.daemon is not None:
            try:
                self.daemon.notify(
                    "engine", "⚠️ มีความพยายามเดา token",
                    "IP %s ส่ง token ผิด %d ครั้งใน %d วิ — บล็อกไว้ %d วินาที (ดู events.jsonl)"
                    % (ip, self.LIMIT, int(self.WINDOW), int(self.BLOCK_S)))
            except Exception:
                pass


class Daemon:
    def __init__(self):
        self.settings = config.Settings()
        self.kb = None
        self.lock = threading.Lock()          # serializes EC access
        self.auth_guard = AuthGuard(self)     # token-guess protection (v1.9.12)
        self.last_apply = 0.0
        self.pending = None                   # debounce payload (reason str)
        self.running = True
        self.tray = None
        self.hk = hotkeys.HotkeyManager()
        # background automations (auto-profile / schedule)
        self._auto_state = ""                # last automation decision (debounce)
        self._auto_lock = threading.Lock()
        self.engines = {}                    # name -> running renderer thread
        self._engine_cmd = None              # ('music'|'ambient'|'temp', 'toggle')
        self._start_time = time.time()
        self._health_stop = threading.Event()
        self._history = []                   # recent health samples (dashboard)
        self._hist_lock = threading.Lock()
        self._had_probe = False              # first successful EC probe seen
        self._ec_fail_notified = False       # toast dedup for EC down/up
        self._temp_armed = True              # toast re-arms below threshold-5
        self._fan_stall_notified = False     # toast dedup for fan-stall
        self._dash_server = None
        self._dash_port = 0
        self._dash_token = ""
        self._daily = []
        self._last_backup_day = None
        self._load_history()
        self._load_daily()
        self._roll_daily()
        threading.Thread(target=self._auto_loop, daemon=True,
                         name="ClevoAuto").start()
        threading.Thread(target=self._battery_loop, daemon=True,
                         name="ClevoBattery").start()
        threading.Thread(target=self._engine_watcher, daemon=True,
                         name="ClevoEngines").start()
        threading.Thread(target=self._ec_watchdog, daemon=True,
                         name="ClevoWatchdog").start()
        threading.Thread(target=self._updates_loop, daemon=True,
                         name="ClevoUpdates").start()

    @staticmethod
    def _power_status():
        """(on_battery, life_percent) from GetSystemPowerStatus;
        (None, None) when unknown / no system battery."""
        class SP(ctypes.Structure):
            _fields_ = [("ACLineStatus", ctypes.c_ubyte),
                        ("BatteryFlag", ctypes.c_ubyte),
                        ("BatteryLifePercent", ctypes.c_ubyte),
                        ("Reserved", ctypes.c_ubyte),
                        ("BatteryLifeTime", ctypes.c_uint32),
                        ("BatteryFullLifeTime", ctypes.c_uint32)]
        sp = SP()
        if not ctypes.windll.kernel32.GetSystemPowerStatus(ctypes.byref(sp)):
            return None, None
        if sp.BatteryFlag & 128:            # no system battery
            return None, None
        pct = sp.BatteryLifePercent
        if pct > 100:
            pct = None
        return sp.ACLineStatus == 0, pct

    @classmethod
    def _on_battery(cls):
        """True/False from GetSystemPowerStatus; None when unknown."""
        return cls._power_status()[0]

    def _battery_loop(self):
        """Apply the battery variant on AC->battery and restore on the way back.
        While unplugged, level-aware dimming re-applies on every battery-%
        crossing (settings battery.low_percent, 0 = off)."""
        last = None
        last_level = None
        while self.running:
            on, pct = self._power_status()
            # `on` here means "on battery" — level-aware dimming applies
            # only while unplugged; on AC this must stay False or the loop
            # re-applies the AC state every tick (EC churn + lock contention)
            level_changed = (on is True and pct is not None and pct != last_level)
            if on is not None and (on != last or level_changed):
                try:
                    if on and last_level is None:
                        # first sight of battery: plain saver apply
                        config.apply_battery_state(self.connect(), self.settings, True)
                    elif on and pct is not None:
                        # level-aware dimming (falls back to plain apply when off)
                        config.apply_battery_low(self.connect(), self.settings, pct)
                    else:
                        config.apply_battery_state(self.connect(), self.settings, False)
                    log("power source -> %s%s (backlight %s)"
                        % ("battery" if on else "AC",
                           (" %d%%" % pct) if (on and pct is not None) else "",
                           "saver applied" if on else "restored"))
                    self._update_tray()
                except Exception as exc:
                    log("battery switch failed: %s" % exc)
            last = on
            last_level = pct if on else None
            time.sleep(10)
            # NOTE: level_changed is computed from the ON-BATTERY pct only;
            # on AC it must stay False or the loop re-applies the AC state
            # every tick (EC churn + lock contention every 10 s)

    # ---------- updates (GitHub releases, opt-in) ----------
    def check_for_update(self, repo=None):
        """Return {"update_available": bool, "latest": tag-or-None, "url": ...}
        by reading the latest GitHub release of `repo` (default: settings).
        """
        repo = repo or self.settings.get("updates", {}).get("repo") or \
            "NarDecH/ClevoBacklight"
        url = "https://api.github.com/repos/%s/releases/latest" % repo
        req = urllib.request.Request(url, headers={
            "Accept": "application/vnd.github+json",
            "User-Agent": "ClevoBacklight/%s" % config.APP_VERSION})
        with urllib.request.urlopen(req, timeout=8) as resp:
            data = json.load(resp)
        latest = str(data.get("tag_name") or "").lstrip("v")
        asset_url = None
        for a in data.get("assets") or []:
            if str(a.get("name", "")).lower().endswith(".zip"):
                asset_url = a.get("browser_download_url")
                break
        avail = bool(latest and latest != config.APP_VERSION)
        return {"update_available": avail, "latest": latest or None,
                "current": config.APP_VERSION, "url": asset_url or
                data.get("html_url"), "repo": repo}

    def download_update(self, url, dest=None):
        """Download the release asset next to the exe (no install — the user
        still runs it). Returns the file path. Never overwrites silently:
        adds a timestamp suffix if the file already exists."""
        if not url or not url.startswith(("http://", "https://")):
            raise ValueError("invalid url")
        dest = dest or os.path.join(config.app_base(),
                                    "ClevoBacklight-update.zip")
        if os.path.isfile(dest):
            root, ext = os.path.splitext(dest)
            dest = "%s_%s%s" % (root, config.human_now().replace(":", "-")
                                 .replace(" ", "_")[:13], ext)
        req = urllib.request.Request(url, headers={
            "User-Agent": "ClevoBacklight/%s" % config.APP_VERSION})
        with urllib.request.urlopen(req, timeout=60) as resp, \
                open(dest, "wb") as f:
            while True:
                chunk = resp.read(65536)
                if not chunk:
                    break
                f.write(chunk)
        elog(EV_UPDATE, action="downloaded", url=url, file=os.path.basename(dest))
        return dest

    def _updates_loop(self):
        """Periodically check GitHub releases and toast + log when newer."""
        cfg = self.settings.get("updates")
        if not cfg.get("enabled"):
            return
        seen = set()
        while self.running and not self._health_stop.is_set():
            try:
                info = self.check_for_update()
                if info["update_available"] and info["latest"] not in seen:
                    seen.add(info["latest"])
                    elog(EV_UPDATE, action="available", latest=info["latest"])
                    self.notify("update",
                                "Clevo Backlight: เวอร์ชันใหม่ %s" % info["latest"],
                                "ปัจจุบัน %s — ดาวน์โหลดได้จากหน้า Release" % info["current"])
            except Exception as exc:
                log("update check failed: %s" % exc)
            self._health_stop.wait(max(600, int(cfg.get("interval_s", 21600))))

    # ---------- daily aggregates (dashboard 30-day summary) ----------
    def _maybe_backup(self):
        """One backup set per calendar day (checked on every health tick).
        On the day flip it also posts yesterday's summary to Discord."""
        today = config.human_now()[:10]
        if self._last_backup_day == today:
            return
        prev = self._last_backup_day
        copied = self.make_backup()
        self._last_backup_day = today
        if copied:
            log("backup: %s" % ", ".join(copied))
        # daily Discord/Telegram summary for the day that just ended
        notif = self.settings.get("notifications", {})
        hook = notif.get("discord_webhook", "")
        tg_tok = notif.get("telegram_token", "")
        tg_chat = notif.get("telegram_chat_id", "")
        if (hook or (tg_tok and tg_chat)) and prev:
            with self._hist_lock:
                rows = [r for r in self._history
                        if str(r.get("time", "")).startswith(prev)]
            if rows:
                e = self.daily_entry_for(rows)
                summary = ("CPU %.1f°C เฉลี่ย / พีค %s°C · พัดลมเฉลี่ย %s RPM · "
                           "EC fail %s ครั้ง" % (e.get("temp_avg") or 0,
                                                 e.get("temp_max") or "—",
                                                 e.get("rpm_avg") or "—",
                                                 e.get("ec_fails") or 0))
                title = "Clevo Backlight: สรุปวันที่ %s" % prev
                if hook:
                    threading.Thread(
                        target=discord_post, args=(hook, title, summary),
                        daemon=True, name="ClevoDiscord").start()
                if tg_tok and tg_chat:
                    threading.Thread(
                        target=telegram_post, args=(tg_tok, tg_chat, title, summary),
                        daemon=True, name="ClevoTelegram").start()

    def _load_daily(self):
        try:
            with open(DAILY_PATH, "r", encoding="utf-8") as f:
                data = json.load(f)
            if isinstance(data, list):
                self._daily = [d for d in data if isinstance(d, dict)][-DAILY_MAX:]
        except (OSError, ValueError):
            pass

    def _save_daily(self):
        try:
            tmp = DAILY_PATH + ".tmp"
            with open(tmp, "w", encoding="utf-8") as f:
                json.dump(self._daily, f, ensure_ascii=False)
            os.replace(tmp, DAILY_PATH)
        except OSError:
            pass

    @staticmethod
    def daily_entry_for(rows):
        """Aggregate one day's history samples into a daily_stats entry.

        rows: all samples whose time starts with that day's ISO date.
        Values: avg/max temp (deg C), avg/max RPM, EC-fail count, uptime_s
        (max uptime seen that day — the daemon restarts reset it),
        samples count, on-battery share estimate (AC=0 / battery=1)."""
        temps = [r["cpu_temp"] for r in rows
                 if r.get("ec_ok") and isinstance(r.get("cpu_temp"), (int, float))]
        rpms = [r["fan"]["cpu_rpm"] for r in rows
                if r.get("ec_ok") and isinstance(r.get("fan"), dict)
                and isinstance(r["fan"].get("cpu_rpm"), (int, float))]
        fails = sum(1 for r in rows if r.get("ec_ok") is False)
        uptimes = [r["uptime_s"] for r in rows
                   if isinstance(r.get("uptime_s"), (int, float))]
        day = {"temp_avg": round(sum(temps) / len(temps), 1) if temps else None,
               "temp_max": max(temps) if temps else None,
               "rpm_avg": round(sum(rpms) / len(rpms)) if rpms else None,
               "rpm_max": max(rpms) if rpms else None,
               "ec_fails": fails,
               "uptime_s": max(uptimes) if uptimes else 0,
               "samples": len(rows)}
        return day

    def _roll_daily(self):
        """Fold yesterday's history tail into daily_stats.json (idempotent).
        Called on startup and at each health tick — cheap: it only re-aggregates
        the samples that belong to days not yet finished."""
        with self._hist_lock:
            rows = list(self._history)
        if not rows:
            return
        by_day = {}
        for r in rows:
            t = str(r.get("time", ""))
            if len(t) >= 10:
                by_day.setdefault(t[:10], []).append(r)
        # today's entry is live (recomputed each tick); past days freeze
        today = config.human_now()[:10]
        changed = False
        for day, day_rows in by_day.items():
            entry = self.daily_entry_for(day_rows)
            entry["date"] = day
            existing = next((d for d in self._daily if d.get("date") == day), None)
            if existing is None:
                self._daily.append(entry)
                changed = True
            elif day == today and existing != entry:
                existing.clear()
                existing.update(entry)
                changed = True
        self._daily.sort(key=lambda d: d.get("date", ""))
        self._daily = self._daily[-DAILY_MAX:]
        if changed:
            self._save_daily()

    def health_grade(self):
        """A–F grade over the last 30 daily entries (or history fallback).

        100 points: up to 40 temp (peak), 30 fan (stall samples),
        30 EC reliability (fail count vs samples). Band cuts: 85/70/50/30.
        """
        rows = self._daily[-30:]
        if not rows:
            with self._hist_lock:
                rows = list(self._history)
            if not rows:
                return None
            rows = [self.daily_entry_for(rows)]
        total, max_temp = 0, None
        stall_samples, fan_samples = 0, 0
        fails = sum(int(r.get("ec_fails") or 0) for r in rows)
        samples = sum(int(r.get("samples") or 0) for r in rows)
        for r in rows:
            t = r.get("temp_max")
            if isinstance(t, (int, float)):
                total += 40 * max(0.0, min(1.0, (95.0 - t) / 30.0))
                max_temp = max(max_temp or t, t)
            rpm = r.get("rpm_avg")
            if isinstance(rpm, (int, float)):
                fan_samples += 1
                if rpm <= 0:
                    stall_samples += 1
        if fan_samples:
            total += 30 * (1.0 - stall_samples / float(fan_samples))
        if samples:
            total += 30 * max(0.0, 1.0 - fails / float(samples))
        else:
            total = 0
        total = round(total)
        grade = ("A" if total >= 85 else "B" if total >= 70 else
                 "C" if total >= 50 else "D" if total >= 30 else "F")
        return {"grade": grade, "score": total, "days": len(rows),
                "temp_peak": max_temp, "ec_fails": fails,
                "stall_days": stall_samples}

    def daily_summary(self, days=30):
        """The last `days` daily entries (oldest first) for the dashboard."""
        return [d for d in self._daily[-days:]]

    def _check_fan_stall(self, entry, thr):
        """Fan-stall toast: 0 RPM while hot (armed/re-arm with 15° hysteresis;
        dedup — one toast per stall episode, re-arms when cool again)."""
        t = entry.get("cpu_temp")
        fan = entry.get("fan") or {}
        if t is not None and t >= thr - 10 and not self._fan_stall_notified:
            if fan.get("cpu_rpm") == 0:
                self._fan_stall_notified = True
                self.notify("fan_stall",
                            "Clevo Backlight: พัดลมหยุดหมุน!",
                            "CPU %s°C แต่อ่าน RPM = 0 — ตรวจพัดลม/ทางระบายอากาศทันที" % t)
        elif t is not None and t < thr - 15:
            self._fan_stall_notified = False

    # ---------- history (dashboard graphs) ----------
    def _load_history(self):
        """Reload history.json (best effort) so graphs survive daemon restarts."""
        try:
            with open(HISTORY_PATH, "r", encoding="utf-8") as f:
                data = json.load(f)
            if isinstance(data, list):
                with self._hist_lock:
                    self._history = [s for s in data if isinstance(s, dict)][-HISTORY_MAX:]
        except (OSError, ValueError):
            pass

    def _save_history(self):
        try:
            tmp = HISTORY_PATH + ".tmp"
            with open(tmp, "w", encoding="utf-8") as f:
                json.dump(self._history, f, ensure_ascii=False)
            os.replace(tmp, HISTORY_PATH)
        except OSError:
            pass

    # ---------- notifications (Windows toasts) ----------
    def notify(self, kind, title, msg):
        """kind: ec_fail | ec_recover | temp | engine | fan_stall — respects settings.
        Every notification that passes the gates also goes to the Discord
        webhook when one is configured (best-effort, never blocks)."""
        cfg = self.settings.get("notifications")
        if not cfg.get("enabled"):
            return
        if kind == "ec_fail" and not cfg.get("on_ec_fail"):
            return
        if kind == "ec_recover" and not cfg.get("on_ec_recover"):
            return
        if kind == "fan_stall" and not cfg.get("on_fan_stall", True):
            return
        log("notify[%s]: %s — %s" % (kind, title, msg))
        elog(EV_NOTIFY, nkind=kind, title=title)
        self._toast(title, msg)
        hook = cfg.get("discord_webhook", "")
        if hook:
            threading.Thread(target=discord_post, args=(hook, title, msg),
                             daemon=True, name="ClevoDiscord").start()
        tg_tok = cfg.get("telegram_token", "")
        tg_chat = cfg.get("telegram_chat_id", "")
        if tg_tok and tg_chat:
            threading.Thread(target=telegram_post,
                             args=(tg_tok, tg_chat, title, msg),
                             daemon=True, name="ClevoTelegram").start()

    @staticmethod
    def _toast(title, msg):
        """Windows 10/11 toast via PowerShell WinRT (no extra dependencies).

        Fire-and-forget: any failure just means no popup (everything is
        already in daemon.log).
        """
        try:
            xml = ('<toast><visual><binding template="ToastText02">'
                   '<text id="1">%s</text><text id="2">%s</text>'
                   '</binding></visual></toast>' % (escape(title), escape(msg)))
            ps = (
                "[Windows.UI.Notifications.ToastNotificationManager, "
                "Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null; "
                "[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom, "
                "ContentType = WindowsRuntime] | Out-Null; "
                "$x = New-Object Windows.Data.Xml.Dom.XmlDocument; "
                "$x.LoadXml(%r); "
                "$t = New-Object Windows.UI.Notifications.ToastNotification $x; "
                "[Windows.UI.Notifications.ToastNotificationManager]"
                "::CreateToastNotifier('%s').Show($t)"
                % (xml, "\\ClevoBacklight"))
            subprocess.Popen(
                ["powershell", "-NoProfile", "-WindowStyle", "Hidden", "-Command", ps],
                creationflags=0x08000000,      # CREATE_NO_WINDOW
                stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        except Exception as exc:
            log("toast failed: %s" % exc)

    # ---------- EC watchdog (notifies between health probes) ----------
    def _ec_watchdog(self):
        """Cheap EC liveness check between the (sparse) health probes so an
        EC failure raises a toast within seconds, not a minute."""
        while self.running and not self._health_stop.is_set():
            self._health_stop.wait(10)
            if not (self.running and self._had_probe):
                continue
            try:
                self.connect().ec.read(0x07)
            except Exception as exc:
                if not self._ec_fail_notified:
                    self._ec_fail_notified = True
                    self.notify("ec_fail", "Clevo Backlight: EC \u0e44\u0e21\u0e48\u0e15\u0e2d\u0e1a\u0e2a\u0e19\u0e2d\u0e07",
                                "\u0e2d\u0e48\u0e32\u0e19 EC \u0e44\u0e21\u0e48\u0e44\u0e14\u0e49 (%s) — \u0e25\u0e2d\u0e07\u0e23\u0e35\u0e2a\u0e15\u0e32\u0e23\u0e4c\u0e17\u0e40\u0e04\u0e23\u0e37\u0e48\u0e2d\u0e07\u0e16\u0e49\u0e32\u0e2d\u0e32\u0e01\u0e32\u0e23\u0e04\u0e49\u0e32\u0e07\u0e44\u0e1b" % exc)

    # ---------- realtime engines (music / ambient / temp via hotkeys) ----------
    def _engine_cmd_set(self, name):
        self._engine_cmd = (name, "toggle")

    def _engine_watcher(self):
        """Hotkey toggles just flip _engine_cmd; this thread owns engine
        start/stop so all EC writes stay on worker threads, never the
        hotkey thread (which must return immediately to its message loop)."""
        while self.running:
            cmd = self._engine_cmd
            if cmd:
                self._engine_cmd = None
                name, action = cmd
                if action == "toggle":
                    if name in self.engines:
                        self.engine_stop(name, "hotkey")
                    else:
                        self.engine_start(name, "hotkey")
            # renderers that ended on their own (device lost etc.) -> toast
            for name, rend in list(self.engines.items()):
                if rend is not None and not rend.is_alive():
                    self.engine_stop(name, "died")
            time.sleep(0.15)

    def engine_stop(self, name, reason):
        rend = self.engines.pop(name, None)
        if rend is None:
            return False
        try:
            rend.stop()
        except Exception:
            pass
        log("%s engine stopped (%s)" % (name, reason))
        elog(EV_ENGINE, name=name, action="stop", reason=reason)
        if reason == "died":
            self.notify("engine", "Clevo Backlight: \u0e42\u0e2b\u0e21\u0e14 %s \u0e2b\u0e22\u0e38\u0e14\u0e40\u0e2d\u0e07" % name,
                        "\u0e40\u0e0a\u0e48\u0e19 loopback \u0e2b\u0e32\u0e22/\u0e08\u0e31\u0e1a\u0e08\u0e2d\u0e44\u0e21\u0e48\u0e44\u0e14\u0e49 — \u0e14\u0e39 daemon.log \u0e2b\u0e23\u0e37\u0e2d\u0e40\u0e1b\u0e34\u0e14\u0e43\u0e2b\u0e21\u0e48\u0e08\u0e32\u0e01 tray")
        self._update_tray()
        return True

    def engine_start(self, name, reason):
        """Start a realtime engine on this daemon's EC handle (one at a time)."""
        if name not in ("music", "ambient", "temp"):
            return False
        for other in list(self.engines):
            if other != name:
                self.engine_stop(other, reason)
        if name in self.engines:
            return True
        eng = self.settings.get("engines")
        try:
            kb = self.connect()
            if name == "music":
                import clevo_music
                if not clevo_music.HAS_SOUNDCARD:
                    log("music engine: soundcard module missing")
                    return False
                if eng.get("music_gradient"):
                    colors = clevo_music.gradient_colors(eng.get("music_gradient_color", "FF0080"))
                else:
                    colors = self.settings.colors_rgb()
                rend = clevo_music.MusicRenderer(
                    kb, colors,
                    sensitivity=float(eng.get("music_sensitivity", 1.0)))
            elif name == "ambient":
                import clevo_ambient
                rend = clevo_ambient.AmbientRenderer(
                    kb, mix=float(eng.get("ambient_mix", 0.35)),
                    interval=float(eng.get("ambient_interval", 0.25)))
            else:
                rend = clevo_temp.TempRenderer(
                    kb, source=eng.get("temp_source", "cpu"),
                    reg=eng.get("temp_reg"))
            kb.power_on(True)
            rend.start()
            self.engines[name] = rend
            log("%s engine started (%s)" % (name, reason))
            elog(EV_ENGINE, name=name, action="start", reason=reason)
            self._update_tray()
            return True
        except Exception as exc:
            log("%s engine start failed: %s" % (name, exc))
            return False

    # ---------- health check -> status.json + history + notifications ----------
    def _health_loop(self):
        cfg = self.settings.get("health_check")
        if not cfg.get("enabled"):
            return
        last_ok = None
        while self.running and not self._health_stop.is_set():
            entry = {"time": config.human_now(), "version": config.APP_VERSION,
                     "power": bool(self.settings.get("power")),
                     "engines": sorted(self.engines.keys()),
                     "uptime_s": int(time.time() - self._start_time)}
            try:
                t = clevo_temp.read_temp_once(
                    self.connect(), "cpu",
                    reg=clevo_temp.resolve_temp_reg(self.settings, "cpu"))
                try:
                    entry["fan"] = clevo_fan.read_fan_once(self.connect())
                except Exception as fexc:
                    entry["fan_error"] = str(fexc)
                entry["ec_ok"] = True
                entry["cpu_temp"] = t
                last_ok = time.time()
                self._had_probe = True
                if self._ec_fail_notified:
                    self._ec_fail_notified = False
                    self.notify("ec_recover", "Clevo Backlight: EC \u0e01\u0e25\u0e31\u0e1a\u0e21\u0e32\u0e41\u0e25\u0e49\u0e27",
                                "\u0e2d\u0e48\u0e32\u0e19 EC/\u0e2d\u0e38\u0e13\u0e2b\u0e20\u0e39\u0e21\u0e34\u0e44\u0e14\u0e49\u0e15\u0e32\u0e21\u0e1b\u0e01\u0e15\u0e34 (%s°C)" % t)
            except Exception as exc:
                entry["ec_ok"] = False
                entry["error"] = str(exc)
                if last_ok is not None:
                    entry["seconds_since_last_ok"] = round(time.time() - last_ok, 1)
            # temperature threshold toast (armed/re-arm with 5° hysteresis)
            if entry.get("ec_ok"):
                thr = int(self.settings.get("notifications", {}).get("temp_threshold", 90))
                t = entry.get("cpu_temp")
                if t is not None and t >= thr and self._temp_armed:
                    self._temp_armed = False
                    self.notify("temp", "Clevo Backlight: CPU \u0e23\u0e49\u0e2d\u0e19\u0e40\u0e01\u0e34\u0e19 (%s°C)" % t,
                                "\u0e40\u0e01\u0e34\u0e19\u0e01\u0e33\u0e2b\u0e19\u0e14 %d°C — \u0e01\u0e27\u0e08\u0e08\u0e32\u0e07\u0e2d\u0e32\u0e01\u0e32\u0e28/\u0e1e\u0e31\u0e14\u0e25\u0e21\u0e40\u0e1e\u0e34\u0e48\u0e07" % thr)
                elif t is not None and t < thr - 5:
                    self._temp_armed = True
                self._check_fan_stall(entry, thr)
            # history (RAM ring + disk, best effort)
            with self._hist_lock:
                self._history.append(entry)
                self._history = self._history[-HISTORY_MAX:]
                self._save_history()
            try:
                self._roll_daily()
            except Exception as dexc:
                log("daily roll failed: %s" % dexc)
            # daily backup (first tick of the day only — stamp check inside)
            try:
                self._maybe_backup()
            except Exception as bexc:
                log("backup failed: %s" % bexc)
            try:
                tmp = STATUS_PATH + ".tmp"
                with open(tmp, "w", encoding="utf-8") as f:
                    json.dump(entry, f, indent=2, ensure_ascii=False)
                os.replace(tmp, STATUS_PATH)
            except OSError:
                pass
            self._health_stop.wait(max(15, int(cfg.get("interval", 60))))

    # ---------- localhost status server (dashboard) ----------
    @staticmethod
    def history_csv(rows):
        """history samples -> CSV text (Excel-friendly, UTF-8 BOM applied by caller)."""
        out = [",".join(CSV_HEADERS)]
        for cells in history_csv_rows(rows):
            out.append(",".join(cells))
        return "\r\n".join(out) + "\r\n"

    def build_history_csv(self):
        """CSV of the in-memory history ring (dashboard download endpoint)."""
        with self._hist_lock:
            rows = list(self._history)
        return self.history_csv(rows)

    # ---------- remote control (dashboard / phone, opt-in) ----------
    def remote_command(self, payload):
        """Apply one control action from the dashboard/phone (dashboard.allow_control).

        payload: {"action": "power"|"brightness"|"profile"|"engine", ...}
          power      {"value": true|false}
          brightness {"value": 0..3}
          profile    {"name": "gaming"}
          engine     {"name": "music"|"ambient"|"temp"}   (toggle, like the hotkey)
        Settings are NOT changed — this drives the EC like a hotkey would.
        """
        action = str(payload.get("action", ""))
        if action == "engine":
            # engines are owned by the watcher thread (EC writes stay there)
            name = str(payload.get("name", ""))
            if name not in ("music", "ambient", "temp"):
                raise ValueError("unknown engine %r" % name)
            self._engine_cmd_set(name)
            return {"ok": True, "action": action, "name": name,
                    "queued": True}
        # self.lock is NON-REENTRANT: connect() takes it internally, so it
        # MUST be called before entering `with self.lock` here — nesting them
        # deadlocks the calling thread and freezes every other EC user
        # (health loop, watchdog, further /api/cmd POSTs) forever.
        kb = self.connect()
        with self.lock:
            if action == "power":
                on = bool(payload.get("value"))
                kb.power_on(on)
                self.settings.set("power", on, save=False)
            elif action == "brightness":
                lvl = max(0, min(3, int(payload.get("value", 0))))
                kb.set_brightness(lvl)
                self.settings.set("brightness", lvl, save=False)
            elif action == "profile":
                name = str(payload.get("name", ""))
                profs = self.settings.get("profiles")
                if name not in profs:
                    raise ValueError("unknown profile %r" % name)
                # apply_profile marks it active + saves + pushes to the EC
                # (a plain apply_state would leave the highlight stale)
                config.apply_profile(kb, self.settings, name)
            else:
                raise ValueError("unknown action %r" % action)
        log("remote cmd: %s %s" % (action, payload.get("value",
                                                      payload.get("name", ""))))
        self._update_tray()
        return {"ok": True, "action": action}

    # ---------- daily backups (settings + history, keep 7) ----------
    def make_backup(self):
        """Copy settings.json + history.json into backups/ (datestamped)."""
        bdir = os.path.join(config.app_base(), "backups")
        os.makedirs(bdir, exist_ok=True)
        stamp = config.human_now().replace(":", "-").replace(" ", "_")[:13]
        copied = []
        for name in ("settings.json", "history.json"):
            src = os.path.join(config.app_base(), name)
            if os.path.isfile(src):
                dst = os.path.join(bdir, "%s__%s" % (stamp, name))
                with open(src, "rb") as fi, open(dst, "wb") as fo:
                    fo.write(fi.read())
                copied.append(os.path.basename(dst))
        # prune: keep only the newest BACKUP_KEEP stamps
        stamps = sorted({f.rsplit("__", 1)[0] for f in os.listdir(bdir)
                         if "__" in f})
        for old in stamps[:-BACKUP_KEEP]:
            for f in os.listdir(bdir):
                if f.startswith(old + "__"):
                    try:
                        os.remove(os.path.join(bdir, f))
                    except OSError:
                        pass
        return copied

    @staticmethod
    def _backup_dirs():
        """Candidate backup roots: the running app's base plus the frozen
        daemon's dist dir (CLI from source vs exe daemon write elsewhere)."""
        roots = [config.app_base()]
        alt = os.path.join(roots[0], "dist")
        if alt not in roots:
            roots.append(alt)
        return roots

    def list_backups(self):
        """Sorted stamps found in any backup root (newest last)."""
        stamps = set()
        for root in self._backup_dirs():
            bdir = os.path.join(root, "backups")
            if os.path.isdir(bdir):
                stamps.update(f.rsplit("__", 1)[0] for f in os.listdir(bdir)
                              if "__" in f)
        return sorted(stamps)

    def restore_backup(self, stamp):
        """Copy a backup stamp's files back over the live ones (settings.json
        takes effect on next daemon restart)."""
        if stamp not in self.list_backups():
            raise ValueError("no backup %r" % stamp)
        restored = []
        for name in ("settings.json", "history.json"):
            for root in self._backup_dirs():
                src = os.path.join(root, "backups", "%s__%s" % (stamp, name))
                if os.path.isfile(src):
                    dst = os.path.join(config.app_base(), name)
                    with open(src, "rb") as fi, open(dst, "wb") as fo:
                        fo.write(fi.read())
                    restored.append(name)
                    break
        return restored

    # ---------- weekly aggregates + hot hour ----------
    def weekly_summary(self, weeks=4):
        """Group daily entries into ISO weeks: peaks + hottest day."""
        groups = {}
        for d in self._daily:
            date = str(d.get("date", ""))
            try:
                y, m, dd = (int(x) for x in date.split("-"))
                iso = datetime.date(y, m, dd).isocalendar()
            except (ValueError, TypeError):
                continue
            key = "%04d-W%02d" % (iso[0], iso[1])
            groups.setdefault(key, []).append(d)
        out = []
        for key in sorted(groups)[-weeks:]:
            rows = groups[key]
            temps = [r["temp_max"] for r in rows
                     if isinstance(r.get("temp_max"), (int, float))]
            rpms = [r["rpm_max"] for r in rows
                    if isinstance(r.get("rpm_max"), (int, float))]
            fails = sum(int(r.get("ec_fails") or 0) for r in rows)
            out.append({"week": key, "days": len(rows),
                        "temp_peak": max(temps) if temps else None,
                        "rpm_peak": max(rpms) if rpms else None,
                        "ec_fails": fails,
                        "hottest_day": (max(rows, key=lambda r: (r.get("temp_max") or -1)).get("date")
                                        if temps else None)})
        return out

    def hot_hour(self):
        """Which hour of day runs hottest, from the history ring."""
        best, best_t = None, None
        for r in self._history:
            t = str(r.get("time", ""))
            temp = r.get("cpu_temp")
            if len(t) >= 13 and isinstance(temp, (int, float)) and r.get("ec_ok"):
                hour = t[11:13]
                if best_t is None or temp > best_t:
                    best, best_t = hour, temp
        return {"hour": (best + ":00") if best else None,
                "temp": best_t}

    def _status_body(self):
        """Current snapshot + recent history for the dashboard/API."""
        snap = self.health_snapshot() or {}
        snap.setdefault("engines", sorted(self.engines.keys()))
        if self.settings.get("dashboard", {}).get("allow_control"):
            snap["allow_control"] = True
            snap["profiles"] = sorted(self.settings.get("profiles", {}))
            snap["brightness"] = int(self.settings.get("brightness", 0))
            snap["profile"] = self.settings.get("active_profile", "")
        if "music" in self.engines:
            rend = self.engines["music"]
            try:
                snap["music_levels"] = [round(float(v), 3)
                                         for v in rend.last_levels]
            except Exception:
                pass
        with self._hist_lock:
            snap["history"] = list(self._history)
        return snap

    def start_status_server(self, port=DASH_PORT):
        """Serve dashboard.html + /api/status.

        bind: loopback (default, 127.0.0.1) or lan (0.0.0.0 — token required,
        a LAN bind without a token silently falls back to loopback)."""
        daemon = self
        cfg = self.settings.get("dashboard")
        if not cfg.get("enabled", True):
            log("dashboard disabled (settings)")
            return 0
        token = cfg.get("token", "")
        host = "0.0.0.0" if cfg.get("bind") == "lan" else "127.0.0.1"
        if host == "0.0.0.0" and not token:
            log("dashboard: LAN bind requested without a token -> loopback fallback")
            host = "127.0.0.1"

        class _Handler(BaseHTTPRequestHandler):
            def log_message(self, *a):        # silence request logging
                pass

            def _authed(self):
                ip = self.client_address[0]
                if not daemon.auth_guard.check(ip):
                    return False
                if not token:
                    return True
                q = urllib_parse.urlparse(self.path).query
                if urllib_parse.parse_qs(q).get("token", [""])[0] == token:
                    return True
                if self.headers.get("X-Auth-Token", "") == token:
                    return True
                daemon.auth_guard.fail(ip)
                return False

            def do_POST(self):
                path = urllib_parse.urlparse(self.path).path
                if not self._authed():
                    self._json_error(401, "unauthorized")
                    return
                if path == "/api/notify-test":
                    try:
                        length = int(self.headers.get("Content-Length", 0) or 0)
                        payload = json.loads(self.rfile.read(length) or b"{}")
                    except ValueError:
                        self._json_error(400, "bad json")
                        return
                    title = str(payload.get("title") or "Clevo Backlight: ทดสอบ")[:120]
                    msg = str(payload.get("msg") or "ข้อความทดสอบจากหน้าเว็บ — ถ้าเห็นนี่แสดงว่าช่องทางแจ้งเตือนพร้อมใช้งาน")[:400]
                    try:
                        daemon.notify("engine", title, msg)
                    except Exception as exc:
                        self._json_error(500, str(exc))
                        return
                    body = json.dumps({"ok": True}).encode("utf-8")
                    self.send_response(200)
                    self.send_header("Content-Type", "application/json; charset=utf-8")
                    self.send_header("Content-Length", str(len(body)))
                    self.end_headers()
                    self.wfile.write(body)
                    return
                if path == "/api/update/download":
                    """Ask the daemon to fetch the newer release zip next to
                    itself (background thread; the user still runs it)."""
                    try:
                        info = daemon.check_for_update()
                    except Exception as exc:
                        self._json_error(502, "update check failed: %s" % exc)
                        return
                    if not info.get("update_available"):
                        self._json_error(409, "no update available (latest %s)"
                                         % info.get("latest"))
                        return
                    url = info.get("url")
                    if not url:
                        self._json_error(502, "release has no download url")
                        return
                    threading.Thread(target=daemon.download_update,
                                     args=(url,), daemon=True).start()
                    elog(EV_UPDATE, action="download_requested", url=url)
                    body = json.dumps({"ok": True, "url": url,
                                       "latest": info.get("latest")}).encode("utf-8")
                    self.send_response(200)
                    self.send_header("Content-Type",
                                     "application/json; charset=utf-8")
                    self.send_header("Content-Length", str(len(body)))
                    self.end_headers()
                    self.wfile.write(body)
                    return
                if path == "/api/notify-config":
                    if not cfg.get("allow_control", False):
                        self._json_error(403, "control disabled (dashboard.allow_control)")
                        return
                    try:
                        length = int(self.headers.get("Content-Length", 0) or 0)
                        payload = json.loads(self.rfile.read(length) or b"{}")
                    except ValueError:
                        self._json_error(400, "bad json")
                        return
                    n = daemon.settings.get("notifications", {})
                    for key in ("enabled", "on_ec_fail", "on_ec_recover",
                                "on_fan_stall"):
                        if key in payload:
                            n[key] = bool(payload[key])
                    if "temp_threshold" in payload:
                        try:
                            n["temp_threshold"] = max(60, min(110, int(payload["temp_threshold"])))
                        except (TypeError, ValueError):
                            pass
                    for key in ("discord_webhook", "telegram_token",
                                "telegram_chat_id"):
                        if key in payload and isinstance(payload[key], str):
                            n[key] = payload[key].strip()
                    daemon.settings.set("notifications", n)
                    elog(EV_SETTING, group="notifications")
                    body = json.dumps({"ok": True}).encode("utf-8")
                    self.send_response(200)
                    self.send_header("Content-Type", "application/json; charset=utf-8")
                    self.send_header("Content-Length", str(len(body)))
                    self.end_headers()
                    self.wfile.write(body)
                    return
                if path != "/api/cmd":
                    self._json_error(404, "not found")
                    return
                if not cfg.get("allow_control", False):
                    self._json_error(403, "control disabled (dashboard.allow_control)")
                    return
                try:
                    length = int(self.headers.get("Content-Length", 0) or 0)
                    payload = json.loads(self.rfile.read(length) or b"{}")
                except ValueError:
                    self._json_error(400, "bad json")
                    return
                try:
                    result = daemon.remote_command(payload)
                except ValueError as exc:      # unknown action/parameters
                    self._json_error(400, str(exc))
                    return
                except Exception as exc:
                    self._json_error(500, str(exc))
                    return
                body = json.dumps(result, ensure_ascii=False).encode("utf-8")
                self.send_response(200)
                self.send_header("Content-Type", "application/json; charset=utf-8")
                self.send_header("Content-Length", str(len(body)))
                self.end_headers()
                self.wfile.write(body)

            def _json_error(self, code, msg):
                body = json.dumps({"error": msg}, ensure_ascii=False).encode("utf-8")
                self.send_response(code)
                self.send_header("Content-Type", "application/json; charset=utf-8")
                self.send_header("Content-Length", str(len(body)))
                self.end_headers()
                self.wfile.write(body)

            def do_GET(self):
                path = urllib_parse.urlparse(self.path).path
                if not self._authed():
                    ip = self.client_address[0]
                    if not daemon.auth_guard.check(ip):
                        body = b'{"error": "too many attempts"}'
                        self.send_response(429)
                    else:
                        body = b'{"error": "unauthorized"}'
                        self.send_response(401)
                    self.send_header("Content-Type", "application/json")
                    self.send_header("Content-Length", str(len(body)))
                    self.end_headers()
                    self.wfile.write(body)
                    return
                if path in ("/", "/index.html", "/dashboard"):
                    body, ctype = self._read("dashboard.html"), "text/html; charset=utf-8"
                elif path == "/api/status":
                    body = json.dumps(daemon._status_body()).encode("utf-8")
                    ctype = "application/json; charset=utf-8"
                elif path == "/api/daily":
                    body = json.dumps({"days": daemon.daily_summary(30),
                                       "health": daemon.health_grade()}).encode("utf-8")
                    ctype = "application/json; charset=utf-8"
                elif path == "/api/history.csv":
                    if not cfg.get("serve_history_csv", True):
                        self.send_error(404)
                        return
                    body = daemon.build_history_csv().encode("utf-8-sig")
                    ctype = "text/csv; charset=utf-8"
                elif path == "/api/notify-config":
                    n = daemon.settings.get("notifications", {})
                    body = json.dumps({
                        "enabled": bool(n.get("enabled")),
                        "on_ec_fail": bool(n.get("on_ec_fail")),
                        "on_ec_recover": bool(n.get("on_ec_recover")),
                        "on_fan_stall": bool(n.get("on_fan_stall", True)),
                        "temp_threshold": int(n.get("temp_threshold", 90)),
                        "discord_webhook": n.get("discord_webhook", ""),
                        "telegram_configured": bool(n.get("telegram_token")
                                                    and n.get("telegram_chat_id")),
                    }).encode("utf-8")
                    ctype = "application/json; charset=utf-8"
                elif path == "/api/events":
                    body = json.dumps({"events": read_events(100)},
                                      ensure_ascii=False).encode("utf-8")
                    ctype = "application/json; charset=utf-8"
                elif path == "/api/events.jsonl":
                    if not cfg.get("serve_history_csv", True):
                        self.send_error(404)
                        return
                    try:
                        with open(EVENTS_PATH, "rb") as f:
                            body = f.read()
                    except OSError:
                        body = b""
                    ctype = "application/x-ndjson"
                elif path == "/api/update":
                    try:
                        body = json.dumps(daemon.check_for_update(),
                                          ensure_ascii=False).encode("utf-8")
                        ctype = "application/json; charset=utf-8"
                    except Exception as exc:
                        self._json_error(502, "update check failed: %s" % exc)
                        return
                elif path == "/api/weekly":
                    body = json.dumps({"summary": daemon.weekly_summary(4),
                                       "hot_hour": daemon.hot_hour()}).encode("utf-8")
                    ctype = "application/json; charset=utf-8"
                else:
                    self.send_error(404)
                    return
                self.send_response(200)
                self.send_header("Content-Type", ctype)
                self.send_header("Content-Length", str(len(body)))
                self.send_header("Cache-Control", "no-store")
                self.end_headers()
                self.wfile.write(body)

            @staticmethod
            def _read(name):
                # frozen exe: _MEIPASS (bundled) then exe dir; source: module dir
                bases = []
                meipass = getattr(sys, "_MEIPASS", None)
                if meipass:
                    bases.append(meipass)
                if getattr(sys, "frozen", False):
                    bases.append(os.path.dirname(sys.executable))
                bases.append(os.path.dirname(os.path.abspath(__file__)))
                bases.append(config.app_base())
                for base in bases:
                    p = os.path.join(base, name)
                    if os.path.isfile(p):
                        with open(p, "rb") as f:
                            return f.read()
                return (b"<h1>dashboard.html missing</h1>"
                        b"<p>looked in: " + "; ".join(b.encode() for b in bases) + b"</p>")

        # port 0 = let the OS pick a free port (used by tests)
        ports = (port,) + tuple(range(port + 1, port + 20)) if port else (port,)
        for p in ports:
            try:
                httpd = ThreadingHTTPServer((host, p), _Handler)
            except OSError:
                continue
            self._dash_server = httpd
            self._dash_port = httpd.server_address[1]
            self._dash_token = token
            threading.Thread(target=httpd.serve_forever, daemon=True,
                             name="ClevoDashboard").start()
            log("dashboard: http://%s:%d/ (API: /api/status)%s"
                % ("127.0.0.1" if host == "127.0.0.1" else "<LAN-IP>",
                   self._dash_port,
                   " [token protected]" if token else ""))
            return self._dash_port
        log("dashboard server disabled (all ports %d-%d busy)" % (port, port + 19))
        return 0

    def health_snapshot(self):
        """Latest status.json contents (None before the first probe)."""
        try:
            with open(STATUS_PATH, "r", encoding="utf-8") as f:
                return json.load(f)
        except (OSError, ValueError):
            return None

    def _health_text(self):
        snap = self.health_snapshot()
        if not snap:
            return "\u2026"
        if snap.get("ec_ok"):
            txt = "EC OK, CPU %s\u00b0C" % snap.get("cpu_temp", "?")
            fan = snap.get("fan")
            if isinstance(fan, dict) and fan.get("cpu_rpm"):
                txt += ", FAN %d RPM" % fan["cpu_rpm"]
            return txt
        return "EC FAILED"

    def _tray_show_health(self):
        snap = self.health_snapshot()
        log("health: %s" % (json.dumps(snap, ensure_ascii=False)
                            if snap else "no status.json yet"))

    # ---------- background automations ----------
    def _auto_loop(self):
        """Every few seconds: game watcher and day-time scheduler.

        Game watcher wins when it fires (manual choice should feel immediate);
        the schedule only applies when the game rule has nothing to say.
        Both are debounced: a decision only triggers one profile apply.
        """
        while self.running:
            try:
                ap = self.settings.get("auto_profiles")
                decision = ""
                if ap.get("enabled") and ap.get("games"):
                    exe = foreground_exe()
                    if exe:
                        decision = ap["games"].get(exe, "")
                        if decision:
                            decision = "@game:" + decision
                        elif ap.get("restore_profile") and self._auto_state.startswith("@game:"):
                            decision = "@restore:" + ap["restore_profile"]
                if not decision:
                    sch = self.settings.get("schedule")
                    if sch.get("enabled") and sch.get("slots"):
                        slot = config.current_schedule_slot(
                            sch["slots"], time.strftime("%H:%M"))
                        if slot:
                            decision = "@sched:" + slot["profile"]
                if decision and decision != self._auto_state:
                    with self._auto_lock:
                        if decision == self._auto_state:
                            continue
                        kind, _, name = decision.partition(":")
                        try:
                            config.apply_profile(self.connect(), self.settings, name)
                            self._auto_state = decision
                            log("auto-profile (%s) -> %s" % (kind.lstrip("@"), name))
                            self._update_tray()
                        except Exception as exc:
                            log("auto-profile %s failed: %s" % (decision, exc))
                elif not decision and self._auto_state:
                    self._auto_state = ""     # re-arm after rules were disabled/removed
            except Exception as exc:
                log("auto loop error: %s" % exc)
            time.sleep(max(2, int(self.settings.get("auto_profiles", {}).get("poll_seconds", 5))))

    # ---------- EC ----------
    def connect(self):
        with self.lock:
            if self.kb is None:
                self.kb = clevo_ec.ClevoKeyboardEC()
        return self.kb

    def apply(self, reason="manual"):
        """Apply current settings snapshot to the keyboard (thread-safe)."""
        st = self.settings.snapshot()
        try:
            kb = self.connect()
            with self.lock:
                config.apply_state(kb, st)
            self.last_apply = time.time()
            log(f"applied settings ({reason})")
        except Exception as exc:
            log(f"apply failed ({reason}): {exc}")

    def request_apply(self, reason, delay=4.0):
        """Debounced apply — collapses bursts (e.g. resume storms)."""
        self.pending = reason
        threading.Timer(delay, self._flush_pending).start()

    def _flush_pending(self):
        reason = self.pending
        self.pending = None
        if reason:
            self.apply(reason)

    # ---------- hotkey actions ----------
    def act_toggle(self):
        st = self.settings
        new = not st.get("power")
        st.set("power", new)
        self.apply("hotkey toggle")
        self._update_tray()

    def act_brightness(self, delta):
        st = self.settings
        st.set("brightness", max(0, min(3, st.get("brightness", 3) + delta)))
        if not st.get("power"):
            st.set("power", True)
        self.apply(f"hotkey brightness {delta:+d}")
        self._update_tray()

    def act_cycle_color(self):
        st = self.settings
        pal = st.get("palette")
        cur = st.get("colors")[1]     # match middle zone
        try:
            idx = (pal.index(cur) + 1) % len(pal)
        except ValueError:
            idx = 0
        col = pal[idx]
        st.set("colors", [col, col, col])
        st.set("mode", "custom")
        if not st.get("power"):
            st.set("power", True)
        self.apply(f"hotkey color {col}")
        self._update_tray()

    def act_preset(self, hexcol):
        self.settings.set("colors", [hexcol, hexcol, hexcol])
        self.settings.set("mode", "custom")
        if not self.settings.get("power"):
            self.settings.set("power", True)
        self.apply(f"tray preset {hexcol}")
        self._update_tray()

    def act_cycle_profile(self):
        """Switch to the next named color profile (Ctrl+Alt+P / tray menu)."""
        st = self.settings
        names = sorted(st.get("profiles"))
        if not names:
            return
        cur = st.get("active_profile", "")
        nxt = names[(names.index(cur) + 1) % len(names)] if cur in names else names[0]
        try:
            config.apply_profile(self.connect(), st, nxt)
        except Exception as exc:
            log(f"profile switch to {nxt!r} failed: {exc}")
            return
        log(f"profile -> {nxt} (cycle)")
        self._update_tray()

    def act_music(self):
        """Ctrl+Alt+M / tray: toggle the music engine (start/stop only)."""
        self._engine_cmd_set("music")

    def act_ambient(self):
        """Ctrl+Alt+A / tray: toggle the ambient engine."""
        self._engine_cmd_set("ambient")

    def act_quit(self):
        log("quit requested")
        self.running = False
        self._health_stop.set()
        if self._dash_server is not None:
            try:
                self._dash_server.shutdown()
                self._dash_server.server_close()
            except Exception:
                pass
        for name in list(self.engines):
            self.engine_stop(name, "quit")
        time.sleep(0.6)          # give the renderers a moment to restore colors
        try:
            self.hk.stop()
        except Exception:
            pass
        if self.tray is not None:
            try:
                self.tray.stop()
            except Exception:
                pass
        try:
            if self.kb is not None:
                self.kb.close()
        except Exception:
            pass
        os._exit(0)

    # ---------- hotkeys ----------
    def setup_hotkeys(self):
        hk_cfg = self.settings.get("hotkeys")

        def reg(name, action):
            combo = config.parse_hotkey(hk_cfg.get(name, ""))
            if combo:
                self.hk.add(name, combo, action)

        reg("toggle", self.act_toggle)
        reg("brightness_down", lambda: self.act_brightness(-1))
        reg("brightness_up", lambda: self.act_brightness(+1))
        reg("cycle_color", self.act_cycle_color)
        reg("cycle_profile", self.act_cycle_profile)
        reg("music", self.act_music)
        reg("ambient", self.act_ambient)
        # safety kill combo (not configurable)
        self.hk.add("kill", KILL_HOTKEY, self.act_quit)
        self.hk.run_forever(nonblocking=True)
        log(f"hotkeys active: {self.hk.names()} + Ctrl+Alt+K (kill)")

    # ---------- monitor window (sleep / resume / display change) ----------
    def start_monitor(self):
        # keep a module-level reference so the WNDPROC callback is never GC'd
        global _WNDPROC_REF
        _WNDPROC_REF = WNDPROC(self._wndproc)

        # correct prototypes: HWND is 64-bit — the default c_int restype truncates
        user32.RegisterClassExW.restype = ctypes.c_ushort          # ATOM
        user32.RegisterClassExW.argtypes = [ctypes.POINTER(WNDCLASSEX)]
        user32.CreateWindowExW.restype = wintypes.HWND
        user32.CreateWindowExW.argtypes = [
            wintypes.DWORD, wintypes.LPCWSTR, wintypes.LPCWSTR, wintypes.DWORD,
            ctypes.c_int, ctypes.c_int, ctypes.c_int, ctypes.c_int,
            wintypes.HWND, wintypes.HMENU, wintypes.HINSTANCE, wintypes.LPVOID]
        kernel32.GetModuleHandleW.restype = wintypes.HMODULE
        kernel32.GetModuleHandleW.argtypes = [wintypes.LPCWSTR]

        def _monitor():
            wcex = WNDCLASSEX()
            wcex.cbSize = ctypes.sizeof(WNDCLASSEX)
            wcex.lpfnWndProc = _WNDPROC_REF
            wcex.hInstance = kernel32.GetModuleHandleW(None)   # required, NULL fails
            wcex.lpszClassName = "ClevoBacklightDaemon"
            if not user32.RegisterClassExW(ctypes.byref(wcex)):
                log("RegisterClassExW failed (%d); monitor disabled"
                    % ctypes.get_last_error())
                return
            hwnd = user32.CreateWindowExW(
                0, wcex.lpszClassName, "ClevoBacklightDaemon", 0,
                0, 0, 0, 0, wintypes.HWND(HWND_MESSAGE), None,
                wcex.hInstance, None)
            if not hwnd:
                log("CreateWindowExW failed (%d); monitor disabled"
                    % ctypes.get_last_error())
                return
            msg = MSG()
            while self.running and user32.GetMessageW(ctypes.byref(msg), None, 0, 0) > 0:
                user32.TranslateMessage(ctypes.byref(msg))
                user32.DispatchMessageW(ctypes.byref(msg))
            log("monitor loop ended")

        threading.Thread(target=_monitor, name="ClevoMonitor", daemon=True).start()

    def _wndproc(self, hwnd, umsg, wparam, lparam):
        if umsg == WM_POWERBROADCAST:
            if wparam == PBT_APMSUSPEND:
                log("suspend -> will re-apply on resume")
            elif wparam == PBT_APMRESUMEAUTOMATIC:
                log("resume -> re-apply (debounced)")
                self.request_apply("resume", delay=4.0)
            return 1
        if umsg == WM_DISPLAYCHANGE:
            self.request_apply("displaychange", delay=2.0)
            return 0
        if umsg == WM_DEVICECHANGE and wparam == DBT_DEVNODES_CHANGED:
            self.request_apply("devicechange", delay=2.0)
            return 0
        return user32.DefWindowProcW(hwnd, umsg, wparam, lparam)

    # ---------- tray ----------
    def make_tray(self):
        if not HAS_TRAY:
            log("pystray not available -> tray disabled")
            return None

        def brightness_item(level):
            return pystray.MenuItem(
                f"{'●' if self.settings.get('brightness') == level else '  '} "
                f"ความสว่าง {level}",
                lambda: self._tray_set_brightness(level))

        def preset_item(hexcol):
            return pystray.MenuItem(
                f"{'●' if self.settings.get('colors')[1] == hexcol else '  '} {hexcol}",
                lambda: self.act_preset(hexcol))

        def profile_item(name):
            prof = self.settings.get("profiles")[name]
            mark = "●" if self.settings.get("active_profile") == name else "  "
            return pystray.MenuItem(
                f"{mark} {name} (สว่าง {prof['brightness']}, #{prof['colors'][1]})",
                lambda: self._tray_apply_profile(name))

        menu = pystray.Menu(
            pystray.MenuItem(
                lambda item: "เปิดไฟ (คลิกเพื่อปิด)" if self.settings.get("power") else "ปิดไฟ (คลิกเพื่อเปิด)",
                self.act_toggle,
                default=True),
            pystray.Menu.SEPARATOR,
            *[brightness_item(l) for l in (3, 2, 1, 0)],
            pystray.Menu.SEPARATOR,
            pystray.MenuItem("โปรไฟล์ถัดไป (Ctrl+Alt+P)", self.act_cycle_profile),
            *[profile_item(n) for n in sorted(self.settings.get("profiles"))],
            pystray.Menu.SEPARATOR,
            *[_engine_item(self, "music", "โหมดเพลง", "Ctrl+Alt+M"),
              _engine_item(self, "ambient", "โหมด Ambient", "Ctrl+Alt+A")],
            pystray.Menu.SEPARATOR,
            pystray.MenuItem(lambda item: "สถานะ: " + self._health_text(),
                             self._tray_show_health),
            pystray.MenuItem("เปิด Dashboard (เบราว์เซอร์)", self._tray_open_dashboard),
            pystray.Menu.SEPARATOR,
            pystray.MenuItem("สีถัดไว้ในพาเลต (Ctrl+Alt+C)", self.act_cycle_color),
            *[preset_item(c) for c in self.settings.get("palette")],
            pystray.Menu.SEPARATOR,
            pystray.MenuItem("ออก (Ctrl+Alt+K)", self.act_quit),
        )
        icon = pystray.Icon("ClevoBacklight", self._tray_image(), "Clevo Backlight", menu)
        return icon

    def _tray_open_dashboard(self, *a):
        port = self._dash_port or DASH_PORT
        url = "http://127.0.0.1:%d/" % port
        if self._dash_token:
            url += "?token=" + self._dash_token
        try:
            import webbrowser
            webbrowser.open(url)
        except Exception as exc:
            log("dashboard open failed: %s" % exc)

    def _tray_set_brightness(self, level):
        self.settings.set("brightness", level)
        if not self.settings.get("power"):
            self.settings.set("power", True)
        self.apply(f"tray brightness {level}")
        self._update_tray()

    def _tray_apply_profile(self, name):
        try:
            config.apply_profile(self.connect(), self.settings, name)
        except Exception as exc:
            log(f"profile {name!r} failed: {exc}")
            return
        log(f"profile -> {name} (tray)")
        self._update_tray()

    def _tray_image(self):
        st = self.settings
        col = st.get("colors")[1] if st.get("power") else "444444"
        rgb = tuple(int(col[i:i + 2], 16) for i in (0, 2, 4))
        img = Image.new("RGB", (64, 64), (16, 16, 16))
        d = ImageDraw.Draw(img)
        d.rectangle([12, 22, 52, 42], fill=rgb)
        d.rectangle([22, 12, 42, 16], fill=rgb)
        d.rectangle([22, 48, 42, 52], fill=rgb)
        return img

    def _update_tray(self):
        if self.tray is not None:
            try:
                self.tray.icon = self._tray_image()
            except Exception:
                pass

    # ---------- main ----------
    def run(self):
        log("daemon starting")
        elog(EV_START, version=config.APP_VERSION)
        try:
            self.apply("startup")
        except Exception as exc:
            log(f"startup apply failed (will retry via resume/devicechange): {exc}")
        self.setup_hotkeys()
        self.start_monitor()
        self.start_status_server()
        threading.Thread(target=self._health_loop, daemon=True,
                         name="ClevoHealth").start()
        if HAS_TRAY:
            self.tray = self.make_tray()
            if self.tray:
                log("tray running")
                self.tray.run(setup=None)     # blocks; act_quit stops it
        else:
            while self.running:
                time.sleep(1)


def _engine_item(daemon, name, label, hint):
    """Tray toggle for a realtime engine with a live \u25b6/\u25a0 state mark."""
    import pystray

    def text(item):
        mark = "\u25a0" if name in daemon.engines else "\u25b6"
        return "%s %s (%s)" % (mark, label, hint)

    return pystray.MenuItem(text, lambda: daemon._engine_cmd_set(name))


# ---------- Win32 structures ----------
class WNDCLASSEX(ctypes.Structure):
    _fields_ = [
        ("cbSize", ctypes.c_uint), ("style", ctypes.c_uint),
        ("lpfnWndProc", ctypes.WINFUNCTYPE(ctypes.c_ssize_t, ctypes.c_void_p,
                                           ctypes.c_uint, ctypes.c_size_t,
                                           ctypes.c_ssize_t)),
        ("cbClsExtra", ctypes.c_int), ("cbWndExtra", ctypes.c_int),
        ("hInstance", ctypes.c_void_p), ("hIcon", ctypes.c_void_p),
        ("hCursor", ctypes.c_void_p), ("hbrBackground", ctypes.c_void_p),
        ("lpszMenuName", ctypes.c_wchar_p), ("lpszClassName", ctypes.c_wchar_p),
        ("hIconSm", ctypes.c_void_p),
    ]


class MSG(ctypes.Structure):
    _fields_ = [
        ("hwnd", ctypes.c_void_p), ("message", ctypes.c_uint),
        ("wParam", ctypes.c_size_t), ("lParam", ctypes.c_ssize_t),
        ("time", ctypes.c_uint), ("pt", ctypes.c_int * 2),
    ]


WNDPROC = WNDCLASSEX._fields_[2][1]
_WNDPROC_REF = None


def log(msg):
    line = f"[{config.human_now()}] {msg}"
    try:
        print(line, flush=True)
    except Exception:
        pass
    try:
        with open(os.path.join(config.app_base(), "daemon.log"), "a",
                  encoding="utf-8") as f:
            f.write(line + "\n")
    except OSError:
        pass


if __name__ == "__main__":
    if "--restore-only" in sys.argv:
        # one-shot: apply saved settings and exit (for scripts / debugging)
        _d = Daemon()
        try:
            _d.apply("restore-only")
        finally:
            try:
                if _d.kb is not None:
                    _d.kb.close()
            except Exception:
                pass
    else:
        _si, _si_err = acquire_single_instance()
        if _si is None:
            log("daemon not started: %s" % _si_err)
            sys.exit(0)
        Daemon().run()
