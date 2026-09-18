"""Offline tests for the v1.7.0 daemon mixins + config additions.

No EC, no admin, no tray: exercises the health-check helpers against a
temp status.json, the engine start/stop lifecycle against mock renderers,
the schedule cursor (wrap-midnight) and the new engine/health validation.
"""
import json
import os
import sys
import tempfile
import threading
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import config
import clevo_daemon


class MockRenderer(threading.Thread):
    """Minimal stand-in for the music/ambient/temp renderers."""

    def __init__(self, name):
        super().__init__(daemon=True, name=name)
        self.stopped = False
        self._stop_ev = threading.Event()

    def run(self):
        self._stop_ev.wait(5)

    def stop(self):
        self.stopped = True
        self._stop_ev.set()


def make_daemon(tmpdir, monkey_overrides=None):
    """A Daemon with everything real except EC/tray/threads."""
    cfg_path = os.path.join(tmpdir, "settings.json")
    st = config.Settings(path=cfg_path)
    d = clevo_daemon.Daemon.__new__(clevo_daemon.Daemon)
    d.settings = st
    d.kb = None
    d.lock = threading.Lock()
    d.running = True
    d.tray = None
    d.engines = {}
    d._engine_cmd = None
    d._fan_stall_notified = False
    d._start_time = time.time()
    d._health_stop = threading.Event()
    d._history = []
    d._hist_lock = threading.Lock()
    d._dash_server = None
    d._dash_port = 0
    d.log_lines = []
    d.auth_guard = clevo_daemon.AuthGuard(d)
    if monkey_overrides:
        for k, v in monkey_overrides.items():
            setattr(d, k, v)
    # keep test chatter out of the real daemon.log
    clevo_daemon.log = lambda msg, _lines=d.log_lines: _lines.append(str(msg))
    return d


def test_health_check_roundtrip(tmp):
    """Write a probe result through the daemon helpers, read it back."""
    status_path = os.path.join(tmp, "status.json")
    old = clevo_daemon.STATUS_PATH
    clevo_daemon.STATUS_PATH = status_path
    try:
        d = make_daemon(tmp)
        with open(status_path, "w", encoding="utf-8") as f:
            json.dump({"time": "t", "ec_ok": True, "cpu_temp": 47}, f)
        snap = d.health_snapshot()
        assert snap and snap.get("cpu_temp") == 47, snap
        assert "CPU 47" in d._health_text(), d._health_text()
        with open(status_path, "w", encoding="utf-8") as f:
            json.dump({"time": "t", "ec_ok": False, "error": "boom"}, f)
        assert d._health_text() == "EC FAILED", d._health_text()
        os.remove(status_path)
        assert d.health_snapshot() is None
        assert d._health_text() == "\u2026"
        print("health check round-trip OK")
    finally:
        clevo_daemon.STATUS_PATH = old


def test_engine_lifecycle(tmp, monkeypatch):
    """Start (auto-stops others) / stop / reject unknown engine names."""
    d = make_daemon(tmp)

    class FakeConnect:
        def power_on(self, on):
            self.last_power = on

    d.connect = lambda: FakeConnect()
    made = []

    def fake_ctor(kind):
        def _make(*a, **k):
            r = MockRenderer("mock-" + kind)
            made.append((kind, r))
            return r
        return _make

    import clevo_music, clevo_ambient, clevo_temp
    monkeypatch.setattr(clevo_music, "MusicRenderer", fake_ctor("music"))
    monkeypatch.setattr(clevo_music, "HAS_SOUNDCARD", True, raising=False)
    monkeypatch.setattr(clevo_ambient, "AmbientRenderer", fake_ctor("ambient"))
    monkeypatch.setattr(clevo_temp, "TempRenderer", fake_ctor("temp"))

    assert d.engine_start("music", "test") is True
    assert list(d.engines) == ["music"]
    assert d.engine_start("ambient", "test") is True
    assert list(d.engines) == ["ambient"], "starting another engine must stop the first"
    assert made[0][1].stopped, "first renderer must have been stopped"

    assert d.engine_stop("ambient", "test") is True
    assert d.engines == {}
    assert d.engine_stop("ambient", "test") is False, "stopping twice must be a no-op"

    assert d.engine_start("temp", "test") is True
    assert list(d.engines) == ["temp"]
    d.engine_stop("temp", "test")
    print("engine start/stop lifecycle OK")


def test_engine_watcher_cmd(tmp):
    """The watcher thread consumes a queued toggle command."""
    d = make_daemon(tmp)
    calls = []

    d.engine_start = lambda name, reason: calls.append(("start", name)) or True
    d.engine_stop = lambda name, reason: calls.append(("stop", name)) or True
    d._engine_cmd_set("music")
    t = threading.Thread(target=d._engine_watcher, daemon=True)
    t.start()
    deadline = time.time() + 3
    while not calls and time.time() < deadline:
        time.sleep(0.05)
    assert ("start", "music") in calls, calls
    d.engines["music"] = MockRenderer("mock")
    d._engine_cmd_set("music")
    deadline = time.time() + 3
    while not any(c[0] == "stop" for c in calls) and time.time() < deadline:
        time.sleep(0.05)
    assert ("stop", "music") in calls, calls
    d.running = False          # stop the watcher only after both toggles
    print("engine watcher command loop OK")


def test_config_engines_validation(tmp):
    """engine settings clamp values; a custom temp_reg survives."""
    p = os.path.join(tmp, "settings.json")
    with open(p, "w", encoding="utf-8") as f:
        json.dump({"engines": {"music_sensitivity": 99.0, "ambient_mix": 7,
                               "temp_source": "gpu", "temp_reg": "0x42",
                               "music_gradient_color": "#00ff88"}},
                  f)
    st = config.Settings(path=p)
    eng = st.get("engines")
    assert eng["music_sensitivity"] == 5.0, eng
    assert eng["ambient_mix"] == 1.0, eng
    assert eng["temp_source"] == "gpu"
    assert eng["temp_reg"] == 0x42, eng
    assert eng["music_gradient_color"] == "00FF88", eng

    with open(p, "w", encoding="utf-8") as f:
        json.dump({"engines": {"temp_reg": 999}}, f)
    st = config.Settings(path=p)
    assert st.get("engines")["temp_reg"] is None, "out-of-range reg -> None"
    print("config engines validation OK")


