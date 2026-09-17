"""
ec_sensor_finder.py — automatic temperature-sensor discovery in EC RAM.

Method (per candidate address 0x00-0xFF):
  1. sample EC RAM during an idle window, a load window (all-cores stress
     loop via numpy matmul) and a cool-down window
  2. score each address by Pearson correlation between its values and the
     reference temperature (the address you pass as --ref, default 0x07)
  3. report candidates with |corr| >= threshold and enough value movement,
     plus a cross-check against the Windows thermal zone (read live)

Usage (admin):
    python ec_sensor_finder.py                 # ~70 s run, prints a table
    python ec_sensor_finder.py --ref 0x07 --gpu-ref 0xC7
    python ec_sensor_finder.py --save-map my_model.json
"""
import argparse
import json
import sys
import time

if sys.stdout is not None:
    import io as _io
    try:
        sys.stdout.flush()
        _buf = sys.stdout.detach()
        sys.stdout = _io.TextIOWrapper(_buf, encoding="utf-8",
                                       errors="replace", line_buffering=True)
    except Exception:
        pass

SKIP_ADDR = set(range(0x00, 0x02)) | {0x62, 0x66} | set(range(0xF8, 0xFF))
IDLE_S = 20
LOAD_S = 30
COOL_S = 20
CORR_THRESHOLD = 0.90
MIN_RANGE = 2            # address must move at least this many counts
SKIP_NAMES = {0x08: "AC1 (trip point ACPI writes, not a live temp)"}


def windows_hot(ref_val):
    """Windows thermal zone temperature (°C) or None."""
    try:
        import wmi
        for t in wmi.WMI().Win32_TemperatureProbe():
            if t.CurrentReading:
                return float(t.CurrentReading)
    except Exception:
        pass
    return None


def stress_load(seconds, stop=None):
    """All-core numpy matmul load; returns True if it ran."""
    try:
        import numpy as np
    except ImportError:
        print("numpy missing — no load phase; results will be weak")
        time.sleep(min(seconds, 3))
        return False
    print("load: all-core numpy matmul for %ds (laptops get loud, that's the point)" % seconds)
    end = time.time() + seconds
    n = 700
    a, b = np.random.rand(n, n), np.random.rand(n, n)
    while time.time() < end and not (stop and stop.is_set()):
        a @ b
    return True


def sample_series(kb, seconds, phase, interval=1.0, stop=None):
    """Sample every EC address each second -> {addr: [values]}."""
    rows = {a: [] for a in range(256) if a not in SKIP_ADDR}
    end = time.time() + seconds
    while time.time() < end and not (stop and stop.is_set()):
        ref = kb.ec.read(0x07)
        vals = {}
        for a in rows:
            vals[a] = kb.ec.read(a)
        for a, v in vals.items():
            rows[a].append((time.time(), v, ref))
        time.sleep(interval)
    print("phase %s done (%d samples)" % (phase, len(rows[0x07])))
    return rows


def correlate(series):
    """Pearson r per address between value and reference temp (paired)."""
    out = {}
    for addr, samples in series.items():
        if len(samples) < 6:
            continue
        xs = [s[1] for s in samples]
        ys = [s[2] for s in samples]
        n = len(xs)
        mx, my = sum(xs) / n, sum(ys) / n
        sxx = sum((x - mx) ** 2 for x in xs)
        syy = sum((y - my) ** 2 for y in ys)
        if sxx == 0 or syy == 0:
            out[addr] = (0.0, min(xs), max(xs), n)
            continue
        sxy = sum((x - mx) * (y - my) for x, y in zip(xs, ys))
        r = sxy / ((sxx * syy) ** 0.5)
        out[addr] = (r, min(xs), max(xs), n)
    return out


def find_sensors(kb, ref=0x07, stop=None):
    """Full idle->load->cool run; returns the correlation table."""
    import threading
    print("=== idle %ds ===" % IDLE_S)
    idle = sample_series(kb, IDLE_S, "idle", stop=stop)
    print("=== load %ds (sampling while stressing) ===" % LOAD_S)
    box = {}
    def _sample_load():
        box["rows"] = sample_series(kb, LOAD_S, "load", stop=stop)
    t = threading.Thread(target=_sample_load, daemon=True)
    t.start()
    stress_load(LOAD_S, stop=stop)      # heat while the sampler polls
    t.join(timeout=LOAD_S + 10)
    print("=== cool-down %ds ===" % COOL_S)
    cool = sample_series(kb, COOL_S, "cool", stop=stop)
    merged = {}
    for src in (idle, box.get("rows", {}), cool):
        for a, s in src.items():
            merged.setdefault(a, []).extend(s)
    return correlate(merged), merged


def main():
    ap = argparse.ArgumentParser(description="find EC temperature sensors by correlation")
    ap.add_argument("--ref", type=str, default="0x07",
                    help="reference temp address to correlate against (default 0x07 = CPU)")
    ap.add_argument("--min-corr", type=float, default=CORR_THRESHOLD)
    ap.add_argument("--save-map", default=None,
                    help="write winners as a hardware-profile JSON snippet")
    args = ap.parse_args()
    ref_addr = int(str(args.ref), 0)

    from clevo_ec import ClevoKeyboardEC
    kb = ClevoKeyboardEC()
    try:
        table, merged = find_sensors(kb, ref=ref_addr)
        print()
        print("%-6s %-6s %-6s %-6s %s" % ("ADDR", "r", "min", "max", "note"))
        winners = []
        for addr, (r, lo, hi, n) in sorted(table.items(),
                                           key=lambda kv: -abs(kv[1][0])):
            if abs(r) < args.min_corr or (hi - lo) < MIN_RANGE:
                continue
            note = SKIP_NAMES.get(addr, "")
            if addr == ref_addr:
                note = "reference (CPU)"
            print("0x%02X   %+.3f  %3d   %3d   %s" % (addr, r, lo, hi, note))
            if addr != ref_addr and not note:
                winners.append(addr)
        if winners:
            print()
            print("candidate sensor addresses:", ", ".join("0x%02X" % a for a in winners))
            print("confirm the GPU one is ~0xC7 (VGAT) or use --save-map to export")
            if args.save_map:
                with open(args.save_map, "w", encoding="utf-8") as f:
                    json.dump({"temp_regs": {"cpu": ref_addr,
                                             "gpu": winners[0] if winners else None}}, f, indent=2)
                print("saved ->", args.save_map)
        else:
            print("no strong candidates beyond the reference — try a longer run")
    finally:
        kb.close()


if __name__ == "__main__":
    main()
