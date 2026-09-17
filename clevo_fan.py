"""clevo_fan.py — fan MONITORING for the Clevo N9xTP6 EC (read-only).

Register map decoded from this machine's DSDT (acpi_table_0_DSDT.dsl,
the "RAM" mirror block at lines 27548+ — the mirror was proven correct
by TMP@0x07 matching the Windows thermal zone exactly):

    0x02  bit1 FAN0 / bit4 FAN1   fan-policy flag bits (informational)
    0xCE  DUT1                    CPU fan duty   (0-255 raw)
    0xCF  DUT2                    GPU fan duty   (0-255 raw)
    0xD0  RPM1 (16-bit)           CPU fan speed
    0xD2  RPM2 (16-bit)           GPU fan speed

Why this is a MONITOR and not a controller (verified on the N957TP6
hardware, 2026-09, see RESEARCH.md "Fan control: proven absent"):

  1. The EC firmware REWRITES the DUT registers on its own about once a
     second (a one-shot 65% write read back 65% once, then the EC pulled
     it back to its ~30% policy within ~1 s).
  2. With a 4 Hz sticky writer (NBFC-style) the register *stayed* at 65%
     for the whole window, but the tachometer never moved (1452 RPM
     flat) — the EC never feeds DUT into the PWM generator. DUT1/DUT2
     are telemetry cells the EC writes for the OS to read, full stop.
  3. The DSDT contains no write path to DUT/RPM anywhere (grep of every
     mailbox case in WMBB: 0x67=KB LED, 0x27=other block write); ACPI
     never writes DUT1/DUT2 either.

Writing anything at 0xCE-0xD3 on this firmware is therefore a no-op at
best. This module only READS. If you are porting this to another Clevo
generation where manual duty works, resurrect the old controller from
git history — this file deliberately keeps the same status() shape.

CLI (also reachable via `clevo_ec.py --fan ...`):
    python clevo_fan.py status
    python clevo_fan.py watch [--interval 1.0]
"""
import argparse
import sys
import time

REG_MODE = 0x02
BIT_CPU_AUTO = 0x02      # FAN0
BIT_GPU_AUTO = 0x10      # FAN1
REG_DUTY_CPU = 0xCE      # DUT1
REG_DUTY_GPU = 0xCF      # DUT2
REG_RPM_CPU = 0xD0       # RPM1, 16-bit
REG_RPM_GPU = 0xD2       # RPM2, 16-bit

RPM_MAX_SANE = 7000


def _decode_rpm(hi, lo):
    """16-bit RPM with endianness auto-detection (plausible value wins)."""
    le = lo | (hi << 8)
    be = hi | (lo << 8)
    for cand in (be, le):
        if 0 < cand <= RPM_MAX_SANE:
            return cand
    return 0


class FanController:
    """Read fan duty/RPM/policy bits on a connected ClevoKeyboardEC.

    The name is kept for GUI/CLI compatibility even though control is
    proven absent on this firmware; every method is read-only.
    """

    def __init__(self, kb, **_ignored):
        self.kb = kb

    # ---- raw ----
    def _read(self, reg):
        return self.kb.ec.read(reg)

    # ---- state ----
    def status(self):
        """Dict with duty %, raw duty, RPM and policy flags for both fans."""
        mode = self._read(REG_MODE)
        raw_c, raw_g = self._read(REG_DUTY_CPU), self._read(REG_DUTY_GPU)
        rpm_c = _decode_rpm(self._read(REG_RPM_CPU), self._read(REG_RPM_CPU + 1))
        rpm_g = _decode_rpm(self._read(REG_RPM_GPU), self._read(REG_RPM_GPU + 1))
        return {
            "cpu": {"duty_pct": round(raw_c * 100 / 255.0), "duty_raw": raw_c,
                    "rpm": rpm_c, "auto": bool(mode & BIT_CPU_AUTO)},
            "gpu": {"duty_pct": round(raw_g * 100 / 255.0), "duty_raw": raw_g,
                    "rpm": rpm_g, "auto": bool(mode & BIT_GPU_AUTO)},
            "mode_byte": mode,
        }

    # ---- compatibility shims (no-ops; old callers still work) ----
    def set_duty(self, *a, **k):
        raise NotImplementedError(
            "manual fan duty is NOT supported on this EC firmware "
            "(EC rewrites DUT and ignores it for PWM — see RESEARCH.md); "
            "use status()/watch() to monitor instead")

    def restore_auto(self):
        """Legacy no-op: the EC always runs its own policy."""
        return False

    def stop(self):
        """No background worker in the monitor."""
        return None

    @property
    def manual_active(self):
        return False