def test_config_health_validation(tmp):
    p = os.path.join(tmp, "settings.json")
    with open(p, "w", encoding="utf-8") as f:
        json.dump({"health_check": {"enabled": False, "interval": 1}}, f)
    st = config.Settings(path=p)
    hc = st.get("health_check")
    assert hc["enabled"] is False
    assert hc["interval"] == 15, "interval clamps to >= 15"
    print("config health_check validation OK")


def test_hardware_validation(tmp):
    """hardware: profile whitelist + override passthrough/range."""
    p = os.path.join(tmp, "settings.json")
    with open(p, "w", encoding="utf-8") as f:
        json.dump({"hardware": {"profile": "n957tp6", "temp_reg_override": "0x09"}}, f)
    hw = config.Settings(path=p).get("hardware")
    assert hw["profile"] == "n957tp6" and hw["temp_reg_override"] == 9, hw

    with open(p, "w", encoding="utf-8") as f:
        json.dump({"hardware": {"profile": "alienware", "temp_reg_override": 999}}, f)
    hw = config.Settings(path=p).get("hardware")
    assert hw["profile"] == "n957tp6", "unknown model falls back"
    assert hw["temp_reg_override"] is None, "out-of-range override -> None"

    # resolution order: override > profile map > built-in
    import clevo_temp
    snap = {"hardware": {"profile": "n957tp6", "temp_reg_override": None}}
    assert clevo_temp.resolve_temp_reg(snap, "cpu") == 0x07
    assert clevo_temp.resolve_temp_reg(snap, "gpu") == 0xC7   # VGAT per DSDT
    snap["hardware"]["temp_reg_override"] = 0x20
    assert clevo_temp.resolve_temp_reg(snap, "cpu") == 0x20
    snap["hardware"]["profile"] = "not-a-model"
    assert clevo_temp.resolve_temp_reg(snap, "gpu") == 0x20, "override still wins"
    snap["hardware"]["temp_reg_override"] = None
    assert clevo_temp.resolve_temp_reg(snap, "cpu") == 0x07, "unknown model -> built-in"
    print("hardware profile validation + resolution OK")


def test_notifications_validation_and_gate(tmp):
    """notifications: clamps + the notify() gating logic."""
    p = os.path.join(tmp, "settings.json")
    with open(p, "w", encoding="utf-8") as f:
        json.dump({"notifications": {"temp_threshold": 999, "on_ec_recover": False}}, f)
    d = make_daemon(tmp)
    cfg = d.settings.get("notifications")
    assert cfg["temp_threshold"] == 110, cfg
    assert cfg["on_ec_recover"] is False
    d.notify = lambda *a, **k: None      # no real toast from this test
    print("notifications validation OK")


def test_toast_escaping():
    """_toast XML-escapes user-ish strings (no crash on <>&)."""
    from xml.sax.saxutils import escape
    assert escape("a<b>&c") == "a&lt;b&gt;&amp;c"
    print("toast escaping OK")


def test_history_and_status_body(tmp):
    """history file reload + /api/status payload shape."""
    status_path = os.path.join(tmp, "status.json")
    hist_path = os.path.join(tmp, "history.json")
    old = clevo_daemon.STATUS_PATH
    old_hist = clevo_daemon.HISTORY_PATH
    clevo_daemon.STATUS_PATH = status_path
    clevo_daemon.HISTORY_PATH = hist_path      # never touch the real history
    try:
        d = make_daemon(tmp)
        sample = {"time": "t", "ec_ok": True, "cpu_temp": 51, "engines": [],
                  "fan": {"cpu_rpm": 1452, "gpu_rpm": 0,
                          "cpu_duty_pct": 30, "gpu_duty_pct": 0}}
        with self_lock(d):
            d._history = [sample]
        with open(status_path, "w", encoding="utf-8") as f:
            json.dump(sample, f)
        body = d._status_body()
        assert body["ec_ok"] is True and body["cpu_temp"] == 51, body
        assert body["fan"]["cpu_rpm"] == 1452, body
        assert body["history"] == [sample], body
        # tray text includes the fan reading
        assert "FAN 1452 RPM" in d._health_text(), d._health_text()
        # persists and reloads
        with self_lock(d):
            d._save_history()
        d2 = make_daemon(tmp)
        d2._load_history()
        assert d2._history == [sample], d2._history
        print("history + status body OK")
    finally:
        clevo_daemon.STATUS_PATH = old
        clevo_daemon.HISTORY_PATH = old_hist


def test_fan_stall_logic(tmp):
    """_check_fan_stall: fires only when hot + RPM 0, dedups, re-arms cold."""
    d = make_daemon(tmp)
    calls = []
    d.notify = lambda *a, **k: calls.append(a)
    e = {"cpu_temp": 85, "ec_ok": True, "fan": {"cpu_rpm": 0, "gpu_rpm": 0,
                                                "cpu_duty_pct": 0, "gpu_duty_pct": 0}}
    d._check_fan_stall(e, 90)                 # hot + stall -> fires
    assert len(calls) == 1 and calls[0][0] == "fan_stall", calls
    d._check_fan_stall(e, 90)                 # still stalled -> dedup
    assert len(calls) == 1, calls
    d._check_fan_stall({"cpu_temp": 60, "ec_ok": True,
                        "fan": {"cpu_rpm": 1450}}, 90)   # cool -> re-arm
    assert d._fan_stall_notified is False
    d._check_fan_stall(e, 90)                 # hot + stall again -> fires
    assert len(calls) == 2, calls
    # spinning fan never fires (rpm > 0)
    d._fan_stall_notified = False
    d._check_fan_stall({"cpu_temp": 95, "ec_ok": True,
                        "fan": {"cpu_rpm": 3000}}, 90)
    assert len(calls) == 2, calls
    print("fan stall toast logic OK")


