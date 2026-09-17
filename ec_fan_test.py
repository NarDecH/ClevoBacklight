"""
ec_fan_test.py — safe hardware test for the fan control path.

Sequence (fully reversible, mode byte restored at the end):
  1. sample CPU/GPU RPM + duty + mode flags while the EC runs its own
     auto policy (5 s)
  2. write manual duty 65% to the CPU fan, sample RPM for 10 s
  3. write manual duty 65% to the GPU fan, sample RPM for 5 s
  4. verify the EC manual bits actually took (auto bits cleared)
  5. restore the ORIGINAL mode byte exactly as first read
  6. final status readout

Every step is printed and appended to fan_test.log next to this script.
Exit code 0 = PASS.
"""
import os
import sys
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import clevo_fan
from clevo_fan import FanController, REG_MODE, BIT_CPU_AUTO, BIT_GPU_AUTO

LOG = os.path.join(os.path.dirname(os.path.abspath(__file__)), "fan_test.log")


def log(msg):
    line = "[%s] %s" % (time.strftime("%H:%M:%S"), msg)
    print(line)
    with open(LOG, "a", encoding="utf-8") as f:
        f.write(line + "\n")


def sample(fc, seconds, label):
    """Sample status once per second; return list of status dicts."""
    rows = []
    t_end = time.time() + seconds
    while time.time() < t_end:
        st = fc.status()
        rows.append(st)
        log("%s  CPU %4d rpm (%3d%%)  GPU %4d rpm (%3d%%)  mode=0x%02X"
            % (label, st["cpu"]["rpm"], st["cpu"]["duty_pct"],
               st["gpu"]["rpm"], st["gpu"]["duty_pct"], st["mode_byte"]))
        time.sleep(1.0)
    return rows


def mean_rpm(rows, which):
    vals = [r[which]["rpm"] for r in rows if r[which]["rpm"] > 0]
    return sum(vals) / len(vals) if vals else 0.0


def main():
    log("=== fan hardware test start ===")
    from clevo_ec import ClevoKeyboardEC
    kb = ClevoKeyboardEC()
    fc = FanController(kb)

    # context: CPU temp from the verified sensor (0x07)
    try:
        cpu_temp = kb.ec.read(0x07)
        log("CPU temp (EC 0x07): %d C" % cpu_temp)
    except Exception as e:
        log("CPU temp read failed: %s" % e)

    # 1) baseline under EC auto policy
    log("-- baseline (EC auto) --")
    base = sample(fc, 5, "auto")
    cpu0, gpu0 = mean_rpm(base, "cpu"), mean_rpm(base, "gpu")
    orig_mode = fc._read(REG_MODE)
    log("original mode byte: 0x%02X (cpu_auto=%s gpu_auto=%s)"
        % (orig_mode, bool(orig_mode & BIT_CPU_AUTO),
           bool(orig_mode & BIT_GPU_AUTO)))

    # 2) manual CPU 65%
    log("-- set CPU duty 65%% (manual) --")
    got = fc.set_duty(65, "cpu")
    log("set_duty -> %d%%" % got)
    cpu_rows = sample(fc, 10, "cpu65")
    cpu1 = mean_rpm(cpu_rows, "cpu")

    # 3) manual GPU 65%
    log("-- set GPU duty 65%% (manual) --")
    got = fc.set_duty(65, "gpu")
    log("set_duty -> %d%%" % got)
    gpu_rows = sample(fc, 5, "gpu65")
    gpu1 = mean_rpm(gpu_rows, "gpu")

    # 4) verify manual bits took
    mode_now = fc._read(REG_MODE)
    manual_ok = (not (mode_now & BIT_CPU_AUTO)) and (not (mode_now & BIT_GPU_AUTO))
    log("mode byte after manual: 0x%02X -> %s"
        % (mode_now, "MANUAL OK" if manual_ok else "AUTO BITS STILL SET!"))

    # 5) restore exactly what we found
    restored = fc.restore_auto()
    mode_after = fc._read(REG_MODE)
    log("restore_auto -> %s ; mode byte now 0x%02X (orig 0x%02X)"
        % (restored, mode_after, orig_mode))
    restore_ok = restored and mode_after == orig_mode

    # 6) final status
    log("-- final status --")
    sample(fc, 2, "final")

    # ---- verdict ----
    failures = []
    if cpu0 == 0 and gpu0 == 0:
        failures.append("no RPM reported on either fan (register map wrong?)")
    if not manual_ok:
        failures.append("EC did not accept manual mode bits")
    if not restore_ok:
        failures.append("auto mode byte was not restored exactly")
    if cpu0 and cpu1 and cpu1 < cpu0 * 0.5:
        failures.append("CPU RPM collapsed under manual duty (unexpected)")
    if gpu0 and gpu1 and gpu1 < gpu0 * 0.5:
        failures.append("GPU RPM collapsed under manual duty (unexpected)")

    log("CPU rpm: auto avg %.0f -> manual65 avg %.0f" % (cpu0, cpu1))
    log("GPU rpm: auto avg %.0f -> manual65 avg %.0f" % (gpu0, gpu1))
    if failures:
        for f in failures:
            log("FAIL: " + f)
        log("=== RESULT: FAIL (%d) ===" % len(failures))
        sys.exit(1)
    log("=== RESULT: PASS — manual duty accepted, RPM live, auto restored ===")


if __name__ == "__main__":
    main()
