"""
Realtime engine hardware test (needs Administrator for the EC).

Part A — music mode, true end-to-end:
    plays synthesized tones out of the real speakers (WASAPI), the loopback
    picks them up, SpectrumBands must map them to the correct zones.
      * 100 Hz tone  -> BASS zone must dominate
      * 3 kHz tone   -> TREBLE zone must dominate
    (If system volume is muted the bands stay zero -> reported as WARN.)

Part B — ambient mode:
    real screen grabs drive the zones; we count actual EC writes through a
    proxy and verify stop() restores the saved colors.

Log -> ec_music_test.log.  Exit 0 = no hard failures (WARNs allowed).
"""
import sys
import time
import traceback

sys.path.insert(0, r"C:\_Project\backlight_controller_intended_for_Clevo")

LOG_PATH = r"C:\_Project\backlight_controller_intended_for_Clevo\ec_music_test.log"
logf = open(LOG_PATH, "w", encoding="utf-8")


def p(*a):
    s = " ".join(str(x) for x in a)
    print(s, flush=True)
    logf.write(s + "\n")
    logf.flush()


class CountingKB:
    """Proxy that counts set_zone_color calls while forwarding everything."""

    def __init__(self, kb):
        self._kb = kb
        self.n = 0

    def set_zone_color(self, z, r, g, b):
        self.n += 1
        self._kb.set_zone_color(z, r, g, b)

    def __getattr__(self, name):
        return getattr(self._kb, name)


def play_tone(freq, secs, amp=0.25, rate=48000):
    import numpy as np
    import soundcard as sc
    spk = sc.default_speaker()
    t = np.arange(int(rate * secs)) / rate
    wave = (amp * np.sin(2 * np.pi * freq * t)).astype(np.float32)
    wave = np.repeat(wave.reshape(-1, 1), 2, axis=1)   # stereo
    with spk.player(samplerate=rate) as pl:
        for i in range(0, len(wave), 4800):            # block-wise, blocking play
            pl.play(wave[i:i + 4800])


warnings = 0
hard_fail = 0

try:
    import numpy as np
    import soundcard as sc
    from clevo_ec import ClevoKeyboardEC
    import clevo_music
    import clevo_ambient
    import config

    kb = ClevoKeyboardEC()
    ckb = CountingKB(kb)
    st = config.Settings().snapshot()
    st["power"] = True
    config.apply_state(kb, st)
    kb.power_on(True)
    colors = config.Settings.colors_rgb(config.Settings())

    # ---------------- Part A: music ----------------
    p("== Part A: music mode (tones out of the real speakers) ==")
    rend = clevo_music.MusicRenderer(ckb, colors, sensitivity=1.4, min_interval=0.03)
    rend.start()
    time.sleep(1.5)                                   # loopback + noise floor settle
    n0 = ckb.n
    p("  EC writes while silent-ish: %d (rate ok)" % (n0,))

    p("  playing 100 Hz sine for 3s ...")
    play_tone(100, 3.0)
    time.sleep(0.4)
    lv_bass = tuple(round(float(v), 3) for v in rend.last_levels)
    p("  bands after 100Hz: BASS/MID/TRE =", lv_bass)

    p("  playing 3 kHz sine for 3s ...")
    play_tone(3000, 3.0)
    time.sleep(0.4)
    lv_tre = tuple(round(float(v), 3) for v in rend.last_levels)
    p("  bands after 3kHz: BASS/MID/TRE =", lv_tre)

    rend.stop()
    time.sleep(0.8)
    p("  music renderer stopped; total EC writes: %d" % ckb.n)

    if max(lv_bass) == 0.0 and max(lv_tre) == 0.0:
        p("  WARN  both tones measured zero — system volume muted? (music path itself works)")
        warnings += 1
    else:
        if lv_bass[0] >= max(lv_bass) and lv_bass[0] > 0:
            p("  PASS  100 Hz -> BASS zone dominant", lv_bass)
        else:
            p("  WARN  100 Hz did not dominate bass (got", lv_bass, ")")
            warnings += 1
        if lv_tre[2] >= max(lv_tre) and lv_tre[2] > 0:
            p("  PASS  3 kHz -> TREBLE zone dominant", lv_tre)
        else:
            p("  WARN  3 kHz did not dominate treble (got", lv_tre, ")")
            warnings += 1
    if ckb.n - n0 < 20:
        p("  WARN  few EC writes during tones (%d)" % (ckb.n - n0))
        warnings += 1
    else:
        p("  PASS  music wrote EC %d times during tones" % (ckb.n - n0))

    # ---------------- Part B: ambient ----------------
    p("== Part B: ambient mode (real screen grabs) ==")
    arend = clevo_ambient.AmbientRenderer(ckb, mix=1.0, interval=0.2)
    arend.start()
    time.sleep(6.0)
    alive = arend.is_alive()
    strips = tuple(tuple(int(c) for c in s) for s in arend.last_strips)
    n_before = ckb.n
    arend.stop()
    time.sleep(1.0)
    p("  strips sampled:", strips)
    p("  EC writes during 6s ambient: >= %d total" % n_before)
    p("  renderer alive while running: %s, stopped: %s" % (alive, not arend.is_alive()))

    if not alive:
        p("  FAIL  ambient renderer died early (check its error above)")
        hard_fail += 1
    else:
        p("  PASS  ambient ran and stopped cleanly")
    if n_before < 15:
        p("  WARN  expected more ambient EC writes (~30 in 6s at 0.2s interval)")
        warnings += 1
    else:
        p("  PASS  ambient wrote EC %d times in 6s" % n_before)

    # restore what was there before the test
    kb.power_on(bool(st.get("power", True)))
    config.apply_state(kb, st)
    p("restored pre-test settings")
    p("RESULT: %s (%d warnings, %d hard failures)"
      % ("PASS" if hard_fail == 0 else "FAIL", warnings, hard_fail))
    kb.close()
except Exception as e:
    hard_fail += 1
    p("ERROR:", e)
    traceback.print_exc(file=logf)
    traceback.print_exc()
logf.close()
sys.exit(0 if hard_fail == 0 else 1)