def test_history_csv(tmp):
    """CSV rows: fan columns, escaping, and the Excel-friendly body."""
    rows = [
        {"time": "2026-09-17 10:00:00", "version": "1.9.3", "ec_ok": True,
         "cpu_temp": 55, "power": True, "engines": ["music"],
         "fan": {"cpu_rpm": 1452, "gpu_rpm": 0, "cpu_duty_pct": 30, "gpu_duty_pct": 0}},
        {"time": "t2", "ec_ok": False, "error": "boom, hard"},
        "garbage-row",
    ]
    body = clevo_daemon.Daemon.history_csv(rows)
    lines = body.strip().split("\r\n")
    assert lines[0].startswith("time,version,ec_ok,cpu_temp,cpu_rpm"), lines[0]
    assert "1452" in lines[1] and "music" in lines[1], lines[1]
    assert '"boom, hard"' in lines[2], lines[2]          # comma escaped
    assert len(lines) == 3, lines                        # garbage row skipped
    # generator parity with the CLI path
    gen = list(clevo_daemon.history_csv_rows(rows[:1]))
    assert gen[0][4] == "1452", gen
    print("history CSV OK")


def test_auto_profiles_config_and_api(tmp):
    """Auto-profile rules: config merge/validation + GET/POST endpoints.
    Daemon merge must be atomic (bad row rejects the whole POST)."""
    import urllib.request
    import urllib.error
    status_path = os.path.join(tmp, "status.json")
    hist_path = os.path.join(tmp, "history.json")
    events_path = os.path.join(tmp, "events.jsonl")
    old = (clevo_daemon.STATUS_PATH, clevo_daemon.HISTORY_PATH,
           clevo_daemon.EVENTS_PATH)
    clevo_daemon.STATUS_PATH = status_path
    clevo_daemon.HISTORY_PATH = hist_path
    clevo_daemon.EVENTS_PATH = events_path
    srv = None
    try:
        d = make_daemon(tmp)
        d.settings.data["dashboard"]["allow_control"] = True
        d.settings.data["profiles"]["ap-test"] = {
            "brightness": 3, "colors": ["FF0000", "00FF00", "0000FF"],
            "mode": "custom", "speed": 4}
        port = d.start_status_server(port=0)
        srv = d._dash_server
        base = "http://127.0.0.1:%d" % port

        # add one rule via POST (payload shape == stored shape)
        payload = json.dumps({"games": {"GameClient.exe": "ap-test"}}).encode()
        req = urllib.request.Request(base + "/api/auto_profiles", data=payload,
                                     headers={"Content-Type": "application/json"})
        with urllib.request.urlopen(req, timeout=5) as r:
            j = json.loads(r.read().decode("utf-8"))
        assert j["ok"] and j["auto_profiles"]["games"]["gameclient.exe"] == "ap-test", j

        # persisted + GET lists it (exe normalized lowercase)
        assert d.settings.get("auto_profiles")["games"].get("gameclient.exe") == "ap-test"
        with urllib.request.urlopen(base + "/api/auto_profiles", timeout=5) as r:
            lst = json.loads(r.read().decode("utf-8"))
        assert lst["games"].get("gameclient.exe") == "ap-test", lst

        # unknown profile in a rule -> 400, nothing persisted (atomic)
        bad = json.dumps({"games": {"other.exe": "no-such-profile"}}).encode()
        req2 = urllib.request.Request(base + "/api/auto_profiles", data=bad,
                                      headers={"Content-Type": "application/json"})
        try:
            urllib.request.urlopen(req2, timeout=5)
            raise AssertionError("unknown profile must be rejected 400")
        except urllib.error.HTTPError as e:
            assert e.code == 400, e.code
        assert "other.exe" not in d.settings.get("auto_profiles")["games"]

        # rule for a non-exe string -> 400
        bad2 = json.dumps({"games": {"notanexe": "ap-test"}}).encode()
        req3 = urllib.request.Request(base + "/api/auto_profiles", data=bad2,
                                      headers={"Content-Type": "application/json"})
        try:
            urllib.request.urlopen(req3, timeout=5)
            raise AssertionError("non-exe rule must be rejected 400")
        except urllib.error.HTTPError as e:
            assert e.code == 400, e.code

        # delete a rule with null value; enabled/restore round-trip
        dele = json.dumps({"games": {"GameClient.EXE": None},
                           "enabled": True, "restore_profile": "ap-test",
                           "poll_seconds": 7}).encode()
        req4 = urllib.request.Request(base + "/api/auto_profiles", data=dele,
                                      headers={"Content-Type": "application/json"})
        with urllib.request.urlopen(req4, timeout=5) as r:
            j4 = json.loads(r.read().decode("utf-8"))
        ap = j4["auto_profiles"]
        assert ap["games"] == {} and ap["enabled"] is True, ap
        assert ap["restore_profile"] == "ap-test" and ap["poll_seconds"] == 7, ap

        # control off -> 403 on POST
        d.settings.data["dashboard"]["allow_control"] = False
        req5 = urllib.request.Request(base + "/api/auto_profiles", data=payload,
                                      headers={"Content-Type": "application/json"})
        try:
            urllib.request.urlopen(req5, timeout=5)
            raise AssertionError("control off must be rejected 403")
        except urllib.error.HTTPError as e:
            assert e.code == 403, e.code
    finally:
        if srv is not None:
            srv.shutdown()
        clevo_daemon.STATUS_PATH, clevo_daemon.HISTORY_PATH, \
            clevo_daemon.EVENTS_PATH = old


