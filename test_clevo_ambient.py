"""Offline tests for the ambient engine: no screen, no admin, no EC.

Uses a recording mock EC and patches the capture backend with synthetic
strips, then verifies gamma/mix math, smoothing, the run loop and restore.
"""
import sys
import time

import clevo_ambient
from clevo_ambient import AmbientRenderer


class MockKB:
    def __init__(self):
        self.writes = []

    def set_zone_color(self, z, r, g, b):
        self.writes.append((z, r, g, b))


def approx(a, b, tol=6):
    return abs(a - b) <= tol


# ---- 1) gamma + mix math on a white screen with default settings ----
orig_settings = clevo_ambient.config.Settings
class FakeSettings:
    def colors_rgb(self):
        return [(0, 0, 0), (0, 0, 0), (0, 0, 0)]
clevo_ambient.config.Settings = FakeSettings
try:
    kb = MockKB()
    rend = AmbientRenderer(kb, mix=1.0, gamma=1.6)
    rend._draw([(255, 255, 255), (0, 0, 0), (128, 64, 32)])
    # white stays white under gamma
    assert kb.writes[0] == (0, 255, 255, 255), kb.writes
    # black boosted by gamma^(1/1.6): 255 * 0 = 0 -> still dark floor 0
    assert kb.writes[1][1:] == (0, 0, 0), kb.writes
    # (128,64,32): 255*(v/255)^(1/1.6) -> 165.7/107.5/69.7
    r, g, b = kb.writes[2][1:]
    assert approx(r, 166, 4) and approx(g, 108, 4) and approx(b, 70, 4), kb.writes
    print("gamma/mix math OK", kb.writes)

    # ---- 2) mix blending: 50% screen white + 50% saved red ----
    class RedSettings(FakeSettings):
        def colors_rgb(self):
            return [(255, 0, 0), (255, 0, 0), (255, 0, 0)]
    clevo_ambient.config.Settings = RedSettings
    kb2 = MockKB()
    rend2 = AmbientRenderer(kb2, mix=0.5, gamma=1.0)
    rend2._draw([(255, 255, 255), (255, 255, 255), (0, 0, 0)])
    assert kb2.writes[0] == (0, 255, 127, 127), kb2.writes     # int(127.5)=127 (truncation)
    assert kb2.writes[2] == (2, 127, 0, 0), kb2.writes          # half black half red
    print("mix blending OK", kb2.writes)
finally:
    clevo_ambient.config.Settings = orig_settings

# ---- 3) run loop: patched capture -> writes flow, stop() ends it, restore runs ----
orig_grab, orig_size = clevo_ambient.grab_strips, clevo_ambient._screen_size
clevo_ambient.grab_strips = lambda: [(200, 0, 0), (0, 200, 0), (0, 0, 200)]
clevo_ambient._screen_size = lambda: (1920, 1080)

kb3 = MockKB()
rend3 = AmbientRenderer(kb3, mix=1.0, interval=0.05)
rend3.start()
time.sleep(0.6)
rend3.stop()
rend3.join(timeout=3)
assert not rend3.is_alive(), "renderer thread did not stop"
assert len(kb3.writes) >= 3, "expected multiple ambient writes, got %d" % len(kb3.writes)
zs = {w[0] for w in kb3.writes}
assert zs == {0, 1, 2}, zs
# every write within gamut
assert all(0 <= c <= 255 for _, r, g, b in kb3.writes for c in (r, g, b))
print("run loop OK (%d writes across zones %s)" % (len(kb3.writes), sorted(zs)))

# ---- 4) graceful message when no backend exists at all ----
clevo_ambient.grab_strips, clevo_ambient._screen_size = orig_grab, orig_size
saved_mss, saved_pil = clevo_ambient.HAS_MSS, clevo_ambient.HAS_PIL
clevo_ambient.HAS_MSS = False
clevo_ambient.HAS_PIL = False
try:
    kb4 = MockKB()
    rend4 = AmbientRenderer(kb4, interval=0.05)
    rend4.start()
    rend4.join(timeout=2)
    assert not rend4.is_alive()
    assert kb4.writes == [], kb4.writes       # nothing written without a backend
    print("no-backend path OK")
finally:
    clevo_ambient.HAS_MSS, clevo_ambient.HAS_PIL = saved_mss, saved_pil

print("ALL AMBIENT TESTS PASSED")
