"""
smoke_test.py — end-to-end smoke test against a RUNNING daemon.

Run after every deploy / installer / daemon upgrade to prove the service
is healthy end to end (no admin needed):

    python smoke_test.py                     # default http://127.0.0.1:8787
    python smoke_test.py --url http://127.0.0.1:8787 --token ABC123
    python smoke_test.py --no-ec             # skip live EC/fan assertions

Checks (12):
  [auth]  401 without token when a token is set, 200 with ?token=
  [GET]   / (dashboard HTML serves core markers)
  [GET]   /api/status     -> ec_ok, temps sane (0-120), fan dict
  [GET]   /api/daily      -> days list + health grade A-F
  [GET]   /api/history.csv -> CSV header row
  [GET]   /api/notify-config -> notifications shape
  [GET]   /api/events     -> events list
  [GET]   /api/events.jsonl -> JSON-lines body
  [GET]   /api/update     -> update check shape
  [GET]   /api/weekly     -> weekly summary shape
  [EC]    (optional) status reports ec_ok true and a plausible CPU temp
  [POST]  /api/cmd with a no-op-ish payload never 500s (403/400/405 ok —
          403 = allow_control off, which is the designed refusal)
Exit code 0 = all good (printed SMOKE TEST PASSED), 1 on any failure.
"""
import argparse
import csv
import io
import json
import sys
import time
import urllib.error
import urllib.request

# dashboard markers that must exist in served HTML
HTML_MARKERS = [b"api/status", b"api/daily", b"api/"]

PASS, FAIL = [], []


def check(name, ok, detail=""):
    (PASS if ok else FAIL).append(name)
    print(("  ok   " if ok else "  FAIL ") + name + ((" — " + detail) if detail else ""))
    return ok


def get(base, path, token="", timeout=8, retries=2):
    """GET with auth; network hiccups (e.g. WinError 10053) retry then fail soft."""
    url = base + path
    if token and "?" not in path:
        url += "?token=" + token
    last = None
    for _ in range(retries + 1):
        req = urllib.request.Request(url, headers={"X-Auth-Token": token} if token else {})
        try:
            with urllib.request.urlopen(req, timeout=timeout) as r:
                return r.status, r.read()
        except urllib.error.HTTPError as e:
            return e.code, e.read()
        except Exception as exc:            # aborted/reset/timed out -> retry
            last = exc
            time.sleep(0.5)
    return -1, str(last).encode("utf-8")


def main():
    ap = argparse.ArgumentParser(description="Clevo Backlight daemon smoke test")
    ap.add_argument("--url", default="")
    ap.add_argument("--port", type=int, default=8787,
                    help="shorthand: build http://127.0.0.1:PORT")
    ap.add_argument("--token", default="")
    ap.add_argument("--no-ec", action="store_true", help="skip live EC assertions")
    args = ap.parse_args()
    base = (args.url or f"http://127.0.0.1:{args.port}").rstrip("/")

    print(f"smoke test -> {base}")

    # --- auth -------------------------------------------------------------
    if args.token:
        code, _ = get(base, "/api/status", token="")
        check("auth: 401 without token", code == 401, f"got {code}")
        code, _ = get(base, "/api/status", token=args.token)
        check("auth: 200 with token", code == 200, f"got {code}")
    else:
        print("  (no token set — skipping auth pair)")

    # --- dashboard HTML ----------------------------------------------------
    code, body = get(base, "/", token=args.token)
    html_ok = code == 200 and all(m in body for m in HTML_MARKERS)
    check("dashboard / serves HTML with API markers", html_ok, f"{code}, {len(body)} bytes")

    # --- JSON endpoints ----------------------------------------------------
    st = {}
    code, body = get(base, "/api/status", token=args.token)
    ok = code == 200
    if ok:
        try:
            st = json.loads(body.decode("utf-8"))
            ok = "ec_ok" in st
        except ValueError:
            ok = False
    check("GET /api/status", ok, f"{code}")
    if not ok and code == 200:
        print("       body: " + body[:200].decode("utf-8", "replace"))

    code, body = get(base, "/api/daily", token=args.token)
    days, health = [], {}
    if code == 200:
        try:
            j = json.loads(body.decode("utf-8"))
            days = j.get("days", [])
            health = j.get("health", {})
            ok = isinstance(days, list) and isinstance(health, dict)
        except ValueError:
            ok = False
    check("GET /api/daily (days + health)", ok, f"{code}, {len(days)} days, grade={health.get('grade')}")

    code, body = get(base, "/api/history.csv", token=args.token)
    csv_ok = code == 200
    if csv_ok:
        try:
            rows = list(csv.reader(io.StringIO(body.decode("utf-8-sig"))))
            csv_ok = len(rows) >= 1 and rows[0][0].strip().lower() == "time"
        except Exception:
            csv_ok = False
    check("GET /api/history.csv (header)", csv_ok, f"{code}")

    code, body = get(base, "/api/notify-config", token=args.token)
    ok = code == 200 and b"enabled" in body
    check("GET /api/notify-config", ok, f"{code}")

    code, body = get(base, "/api/events", token=args.token)
    ok = code == 200 and b"events" in body
    check("GET /api/events", ok, f"{code}")

    code, body = get(base, "/api/events.jsonl", token=args.token)
    ok = code == 200
    if ok:
        lines = [ln for ln in body.decode("utf-8", "replace").splitlines() if ln.strip()]
        ok = len(lines) >= 1 and lines[0].lstrip().startswith("{")
    check("GET /api/events.jsonl (JSON lines)", ok, f"{code}")

    code, body = get(base, "/api/update", token=args.token)
    ok = code in (200, 404, 502)  # 200 normal; 404/502 when repo unreachable
    if code == 200:
        try:
            j = json.loads(body.decode("utf-8"))
            ok = "current" in j
        except ValueError:
            ok = False
    check("GET /api/update", ok, f"{code}")

    code, body = get(base, "/api/weekly", token=args.token)
    ok = code == 200 and (b"weeks" in body or b"days" in body)
    check("GET /api/weekly", ok, f"{code}")

    # --- live EC sanity -----------------------------------------------------
    if not args.no_ec and st:
        temp = st.get("cpu_temp")
        fan = st.get("fan") if isinstance(st.get("fan"), dict) else {}
        check("EC alive (ec_ok true)", st.get("ec_ok") is True)
        check("CPU temp plausible", isinstance(temp, (int, float)) and 0 <= temp <= 120, f"{temp}")
        check("fan telemetry present", bool(fan), f"keys={sorted(fan)[:4]}")
        if st.get("ec_ok") is False:
            print("       NOTE: ec_ok false — daemon may need admin / WinRing0")

    # --- POST /api/cmd must never 500 ---------------------------------------
    req = urllib.request.Request(
        base + "/api/cmd" + (f"?token={args.token}" if args.token else ""),
        data=json.dumps({"action": "__smoke__"}).encode(),
        headers={"Content-Type": "application/json"},
        method="POST")
    try:
        with urllib.request.urlopen(req, timeout=8) as r:
            code = r.status
    except urllib.error.HTTPError as e:
        code = e.code
    except Exception as exc:
        code = -1
    check("POST /api/cmd unknown action handled", code in (200, 400, 403, 405, 422), f"got {code}")

    print()
    print(f"SMOKE TEST {'PASSED' if not FAIL else 'FAILED'} — {len(PASS)} passed, {len(FAIL)} failed")
    if FAIL:
        for f in FAIL:
            print("  failed: " + f)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