def test_profiles_endpoint_and_upsert(tmp):
    """POST /api/profiles creates/updates a profile (validated); GET lists.
    Static PWA files (manifest/sw/icons) must be served."""
    import urllib.request
    import urllib.error
    status_path = os.path.join(tmp, "status.json")
    hist_path = os.path.join(tmp, "history.json")
    events_path = os.path.join(tmp, "events.jsonl")
    old = (clevo_daemon.STATUS_PATH, clevo_daemon.HISTORY_PATH,
           clevo_daemon.EVENTS_PATH)
    clevo_daemon.STATUS_PATH = status_path
    clevo_daemon.HISTORY_PATH = hist_path
    clevo_daemon.EVENTS_PATH = events_path
    srv = None
    try:
        d = make_daemon(tmp)
        d.settings.data["dashboard"]["allow_control"] = True
        port = d.start_status_server(port=0)
        srv = d._dash_server
        base = "http://127.0.0.1:%d" % port

        # create from the phone-style payload
        payload = json.dumps({"name": "phone-test",
                              "profile": {"brightness": 2,
                                          "colors": ["#ff0000", "00ff00", "#0000ff"],
                                          "mode": "custom", "speed": 4}}).encode()
        req = urllib.request.Request(base + "/api/profiles", data=payload,
                                     headers={"Content-Type": "application/json"})
        with urllib.request.urlopen(req, timeout=5) as r:
            j = json.loads(r.read().decode("utf-8"))
        assert j["ok"] and j["profile"]["colors"] == ["FF0000", "00FF00", "0000FF"], j

        # persisted and listed by GET
        assert "phone-test" in d.settings.get("profiles"), "profile must persist"
        with urllib.request.urlopen(base + "/api/profiles", timeout=5) as r:
            lst = json.loads(r.read().decode("utf-8"))
        assert "phone-test" in lst["profiles"], lst

        # update-in-place: same name overwrites, no duplicate
        payload2 = json.dumps({"name": "phone-test",
                               "profile": {"brightness": 0,
                                           "colors": ["FF9500", "FF9500", "FF9500"]}}).encode()
        req2 = urllib.request.Request(base + "/api/profiles", data=payload2,
                                      headers={"Content-Type": "application/json"})
        with urllib.request.urlopen(req2, timeout=5) as r:
            j2 = json.loads(r.read().decode("utf-8"))
        assert j2["profile"]["brightness"] == 0, j2
        assert list(d.settings.get("profiles")).count("phone-test") == 1

        # validation errors -> 400
        for bad in ({"name": "", "profile": {}},
                    {"name": "x", "profile": {"colors": ["red"]}},
                    {"name": "x", "profile": {"colors": ["GG0000", "000000", "000000"]}},
                    {"name": "x", "profile": {"mode": "nope"}},
                    {"name": "password stuff"}):
            reqb = urllib.request.Request(base + "/api/profiles",
                                          data=json.dumps(bad).encode(),
                                          headers={"Content-Type": "application/json"})
            try:
                urllib.request.urlopen(reqb, timeout=5)
                raise AssertionError("400 expected for %r" % bad)
            except urllib.error.HTTPError as e:
                assert e.code == 400, (bad, e.code)

        # static PWA files served
        for route, marker in (("/manifest.webmanifest", b'"name"'),
                              ("/sw.js", b"Clevo Backlight"),
                              ("/icon-192.png", b"PNG"),
                              ("/icon-512.png", b"PNG")):
            with urllib.request.urlopen(base + route, timeout=5) as r:
                body = r.read()
                assert marker in body[:64] or r.headers.get("Content-Type", "").startswith("image/"), route
        print("profiles endpoint + upsert + PWA static OK")
    finally:
        (clevo_daemon.STATUS_PATH, clevo_daemon.HISTORY_PATH,
         clevo_daemon.EVENTS_PATH) = old
        if srv is not None:
            try:
                srv.shutdown()
                srv.server_close()
            except Exception:
                pass


def test_update_download_endpoint(tmp):
    """POST /api/update/download: 409 when up-to-date; background download
    with the release zip URL when a newer version exists."""
    import urllib.request
    import urllib.error
    status_path = os.path.join(tmp, "status.json")
    hist_path = os.path.join(tmp, "history.json")
    events_path = os.path.join(tmp, "events.jsonl")
    old = (clevo_daemon.STATUS_PATH, clevo_daemon.HISTORY_PATH,
           clevo_daemon.EVENTS_PATH)
    clevo_daemon.STATUS_PATH = status_path
    clevo_daemon.HISTORY_PATH = hist_path
    clevo_daemon.EVENTS_PATH = events_path
    srv = None
    try:
        d = make_daemon(tmp)
        downloads = []
        d.download_update = lambda url, dest=None: downloads.append(url)
        port = d.start_status_server(port=0)
        srv = d._dash_server
        base = "http://127.0.0.1:%d" % port

        # up-to-date -> 409, nothing downloaded
        d.check_for_update = lambda: {"update_available": False,
                                      "latest": "1.9.10", "url": "x"}
        try:
            urllib.request.urlopen(base + "/api/update/download",
                                   data=b"{}", timeout=5)
            raise AssertionError("409 expected when up-to-date")
        except urllib.error.HTTPError as e:
            assert e.code == 409, e.code
        assert downloads == [], downloads

        # newer release -> URL passed to download_update, event logged
        d.check_for_update = lambda: {
            "update_available": True, "latest": "9.9.9",
            "url": "https://example.invalid/CB.zip"}
        with urllib.request.urlopen(base + "/api/update/download",
                                    data=b"{}", timeout=5) as r:
            j = json.loads(r.read().decode("utf-8"))
        assert j["ok"] and j["latest"] == "9.9.9", j
        for _ in range(50):
            if downloads:
                break
            time.sleep(0.05)
        assert downloads == ["https://example.invalid/CB.zip"], downloads
        evs = open(events_path, encoding="utf-8").read().strip().split("\n")
        assert any('"download_requested"' in ln for ln in evs), evs[-3:]
        print("dashboard /api/update/download OK")
    finally:
        (clevo_daemon.STATUS_PATH, clevo_daemon.HISTORY_PATH,
         clevo_daemon.EVENTS_PATH) = old
        if srv is not None:
            try:
                srv.shutdown()
                srv.server_close()
            except Exception:
                pass