def run_fan_cli(kb, **_ignored):
    """Helper used by clevo_ec.py --fan sub-actions."""
    return FanController(kb)


def _fan_line(which, f):
    if f["duty_raw"] == 0 and f["rpm"] == 0:
        return "%s fan: absent (no second fan on this board)" % which.upper()
    return ("%s fan: %4d rpm  duty %3d%% (raw %3d)  EC-policy flag: %s"
            % (which.upper(), f["rpm"], f["duty_pct"], f["duty_raw"],
               "set" if f["auto"] else "clear"))


def read_fan_once(kb):
    """One-shot fan snapshot for the daemon health loop (JSON-ready dict).

    Shape: {"cpu_rpm", "gpu_rpm", "cpu_duty_pct", "gpu_duty_pct"} —
    an absent fan (0 rpm + 0 duty) simply reports zeros.

    Some EC firmwares (proven on this N9xTP6, 2026-09) mirror the single
    real fan's tacho into BOTH RPM1 and RPM2. When both channels report
    identical non-zero values we treat the GPU channel as absent so the
    dashboard does not show a phantom second fan.
    """
    st = FanController(kb).status()
    mirrored = (0 < st["cpu"]["rpm"] == st["gpu"]["rpm"]
                and st["cpu"]["duty_raw"] == st["gpu"]["duty_raw"])
    gpu = st["gpu"]
    if mirrored:
        gpu = dict(gpu, rpm=0, duty_raw=0, duty_pct=0)
    return {"cpu_rpm": st["cpu"]["rpm"], "gpu_rpm": gpu["rpm"],
            "cpu_duty_pct": st["cpu"]["duty_pct"],
            "gpu_duty_pct": gpu["duty_pct"]}


def watch_fan(fc, interval=1.0, stop_event=None, _test_ticks=None):
    """Poll and print the fan state until stop_event is set (or forever).
    Used by the daemon/dashboard and the `watch` CLI sub-command."""
    ticks = 0
    try:
        while not (stop_event is not None and stop_event.is_set()):
            st = fc.status()
            print(_fan_line("cpu", st["cpu"]), "|", _fan_line("gpu", st["gpu"]))
            ticks += 1
            if _test_ticks is not None and ticks >= _test_ticks:
                return
            time.sleep(max(0.01, interval))
    except KeyboardInterrupt:
        pass


def main():
    ap = argparse.ArgumentParser(description="Clevo fan MONITOR (EC, read-only)")
    sub = ap.add_subparsers(dest="cmd", required=True)
    sub.add_parser("status", help="show duty/RPM once")
    w = sub.add_parser("watch", help="poll continuously")
    w.add_argument("--interval", type=float, default=1.0)
    args = ap.parse_args()

    from clevo_ec import ClevoKeyboardEC
    kb = ClevoKeyboardEC()
    fc = FanController(kb)
    try:
        if args.cmd == "status":
            st = fc.status()
            print(_fan_line("cpu", st["cpu"]))
            print(_fan_line("gpu", st["gpu"]))
            print("mode byte 0x%02X (bit1 FAN0, bit4 FAN1)" % st["mode_byte"])
            return
        if args.cmd == "watch":
            watch_fan(fc, interval=args.interval)
            return
    finally:
        kb.close()


if __name__ == "__main__":
    main()
