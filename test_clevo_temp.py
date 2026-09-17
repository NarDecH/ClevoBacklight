"""Offline tests for the temperature engine: mock EC, no hardware, no admin."""
import sys
import time

import clevo_temp
from clevo_temp import TempRenderer, temp_to_rgb, temp_to_factor


class MockKB:
    """Records set_zone_color calls; ec.read() pops a scripted temp sequence."""

    class _EC:
        def __init__(self, outer):
            self._o = outer

        def read(self, addr):
            v = self._o.temps[min(self._o.i, len(self._o.temps) - 1)]
            self._o.i += 1
            return v

    def __init__(self, temps):
        self.temps = list(temps)
        self.i = 0
        self.ec = MockKB._EC(self)
        self.writes = []

    def set_zone_color(self, z, r, g, b):
        self.writes.append((z, r, g, b))


def test_mappings():
    assert temp_to_rgb(20) == (0, 210, 180)          # below first stop
    assert temp_to_rgb(35) == (0, 210, 180)
    assert temp_to_rgb(50) == (0, 255, 80)
    assert temp_to_rgb(95) == (255, 0, 0)
    assert temp_to_rgb(120) == (255, 0, 0)           # beyond last stop
    mid = temp_to_rgb(56)                             # halfway green->yellow
    assert mid[0] > 100 and mid[1] == 255 and mid[2] < 80, mid
    f_cool, f_hot = temp_to_factor(35), temp_to_factor(85)
    assert abs(f_cool - 0.35) < 1e-9 and abs(f_hot - 1.0) < 1e-9
    print("color/brightness mappings OK (56C ->", mid, ")")


def test_renderer_run_and_alarm():
    kb = MockKB([45, 45, 92, 92, 60, 60, 60, 60, 60, 60])
    rend = TempRenderer(kb, source="cpu", interval=0.05)
    rend.start()
    time.sleep(0.45)
    rend.stop()
    rend.join(timeout=3)
    assert not rend.is_alive(), "renderer did not stop"
    assert kb.writes, "no EC writes happened"
    zs = {w[0] for w in kb.writes}
    assert zs == {0, 1, 2}, zs
    # during the 92C phase there must be a dim blink frame (factor * 0.25)
    dim = [w for w in kb.writes if w[3] < 60 and w[2] < 60]
    assert dim, "expected blinking dim frames at alarm temperature"
    print("renderer loop OK (%d writes, zones %s, alarm blink OK)"
          % (len(kb.writes), sorted(zs)))


def test_invalid_source():
    try:
        TempRenderer(None, source="gpu2")
    except ValueError:
        print("invalid source rejected OK")
        return
    raise AssertionError("invalid source accepted")


if __name__ == "__main__":
    test_mappings()
    test_renderer_run_and_alarm()
    test_invalid_source()
    print("ALL TEMP TESTS PASSED")