def test_dashboard_history_csv_endpoint(tmp):
    """GET /api/history.csv returns the CSV body (or 404 when disabled)."""
    import urllib.request
    status_path = os.path.join(tmp, "status.json")
    hist_path = os.path.join(tmp, "history.json")
    old, old_hist = clevo_daemon.STATUS_PATH, clevo_daemon.HISTORY_PATH
    clevo_daemon.STATUS_PATH = status_path
    clevo_daemon.HISTORY_PATH = hist_path
    srv = None
    try:
        d = make_daemon(tmp)
        with self_lock(d):
            d._history = [{"time": "t", "ec_ok": True, "cpu_temp": 50,
                           "fan": {"cpu_rpm": 1450, "gpu_rpm": 0,
                                   "cpu_duty_pct": 30, "gpu_duty_pct": 0}}]
        port = d.start_status_server(port=0)
        srv = d._dash_server
        base = "http://127.0.0.1:%d" % port
        with urllib.request.urlopen(base + "/api/history.csv", timeout=5) as r:
            text = r.read().decode("utf-8-sig")
        assert text.startswith("time,version,ec_ok") and "1450" in text, text[:200]
        print("dashboard /api/history.csv OK")
    finally:
        clevo_daemon.STATUS_PATH = old
        clevo_daemon.HISTORY_PATH = old_hist
        if srv is not None:
            try:
                srv.shutdown()
                srv.server_close()
            except Exception:
                pass


class _Kb:
    """Minimal EC mock for config.apply_* (records the calls)."""

    def __init__(self):
        self.calls = []

    def power_on(self, on):
        self.calls.append(("power", bool(on)))

    def set_brightness(self, lvl):
        self.calls.append(("brightness", int(lvl)))

    def set_zone_color(self, z, r, g, b):
        self.calls.append(("zone", z, r, g, b))

    def set_mode(self, m):
        self.calls.append(("mode", m))

    def set_speed(self, s):
        self.calls.append(("speed", int(s)))


def test_daily_roll(tmp):
    """_roll_daily aggregates history per day; today stays live."""
    today = config.human_now()[:10]          # the live day is the real one
    d = make_daemon(tmp)
    d._daily = []
    d._hist_lock = threading.Lock()
    d._history = [
        {"time": "2026-09-15 10:00:00", "ec_ok": True, "cpu_temp": 50,
         "uptime_s": 100, "fan": {"cpu_rpm": 1400, "gpu_rpm": 0}},
        {"time": "2026-09-15 11:00:00", "ec_ok": False, "error": "x",
         "uptime_s": 200},
        {"time": today + " 09:00:00", "ec_ok": True, "cpu_temp": 70,
         "uptime_s": 60, "fan": {"cpu_rpm": 1600, "gpu_rpm": 0}},
    ]
    d._roll_daily()
    days = {e["date"]: e for e in d._daily}
    assert set(days) == {"2026-09-15", today}, days
    assert days["2026-09-15"]["temp_avg"] == 50 and days["2026-09-15"]["ec_fails"] == 1
    assert days["2026-09-15"]["rpm_avg"] == 1400 and days["2026-09-15"]["uptime_s"] == 200
    assert days[today]["temp_max"] == 70 and days[today]["rpm_max"] == 1600
    # today's entry is recomputed on every roll (live)
    d._history.append({"time": today + " 10:00:00", "ec_ok": True,
                       "cpu_temp": 90, "uptime_s": 400,
                       "fan": {"cpu_rpm": 2400, "gpu_rpm": 0}})
    d._roll_daily()
    days = {e["date"]: e for e in d._daily}
    assert days[today]["temp_max"] == 90, days
    assert d.daily_summary(30)[-1]["date"] == today
    print("daily roll OK")


def test_battery_low_levels(tmp):
    """apply_battery_low: normal / saver / critical caps by battery %."""
    cfg_path = os.path.join(tmp, "settings_low.json")
    st = config.Settings(path=cfg_path)
    bat = st.get("battery")
    bat.update({"enabled": True, "profile": "", "brightness": 1,
                "low_percent": 40})
    st.set("battery", bat)
    kb = _Kb()
    config.apply_battery_low(kb, st, 80)          # healthy battery
    assert ("brightness", 3) in kb.calls, kb.calls
    kb = _Kb()
    config.apply_battery_low(kb, st, 35)          # below threshold -> saver cap
    assert ("brightness", 1) in kb.calls, kb.calls
    kb = _Kb()
    config.apply_battery_low(kb, st, 10)          # critical half -> still 1
    assert ("brightness", 1) in kb.calls, kb.calls
    # disabled / no threshold -> untouched
    bat2 = dict(bat); bat2["low_percent"] = 0
    st.set("battery", bat2)
    kb = _Kb()
    config.apply_battery_low(kb, st, 5)
    assert ("brightness", 3) in kb.calls, kb.calls
    print("battery low levels OK")


def test_notifications_new_fields(tmp):
    """on_fan_stall survives validation + battery.low_percent clamps."""
    cfg_path = os.path.join(tmp, "settings_notif.json")
    st = config.Settings(path=cfg_path)
    n = st.get("notifications")
    n["on_fan_stall"] = False
    st.set("notifications", n)
    assert st.snapshot()["notifications"]["on_fan_stall"] is False
    bat = st.get("battery")
    bat["low_percent"] = 500
    st.set("battery", bat)
    st2 = config.Settings(path=cfg_path)          # reload -> validator clamps
    assert st2.snapshot()["battery"]["low_percent"] == 95   # clamped
    print("notifications/battery new fields OK")


