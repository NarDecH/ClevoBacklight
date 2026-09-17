"""Offline tests for clevo_fan.py — mock EC RAM, no hardware, no admin.

v1.9.1: the module is a read-only MONITOR now (manual fan control was
proven impossible on this EC firmware — the EC rewrites DUT itself and
never feeds it to PWM; see RESEARCH.md). Tests pin the read path AND
guarantee the module can never write to the EC.
"""
import sys

import clevo_fan
from clevo_fan import FanController, _decode_rpm, REG_MODE, REG_DUTY_CPU, REG_DUTY_GPU


class MockEC:
    """Tiny EC RAM image with the fan registers laid out like the real thing."""

    def __init__(self):
        self.ram = bytearray(256)
        self.writes = []                     # every write is recorded
        self.ram[REG_MODE] = 0xFF            # FAN0/FAN1 flag bits set
        self.ram[REG_DUTY_CPU] = 204         # ~80%
        self.ram[REG_DUTY_GPU] = 153         # ~60%
        self.ram[0xD0], self.ram[0xD1] = 0x2E, 0x0B   # 2862 RPM big-endian
        self.ram[0xD2], self.ram[0xD3] = 0x0B, 0x2E   # same, little-endian

    def read(self, reg):
        return self.ram[reg & 0xFF]

    def write(self, reg, value):
        self.writes.append((reg & 0xFF, value & 0xFF))
        self.ram[reg & 0xFF] = value & 0xFF


class MockKB:
    def __init__(self):
        self.ec = MockEC()


def test_rpm_decode():
    assert _decode_rpm(0x2E, 0x0B) == 2862     # big-endian plausible (0x0B2E)
    assert _decode_rpm(0x0B, 0x2E) == 2862     # little-endian plausible (0x0B2E)
    assert _decode_rpm(0xFF, 0xFF) == 0        # nonsense -> 0
    assert _decode_rpm(0x05, 0xDC) == 1500     # 0x05DC = 1500 rpm either way
    print("rpm decode OK")


def test_status():
    fc = FanController(MockKB())
    st = fc.status()
    assert st["cpu"]["duty_pct"] == 80 and st["gpu"]["duty_pct"] == 60, st
    assert st["cpu"]["rpm"] == 2862 and st["gpu"]["rpm"] == 2862, st
    assert st["cpu"]["auto"] and st["gpu"]["auto"], st
    assert st["mode_byte"] == 0xFF, st
    print("status read OK")


def test_absent_fan_shape():
    """A board without a second fan: 0 rpm + 0 duty -> absent line."""
    kb = MockKB()
    kb.ec.ram[REG_DUTY_GPU] = 0
    kb.ec.ram[0xD2] = kb.ec.ram[0xD3] = 0
    st = FanController(kb).status()
    assert st["gpu"]["rpm"] == 0 and st["gpu"]["duty_raw"] == 0
    line = clevo_fan._fan_line("gpu", st["gpu"])
    assert "absent" in line, line
    print("absent-fan shape OK")


def test_never_writes():
    """HARD GUARANTEE: no code path in the monitor may write to the EC.

    Manual control was proven a no-op on this firmware (the EC rewrites
    DUT ~1/s and never uses it for PWM) — a stray write would only add
    EC-bus traffic, so the monitor must be write-free.
    """
    kb = MockKB()
    fc = FanController(kb)
    for _ in range(3):
        fc.status()
    # every legacy entry point must refuse / no-op WITHOUT touching the bus
    for fn in (lambda: fc.set_duty(65, "cpu"),
               lambda: fc.set_duty(99, "both", sticky=True)):
        try:
            fn()
            raise AssertionError("set_duty must raise on this firmware")
        except NotImplementedError:
            pass
    assert fc.restore_auto() is False
    assert fc.stop() is None
    assert fc.manual_active is False
    assert kb.ec.writes == [], \
        "monitor wrote to the EC: %r" % (kb.ec.writes,)
    print("no-write guarantee OK")


def test_watch_loop_reports_and_stops():
    """watch_fan() prints one line per tick and returns on stop event."""
    import io
    import threading
    from contextlib import redirect_stdout

    kb = MockKB()
    fc = FanController(kb)
    stop = threading.Event()
    out = io.StringIO()
    with redirect_stdout(out):
        clevo_fan.watch_fan(fc, interval=0.01, stop_event=stop, _test_ticks=2)
    text = out.getvalue()
    assert "CPU" in text and "GPU" in text, text
    assert kb.ec.writes == [], "watch must not write to the EC"
    print("watch loop OK")


def test_read_fan_once_shape():
    """read_fan_once (daemon health loop payload): flat JSON-ready dict."""
    kb = MockKB()
    snap = clevo_fan.read_fan_once(kb)
    assert snap == {"cpu_rpm": 2862, "gpu_rpm": 2862,
                    "cpu_duty_pct": 80, "gpu_duty_pct": 60}, snap
    assert kb.ec.writes == [], "read_fan_once must not write to the EC"
    print("read_fan_once shape OK")


def test_read_fan_once_mirrored():
    """EC mirror case: identical RPM + identical duty on both channels ->
    the GPU fan is reported as absent (single-fan board), not phantom."""
    kb = MockKB()
    kb.ec.ram[REG_DUTY_GPU] = kb.ec.ram[REG_DUTY_CPU]      # mirror the duty
    kb.ec.ram[0xD2], kb.ec.ram[0xD3] = 0x2E, 0x0B           # mirror the tacho
    snap = clevo_fan.read_fan_once(kb)
    assert snap["cpu_rpm"] == 2862 and snap["gpu_rpm"] == 0, snap
    assert snap["gpu_duty_pct"] == 0, snap
    assert kb.ec.writes == [], "read_fan_once must not write to the EC"
    print("read_fan_once mirror-collapse OK")


def main():
    test_rpm_decode()
    test_status()
    test_absent_fan_shape()
    test_never_writes()
    test_watch_loop_reports_and_stops()
    test_read_fan_once_shape()
    test_read_fan_once_mirrored()
    print("ALL FAN TESTS PASSED")


if __name__ == "__main__":
    main()
