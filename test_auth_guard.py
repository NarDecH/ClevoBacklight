"""
test_auth_guard.py — offline tests for the v1.9.12 AuthGuard + HTTP wiring.

No real EC, no admin: uses make_daemon-style construction against a temp dir.
Covers the rate limiter itself and the start_status_server wiring (429 on
blocked IPs, 401 failures logged as auth_fail events, notify dedup).
"""
import json
import os
import sys
import tempfile
import threading
import time
import urllib.error
import urllib.request

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import clevo_daemon
import config


def make_daemon(tmp):
    """Same pattern as test_config_and_daemon.make_daemon: real Settings
    from the temp dir, no real __init__ (no EC/tray/threads)."""
    st = config.Settings(path=os.path.join(tmp, "settings.json"))
    d = clevo_daemon.Daemon.__new__(clevo_daemon.Daemon)
    d.settings = st
    d.kb = None
    d.lock = threading.Lock()
    d.running = True
    d.tray = None
    d.engines = {}
    d._engine_cmd = None
    d._fan_stall_notified = False
    d._auto_state = ""                    # v1.9.20 status fields
    d._auto_lock = threading.Lock()
    d._auto_last_msg = None
    d._auto_last_ts = 0.0
    d._auto_last_exe = ""
    d._start_time = time.time()
    d._health_stop = threading.Event()
    d._history = []
    d._hist_lock = threading.Lock()
    d._dash_server = None
    d._dash_port = 0
    d.log_lines = []
    d.auth_guard = clevo_daemon.AuthGuard(d)
    return d


def test_guard_logic():
    g = clevo_daemon.AuthGuard(daemon=None)
    ip = "10.0.0.9"
    # under the limit: every check passes, failures just accumulate
    for i in range(clevo_daemon.AuthGuard.LIMIT - 1):
        assert g.check(ip), "not blocked before the limit"
        g.fail(ip)
    assert g.check(ip), "still not blocked at LIMIT-1"
    # the failure that trips the limit
    g.fail(ip)
    assert not g.check(ip), "blocked right after the LIMITth failure"
    # a different IP is unaffected
    assert g.check("10.0.0.8"), "other IPs must not be blocked"
    # expiry: move the block into the past
    g.blocked[ip] = 0.0
    assert g.check(ip), "block must expire"
    # fails reset after a fresh window: trip it again from zero
    for i in range(clevo_daemon.AuthGuard.LIMIT):
        g.fail(ip)
    assert not g.check(ip), "re-block after a fresh series"
    print("guard logic OK (limit=%d window=%.0fs block=%.0fs)"
          % (clevo_daemon.AuthGuard.LIMIT, clevo_daemon.AuthGuard.WINDOW,
             clevo_daemon.AuthGuard.BLOCK_S))


def test_http_wiring():
    tmp = tempfile.mkdtemp(prefix="clevo_auth_")
    p = os.path.join(tmp, "settings.json")
    with open(p, "w", encoding="utf-8") as f:
        json.dump({"dashboard": {"bind": "loopback", "token": "kw123"}}, f)
    status_path = os.path.join(tmp, "status.json")
    old_status = clevo_daemon.STATUS_PATH
    old_events = clevo_daemon.EVENTS_PATH
    clevo_daemon.STATUS_PATH = status_path
    clevo_daemon.EVENTS_PATH = os.path.join(tmp, "events.jsonl")
    srv = None
    try:
        d = make_daemon(tmp)
        with open(status_path, "w", encoding="utf-8") as f:
            json.dump({"time": "t", "ec_ok": True, "cpu_temp": 50}, f)
        port = d.start_status_server(port=0)
        srv = d._dash_server
        base = "http://127.0.0.1:%d" % port

        # 3 bad attempts (below LIMIT) -> 401 each, logged
        for _ in range(3):
            try:
                urllib.request.urlopen(base + "/api/status?token=wrong", timeout=5)
                raise AssertionError("401 expected")
            except urllib.error.HTTPError as e:
                assert e.code == 401
        # a missing token is also a 401 (and must also be logged)
        try:
            urllib.request.urlopen(base + "/api/status", timeout=5)
            raise AssertionError("401 expected")
        except urllib.error.HTTPError as e:
            assert e.code == 401
        # good token still accepted (IP not blocked yet)
        with urllib.request.urlopen(base + "/api/status?token=kw123", timeout=5) as r:
            assert r.status == 200

        # fill up to the limit -> blocked (suppress the toast for this test)
        g = d.auth_guard
        g._notified_until = time.monotonic() + 3600
        ip = "127.0.0.1"
        for _ in range(clevo_daemon.AuthGuard.LIMIT - len(g.fails.get(ip, []))):
            g.fail(ip)
        assert not g.check(ip)

        # blocked IP now gets 429 (guard) — even with the RIGHT token
        try:
            urllib.request.urlopen(base + "/api/status?token=kw123", timeout=5)
            raise AssertionError("429 expected for a blocked IP")
        except urllib.error.HTTPError as e:
            assert e.code == 429, "expected 429, got %s" % e.code

        # unblock, then verify events.jsonl got auth_fail rows
        with g.lock:
            g.blocked.pop(ip, None)
        with urllib.request.urlopen(base + "/api/status?token=kw123", timeout=5) as r:
            assert r.status == 200
        events = [json.loads(ln) for ln in open(clevo_daemon.EVENTS_PATH,
                                                encoding="utf-8") if ln.strip()]
        fails = [e for e in events if e.get("kind") == "notify"
                 and e.get("nkind") == "auth_fail"]
        assert fails, "auth_fail events must be logged"
        assert any(e.get("ip") == "127.0.0.1" for e in fails), \
            "auth_fail events must carry the client IP"

        # notify dedup: two alarms in a row -> only one toast call recorded
        calls = []
        class _Spy:
            def notify(self, *a, **k):
                calls.append(a)
        g2 = clevo_daemon.AuthGuard(daemon=_Spy())
        g2._alarm("1.2.3.4")
        g2._alarm("1.2.3.4")
        assert len(calls) == 1, "alarm must dedup within NOTIFY_EVERY"
        print("guard HTTP wiring OK (401 -> 429 -> events + notify dedup)")
    finally:
        clevo_daemon.STATUS_PATH = old_status
        clevo_daemon.EVENTS_PATH = old_events
        if srv is not None:
            try:
                srv.shutdown()
                srv.server_close()
            except Exception:
                pass


def main():
    test_guard_logic()
    test_http_wiring()
    print("AUTH GUARD TESTS PASSED")
    return 0


if __name__ == "__main__":
    sys.exit(main())