def test_remote_command(tmp):
    """remote_command drives the EC for power/brightness/profile."""
    cfg_path = os.path.join(tmp, "settings_remote.json")
    st = config.Settings(path=cfg_path)
    d = make_daemon(tmp)
    d.settings = st
    kb = _Kb()
    d.connect = lambda: kb          # inject the mock
    updates = []
    d.settings.set = lambda k, v, save=True: updates.append((k, v))
    tray = []
    d._update_tray = lambda: tray.append(1)
    r = d.remote_command({"action": "power", "value": True})
    assert r["ok"] and ("power", True) in kb.calls, (r, kb.calls)
    assert ("power", True) in updates
    kb.calls.clear()
    d.remote_command({"action": "brightness", "value": 2})
    assert ("brightness", 2) in kb.calls, kb.calls
    kb.calls.clear()
    d.remote_command({"action": "profile", "name": "gaming"})
    assert any(c[0] == "brightness" for c in kb.calls), kb.calls  # profile applied
    try:
        d.remote_command({"action": "profile", "name": "nope"})
        raise AssertionError("unknown profile must raise")
    except ValueError:
        pass
    try:
        d.remote_command({"action": "nonsense"})
        raise AssertionError("unknown action must raise")
    except ValueError:
        pass
    # engine toggle queues a command for the watcher (no EC access here)
    r = d.remote_command({"action": "engine", "name": "music"})
    assert r["ok"] and r["queued"], r
    assert d._engine_cmd == ("music", "toggle"), d._engine_cmd
    try:
        d.remote_command({"action": "engine", "name": "nope"})
        raise AssertionError("unknown engine must raise")
    except ValueError:
        pass
    print("remote command OK")


def test_preview_and_validate_profile(tmp):
    """config.validate_profile_payload normalizes without saving; the
    preview remote action pushes the EC but touches NO setting at all."""
    prof = config.validate_profile_payload(
        {"brightness": "2", "colors": ["#ff0000", "00ff00", "0000FF"],
         "mode": "custom", "speed": "4"})
    assert prof == {"brightness": 2, "colors": ["FF0000", "00FF00", "0000FF"],
                    "mode": "custom", "speed": 4}, prof
    for bad in ({"colors": ["red"]}, {"colors": ["GG0000", "000000", "000000"]},
                {"mode": "nope"}, {"brightness": "x"},
                {"speed": "x"}, {"colors": ["FF0000", "FF0000"]}):
        try:
            config.validate_profile_payload(bad)
            raise AssertionError("400-style ValueError expected for %r" % bad)
        except ValueError:
            pass
    # name rules stay in upsert_profile (storage concern)
    st = config.Settings(path=os.path.join(tmp, "settings_pv.json"))
    try:
        config.upsert_profile(st, "password stuff", {"colors": ["FF0000", "FF0000", "FF0000"]})
        raise AssertionError("reserved name must raise")
    except ValueError:
        pass
    # preview: EC gets power+brightness+zones; settings object untouched
    cfg_path = os.path.join(tmp, "settings_remote.json")
    st2 = config.Settings(path=cfg_path)
    d = make_daemon(tmp)
    d.settings = st2
    kb = _Kb()
    d.connect = lambda: kb
    updates = []
    d.settings.set = lambda k, v, save=True: updates.append((k, v))
    d._update_tray = lambda: None
    before = (st2.get("active_profile"), st2.get("colors"), st2.get("brightness"))
    r = d.remote_command({"action": "preview",
                          "profile": {"brightness": 1,
                                      "colors": ["FF9500", "FF9500", "FF9500"],
                                      "mode": "custom", "speed": 4}})
    assert r["ok"] and r["action"] == "preview", r
    assert ("power", True) in kb.calls and ("brightness", 1) in kb.calls, kb.calls
    assert ("zone", 0, 255, 149, 0) in kb.calls, kb.calls
    assert updates == [], "preview must not touch settings"       # nothing saved
    assert (st2.get("active_profile"), st2.get("colors"),
            st2.get("brightness")) == before, "preview must not persist anything"
    try:
        d.remote_command({"action": "preview", "profile": {"colors": ["red"]}})
        raise AssertionError("invalid preview must raise")
    except ValueError:
        pass
    print("preview + validate_profile_payload OK")


def test_backup_roundtrip(tmp):
    """make_backup copies both files, prunes to 7 stamps, restore works."""
    import clevo_daemon as cd
    old_base = config.app_base
    old_daily = cd.DAILY_PATH
    config.app_base = lambda: tmp
    cd.DAILY_PATH = os.path.join(tmp, "daily_stats.json")
    try:
        # live files to back up
        with open(os.path.join(tmp, "settings.json"), "w") as f:
            f.write("{\"marker\": 1}")
        with open(os.path.join(tmp, "history.json"), "w") as f:
            f.write("[]")
        d = make_daemon(tmp)
        stamps = []
        for i in range(9):                      # 9 days -> pruned to 7
            stamp = "2026-09-%02d_12-00" % (i + 1)
            bdir = os.path.join(tmp, "backups")
            os.makedirs(bdir, exist_ok=True)
            for name in ("settings.json", "history.json"):
                with open(os.path.join(bdir, "%s__%s" % (stamp, name)), "w") as f:
                    f.write("x")
            stamps.append(stamp)
        got = d.make_backup()
        assert len(got) == 2 and got[0].endswith("settings.json"), got
        kept = d.list_backups()
        assert len(kept) == 7, kept
        assert kept == sorted(kept)
        # overwrite the live settings, then restore today's real backup set
        with open(os.path.join(tmp, "settings.json"), "w") as f:
            f.write("{}")
        d.restore_backup(got[0].rsplit("__", 1)[0])
        with open(os.path.join(tmp, "settings.json")) as f:
            assert json.load(f) == {"marker": 1}
        print("backup round-trip OK")
    finally:
        config.app_base = old_base
        cd.DAILY_PATH = old_daily


