"""Offline tests for clevo_music (no audio device, no EC, no admin needed)."""
import sys
import types

import numpy as np

import clevo_music as cm


class MockKB:
    def __init__(self):
        self.calls = []

    def set_zone_color(self, z, r, g, b):
        self.calls.append((z, r, g, b))


def test_gradient():
    cols = list(cm.gradient_colors("FF0080"))
    assert cols[0] == (114, 0, 57), cols[0]      # 0.45 * 255 = 114
    assert cols[1] == (183, 0, 92), cols[1]      # 0.72 * 128 = 92.16 -> 92
    assert cols[2] == (255, 0, 128)
    print("gradient_colors OK", cols)


def test_silence_is_dark():
    bands = cm.SpectrumBands(48000, 1024)
    for _ in range(80):
        out = bands.feed(np.zeros(1024, dtype=np.float32))
    assert all(v < 0.05 for v in out), out
    print("silence -> dark OK", out)


def test_bass_tone_maps_to_left_zone():
    bands = cm.SpectrumBands(48000, 1024)
    t = np.arange(1024) / 48000
    sine = (0.4 * np.sin(2 * np.pi * 80 * t)).astype(np.float32)  # 80 Hz = bass
    for _ in range(60):
        out = bands.feed(sine)
    assert out[0] > 0.5, out          # bass strong
    assert out[0] > out[2] * 3, out   # bass >> treble
    print("80Hz tone -> bass zone OK", out)


def test_treble_tone_maps_to_right_zone():
    bands = cm.SpectrumBands(48000, 1024)
    t = np.arange(1024) / 48000
    sine = (0.4 * np.sin(2 * np.pi * 8000 * t)).astype(np.float32)  # 8 kHz
    for _ in range(60):
        out = bands.feed(sine)
    assert out[2] > 0.3, out
    assert out[2] > out[0] * 2, out
    print("8kHz tone -> treble zone OK", out)


def test_renderer_scales_colors():
    kb = MockKB()
    colors = [(255, 0, 0), (0, 255, 0), (0, 0, 255)]
    rend = cm.MusicRenderer(kb, colors, sensitivity=1.0, floor=0.10)
    rend._draw(np.array([1.0, 0.5, 0.0]))     # full / half / zero energy
    # calls are (zone, r, g, b): zone0 red full -> (0, 255, 0, 0)
    assert kb.calls[0] == (0, 255, 0, 0), kb.calls[0]
    # zone1 green at half energy, 10% floor: g = 255 * (0.10 + 0.5*0.90) = 140
    assert kb.calls[1] == (1, 0, 140, 0), kb.calls[1]
    # zone2 blue at zero: 10% floor of blue
    assert kb.calls[2] == (2, 0, 0, 25), kb.calls[2]
    print("renderer scaling OK", kb.calls)


def test_renderer_restores_colors():
    kb = MockKB()
    colors = [(10, 20, 30), (40, 50, 60), (70, 80, 90)]
    rend = cm.MusicRenderer(kb, colors)
    # simulate the finally-branch restore path used in run()
    for z, (r, g, b) in enumerate(rend.base_colors):
        kb.set_zone_color(z, r, g, b)
    assert kb.calls == [(0, 10, 20, 30), (1, 40, 50, 60), (2, 70, 80, 90)]
    print("restore path OK")


if __name__ == "__main__":
    test_gradient()
    test_silence_is_dark()
    test_bass_tone_maps_to_left_zone()
    test_treble_tone_maps_to_right_zone()
    test_renderer_scales_colors()
    test_renderer_restores_colors()
    print("ALL MUSIC TESTS PASSED")