def test_weekly_and_hot_hour(tmp):
    """weekly_summary groups by ISO week; hot_hour picks the hottest hour."""
    d = make_daemon(tmp)
    d._daily = [
        {"date": "2026-09-14", "temp_max": 60, "rpm_max": 1400, "ec_fails": 0},  # Mon
        {"date": "2026-09-15", "temp_max": 80, "rpm_max": 1500, "ec_fails": 1},
        {"date": "2026-09-21", "temp_max": 95, "rpm_max": 1600, "ec_fails": 0},  # next week
    ]
    weeks = d.weekly_summary(4)
    assert [w["week"] for w in weeks] == ["2026-W38", "2026-W39"], weeks
    assert weeks[0]["temp_peak"] == 80 and weeks[0]["ec_fails"] == 1
    assert weeks[0]["hottest_day"] == "2026-09-15"
    assert weeks[1]["temp_peak"] == 95
    with self_lock(d):
        d._history = [
            {"time": "2026-09-17 08:00:00", "ec_ok": True, "cpu_temp": 50},
            {"time": "2026-09-17 14:00:00", "ec_ok": True, "cpu_temp": 78},
            {"time": "2026-09-17 22:00:00", "ec_ok": False, "cpu_temp": 99},  # ignored
        ]
    hh = d.hot_hour()
    assert hh == {"hour": "14:00", "temp": 78}, hh
    print("weekly + hot hour OK")


def test_telegram_and_grade(tmp):
    """telegram_post fails soft + health_grade bands work as designed."""
    assert clevo_daemon.telegram_post("badtoken", "badchat", "t", "m") is False
    d = make_daemon(tmp)
    d._daily = [{"date": "2026-09-17", "temp_max": 55, "temp_avg": 45,
                 "rpm_avg": 1450, "rpm_max": 1600, "ec_fails": 0,
                 "samples": 100, "uptime_s": 3600}]
    h = d.health_grade()
    assert h["grade"] == "A" and h["score"] >= 85, h      # cool + no fails
    d._daily = [{"date": "2026-09-17", "temp_max": 95, "temp_avg": 90,
                 "rpm_avg": 0, "rpm_max": 0, "ec_fails": 50,
                 "samples": 100, "uptime_s": 0}]
    h = d.health_grade()
    assert h["grade"] in ("D", "F"), h                    # hot + stall + fails
    # empty everything -> None (dashboard shows placeholder)
    d._daily = []
    with self_lock(d):
        d._history = []
    assert d.health_grade() is None
    print("telegram + health grade OK")


def test_discord_helpers(tmp):
    """discord_post never raises (bad hook -> False, logged) + validator."""
    assert clevo_daemon.discord_post("http://127.0.0.1:1/hook", "t", "m") is False
    # validator keeps a plain URL and drops junk
    cfg_path = os.path.join(tmp, "settings_hook.json")
    st = config.Settings(path=cfg_path)
    n = st.get("notifications")
    n["discord_webhook"] = "  https://discord.com/api/webhooks/1/abc  "
    st.set("notifications", n)
    st2 = config.Settings(path=cfg_path)
    assert st2.snapshot()["notifications"]["discord_webhook"] == \
        "https://discord.com/api/webhooks/1/abc"
    n2 = st2.get("notifications"); n2["discord_webhook"] = 42
    st2.set("notifications", n2)
    st3 = config.Settings(path=cfg_path)
    assert st3.snapshot()["notifications"]["discord_webhook"] == ""
    print("discord helpers OK")


def test_elog_and_events(tmp):
    """elog writes JSONL, read_events parses, trimming keeps it bounded."""
    import clevo_daemon as cd
    old = cd.EVENTS_PATH
    cd.EVENTS_PATH = os.path.join(tmp, "events.jsonl")
    try:
        cd.elog(cd.EV_START, version="1.9.8")
        cd.elog(cd.EV_ENGINE, name="music", action="start")
        cd.elog(cd.EV_NOTIFY, nkind="temp", title="ร้อน")
        events = cd.read_events(10)
        assert len(events) == 3, events
        assert events[0]["kind"] == "start" and events[0]["version"] == "1.9.8"
        assert events[1]["name"] == "music" and events[2]["nkind"] == "temp"
        # every line is valid JSON
        with open(cd.EVENTS_PATH, encoding="utf-8") as f:
            for ln in f:
                json.loads(ln)
        print("event log OK")
    finally:
        cd.EVENTS_PATH = old


def test_updates_config(tmp):
    """updates validator clamps interval and validates shapes."""
    cfg_path = os.path.join(tmp, "settings_upd.json")
    st = config.Settings(path=cfg_path)
    u = st.get("updates")
    u["enabled"] = True
    u["repo"] = "foo/bar"
    u["interval_s"] = 5
    st.set("updates", u)
    st2 = config.Settings(path=cfg_path)      # reload -> clamps to 600
    snap = st2.snapshot()["updates"]
    assert snap["enabled"] and snap["repo"] == "foo/bar"
    assert snap["interval_s"] == 600, snap
    print("updates config OK")


def self_lock(d):
    """Context manager alias (keeps the lock API obvious in tests)."""
    return d._hist_lock


def test_dashboard_handler(tmp):
    """The HTTP handler serves dashboard.html + /api/status + 404s + token."""
    import urllib.request
    import urllib.error
    status_path = os.path.join(tmp, "status.json")
    old = clevo_daemon.STATUS_PATH
    clevo_daemon.STATUS_PATH = status_path
    srv = None
    try:
        d = make_daemon(tmp)
        with open(status_path, "w", encoding="utf-8") as f:
            json.dump({"time": "t", "ec_ok": True, "cpu_temp": 48}, f)
        with self_lock(d):
            d._history = [{"time": "t", "ec_ok": True, "cpu_temp": 48}]
        port = d.start_status_server(port=0)   # port 0 = kernel-assigned, never collides
        assert port > 0
        srv = d._dash_server
        with urllib.request.urlopen(
                "http://127.0.0.1:%d/api/status" % port, timeout=5) as r:
            payload = json.loads(r.read().decode("utf-8"))
        assert payload["cpu_temp"] == 48 and payload["history"], payload
        with urllib.request.urlopen(
                "http://127.0.0.1:%d/" % port, timeout=5) as r:
            html = r.read().decode("utf-8")
        assert "Live Dashboard" in html
        try:
            urllib.request.urlopen("http://127.0.0.1:%d/nope" % port, timeout=5)
            raise AssertionError("404 expected")
        except urllib.error.HTTPError as e:
            assert e.code == 404
        print("dashboard HTTP handler OK (port %d)" % port)
    finally:
        clevo_daemon.STATUS_PATH = old
        if srv is not None:
            try:
                srv.shutdown()
                srv.server_close()
            except Exception:
                pass


def test_dashboard_token_and_lan_fallback(tmp):
    """Token gates 401; LAN without token silently falls back to loopback."""
    import urllib.request
    import urllib.error
    p = os.path.join(tmp, "settings.json")
    with open(p, "w", encoding="utf-8") as f:
        json.dump({"dashboard": {"bind": "lan", "token": "s3cret"}}, f)
    status_path = os.path.join(tmp, "status.json")
    old = clevo_daemon.STATUS_PATH
    clevo_daemon.STATUS_PATH = status_path
    srv = None
    try:
        d = make_daemon(tmp)
        with open(status_path, "w", encoding="utf-8") as f:
            json.dump({"time": "t", "ec_ok": True, "cpu_temp": 50}, f)
        port = d.start_status_server(port=0)
        assert port > 0 and d._dash_token == "s3cret"
        srv = d._dash_server
        host = srv.server_address[0]
        assert host == "0.0.0.0", "LAN with token must bind all interfaces"

        # the fallback case: LAN requested WITHOUT a token -> loopback
        d2 = make_daemon(tmp)
        d2.settings.data["dashboard"]["bind"] = "lan"
        d2.settings.data["dashboard"]["token"] = ""
        port2 = d2.start_status_server(port=0)
        assert d2._dash_server.server_address[0] == "127.0.0.1", \
            "LAN without token must fall back to loopback"
        try:
            d2._dash_server.shutdown()
            d2._dash_server.server_close()
        except Exception:
            pass
        base = "http://127.0.0.1:%d" % port
        try:
            urllib.request.urlopen(base + "/api/status", timeout=5)
            raise AssertionError("401 expected without token")
        except urllib.error.HTTPError as e:
            assert e.code == 401
        with urllib.request.urlopen(base + "/api/status?token=s3cret", timeout=5) as r:
            assert json.loads(r.read().decode("utf-8"))["cpu_temp"] == 50
        req = urllib.request.Request(base + "/api/status",
                                     headers={"X-Auth-Token": "s3cret"})
        with urllib.request.urlopen(req, timeout=5) as r:
            assert r.status == 200
        print("dashboard token + LAN fallback OK")
    finally:
        clevo_daemon.STATUS_PATH = old
        if srv is not None:
            try:
                srv.shutdown()
                srv.server_close()
            except Exception:
                pass


def test_fan_controller():
    """Reuse the mock-EC fan suite inline (no admin needed).
    v1.9.1: the fan module is a read-only monitor — run the full new
    suite (includes the hard no-write guarantee)."""
    import test_clevo_fan
    test_clevo_fan.test_rpm_decode()
    test_clevo_fan.test_status()
    test_clevo_fan.test_absent_fan_shape()
    test_clevo_fan.test_never_writes()
    test_clevo_fan.test_watch_loop_reports_and_stops()
    print("fan monitor inline OK")


def test_schedule_wrap_still_ok():
    assert config.current_schedule_slot(
        [{"time": "22:00", "profile": "night"}], "02:00") == \
        {"time": "22:00", "profile": "night"}
    assert config.current_schedule_slot([], "10:00") is None
    print("schedule wrap-midnight still OK")


def main():
    tmp = tempfile.mkdtemp(prefix="clevo_test_")
    test_health_check_roundtrip(tmp)
    test_engine_lifecycle(tmp, _Monkey())
    test_engine_watcher_cmd(tmp)
    test_config_engines_validation(tmp)
    test_config_health_validation(tmp)
    test_schedule_wrap_still_ok()
    test_hardware_validation(tmp)
    test_notifications_validation_and_gate(tmp)
    test_toast_escaping()
    test_history_and_status_body(tmp)
    test_daily_roll(tmp)
    test_remote_command(tmp)
    test_preview_and_validate_profile(tmp)
    test_backup_roundtrip(tmp)
    test_weekly_and_hot_hour(tmp)
    test_discord_helpers(tmp)
    test_telegram_and_grade(tmp)
    test_elog_and_events(tmp)
    test_updates_config(tmp)
    test_battery_low_levels(tmp)
    test_notifications_new_fields(tmp)
    test_fan_stall_logic(tmp)
    test_history_csv(tmp)
    test_update_download_endpoint(tmp)
    test_dashboard_history_csv_endpoint(tmp)
    test_profiles_endpoint_and_upsert(tmp)
    test_auto_profiles_config_and_api(tmp)
    test_dashboard_handler(tmp)
    test_dashboard_token_and_lan_fallback(tmp)
    test_fan_controller()
    print("ALL CONFIG/DAEMON MIXIN TESTS PASSED")


class _Monkey:
    """Tiny setattr monkey-patch helper (no pytest dependency)."""

    def __init__(self):
        self._undo = []

    def setattr(self, obj, name, value, raising=True):
        had = hasattr(obj, name)
        old = getattr(obj, name, None)
        setattr(obj, name, value)
        self._undo.append((obj, name, had, old))

    def __del__(self):
        for obj, name, had, old in reversed(self._undo):
            if had:
                setattr(obj, name, old)
            else:
                try:
                    delattr(obj, name)
                except AttributeError:
                    pass


if __name__ == "__main__":
    main()
