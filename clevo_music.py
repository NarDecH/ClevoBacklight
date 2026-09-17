"""
clevo_music.py — music-reactive mode for the Clevo keyboard backlight.

Reads the system output via WASAPI loopback (no admin needed for audio,
admin IS needed for the EC), analyses it with an FFT and maps the spectrum
onto the three keyboard color zones:

    zone 0 (left)   <- bass   (~20-250 Hz)
    zone 1 (middle) <- mid    (~250-2000 Hz)
    zone 2 (right)  <- treble (~2-16 kHz)

Each zone's brightness pulses with its band's energy (smoothed with an
attack/decay envelope and a beat-spike detector). Colors come from the
current saved zone colors (settings.json); you can also pick a single
"gradient base" color that spreads across the three zones.

CLI:
    python clevo_music.py                 # run with saved colors
    python clevo_music.py --color FF0080  # gradient from one color
    python clevo_music.py --sensitivity 1.5 --floor 0.15
    python clevo_music.py --list-devices
"""
import argparse
import math
import struct
import sys
import threading
import time

if sys.stdout is not None:      # pythonw has no stdout
    import io as _io
    try:
        sys.stdout.flush()
        _buf = sys.stdout.detach()   # old wrapper must not own/close the buffer
        sys.stdout = _io.TextIOWrapper(_buf, encoding="utf-8",
                                       errors="replace", line_buffering=True)
    except Exception:
        pass

import numpy as np

import config

try:
    import soundcard as sc
    HAS_SOUNDCARD = True
except Exception as _e:         # noqa: BLE001
    HAS_SOUNDCARD = False
    _soundcard_err = _e


# ---------------------------------------------------------------- analysis
class SpectrumBands:
    """FFT spectrum -> three normalized band energies with smoothing."""

    def __init__(self, rate, block, floor=0.12, attack=0.55, decay=0.12):
        self.rate = rate
        self.block = block
        self.window = np.hanning(block)
        # pre-compute bin -> band mapping for 48k/16-bit typical layout
        freqs = np.fft.rfftfreq(block, 1.0 / rate)
        self.bass_bins = (freqs >= 20) & (freqs < 250)
        self.mid_bins = (freqs >= 250) & (freqs < 2000)
        self.treb_bins = (freqs >= 2000) & (freqs < 16000)
        self.floor = floor
        self.attack = attack
        self.decay = decay
        self.env = np.zeros(3)
        self.beat = 0.0
        self._noise = np.array([1e-4, 1e-4, 1e-4])   # running noise floor

    def feed(self, samples):
        """samples: float32 mono block in [-1, 1]; returns (bass, mid, treble).

        Uses RMS (sqrt of mean square) per band so narrowband tones are not
        diluted by the width of the treble band (~300 FFT bins)."""
        spec = np.abs(np.fft.rfft(samples * self.window)) / (self.block / 2)
        raw = np.array([
            float(np.sqrt(np.mean(spec[self.bass_bins] ** 2)) * 6.0),
            float(np.sqrt(np.mean(spec[self.mid_bins] ** 2)) * 8.0),
            float(np.sqrt(np.mean(spec[self.treb_bins] ** 2)) * 16.0),
        ])
        # adaptive noise floor (slowly rising minimum) keeps silence dark
        self._noise = np.minimum(self._noise * 1.002 + 1e-7, np.maximum(raw, self._noise))
        norm = np.clip((raw - self._noise) / (0.35 + self._noise * 8), 0.0, 1.0)
        # beat detector: sudden bass jump
        if norm[0] > self.env[0] + 0.30:
            self.beat = 1.0
        self.beat *= 0.80
        # attack/decay envelope
        k = np.where(norm > self.env, self.attack, self.decay)
        self.env = self.env + k * (norm - self.env)
        out = self.env + 0.35 * self.beat
        return np.clip(out, 0.0, 1.0)


def gradient_colors(base_hex):
    """One color -> three zone colors (dark -> bright across the strip)."""
    r, g, b = (int(base_hex[i:i + 2], 16) for i in (0, 2, 4))
    return [tuple(int(c * f) for c in (r, g, b)) for f in (0.45, 0.72, 1.0)]


def list_devices():
    if not HAS_SOUNDCARD:
        print("soundcard not available:", _soundcard_err)
        return
    for m in sc.all_microphones(include_loopback=True):
        tag = "LOOPBACK" if m.isloopback else "input   "
        print(f"{tag}  {m.name}")


# ---------------------------------------------------------------- renderer
class MusicRenderer(threading.Thread):
    """Grabs loopback audio and drives the EC mailbox; stops on .stop()."""

    def __init__(self, kb, colors, *, sensitivity=1.0, floor=0.12,
                 min_interval=0.030, blocksize=1024, device=None):
        super().__init__(daemon=True, name="ClevoMusic")
        self.kb = kb                      # ClevoKeyboardEC (already connected)
        self.base_colors = [tuple(c) for c in colors]   # [(r,g,b)] * 3
        self.sensitivity = sensitivity
        self.floor = floor
        self.min_interval = min_interval
        self.blocksize = blocksize
        self.device = device              # None = default loopback
        self._stop_ev = threading.Event()   # NOT _stop: that shadows Thread._stop()
        self.last_levels = (0.0, 0.0, 0.0)

    def stop(self):
        self._stop_ev.set()

    # ---- one frame: scale saved colors by band energy and write the EC ----
    def _draw(self, bands):
        for z, (r, g, b) in enumerate(self.base_colors):
            e = float(np.clip(bands[z] * self.sensitivity, 0.0, 1.0))
            # never fully dark: 12% floor keeps colors identifiable
            f = self.floor + e * (1.0 - self.floor)
            self.kb.set_zone_color(z, int(r * f), int(g * f), int(b * f))
        self.last_levels = tuple(float(np.clip(b * self.sensitivity, 0, 1))
                                 for b in bands)

    def run(self):
        if not HAS_SOUNDCARD:
            print("soundcard module missing — music mode unavailable", flush=True)
            return
        try:
            mics = sc.all_microphones(include_loopback=True)
            if self.device is None:
                mic = next((m for m in mics if m.isloopback), None)
            else:
                mic = next((m for m in mics
                            if self.device.lower() in m.name.lower()), None)
            if mic is None:
                print("no loopback device found", flush=True)
                return
            with mic.recorder(samplerate=48000, blocksize=self.blocksize) as rec:
                bands = SpectrumBands(48000, self.blocksize,
                                      floor=self.floor)
                last_draw = 0.0
                print(f"music mode: listening to '{mic.name}' — Ctrl+C to stop",
                      flush=True)
                while not self._stop_ev.is_set():
                    data = rec.record(numframes=self.blocksize)   # (n, ch)
                    mono = data.mean(axis=1).astype(np.float32)
                    levels = bands.feed(mono)
                    now = time.perf_counter()
                    if now - last_draw >= self.min_interval:
                        self._draw(levels)
                        last_draw = now
        except Exception as e:  # noqa: BLE001
            print("music renderer error:", e, flush=True)
        finally:
            # restore steady colors so the keyboard is never left mid-pulse
            try:
                for z, (r, g, b) in enumerate(self.base_colors):
                    self.kb.set_zone_color(z, r, g, b)
            except Exception:
                pass


def run_music(colors=None, **kw):
    """Blocking convenience wrapper: apply saved settings, run music, restore."""
    from clevo_ec import ClevoKeyboardEC
    kb = ClevoKeyboardEC()
    try:
        st = config.Settings().snapshot()
        st["power"] = True
        config.apply_state(kb, st)
        if colors is None:
            colors = config.Settings().colors_rgb()
        try:
            kb.power_on(True)
            rend = MusicRenderer(kb, colors, **kw)
            rend.start()
            while rend.is_alive():
                time.sleep(0.2)
        except KeyboardInterrupt:
            print("\nstopped — restoring steady colors", flush=True)
        finally:
            try:
                rend.stop()
            except Exception:
                pass
            time.sleep(0.3)
            for z, (r, g, b) in enumerate(colors):
                kb.set_zone_color(z, r, g, b)
    finally:
        kb.close()


def main():
    p = argparse.ArgumentParser(description="music-reactive keyboard backlight")
    p.add_argument("--color", help="RRGGBB gradient base (else saved zone colors)")
    p.add_argument("--sensitivity", type=float, default=1.0,
                   help="band gain multiplier (default 1.0)")
    p.add_argument("--floor", type=float, default=0.12,
                   help="minimum brightness floor 0-1 (default 0.12)")
    p.add_argument("--interval", type=float, default=0.030,
                   help="min seconds between EC updates (default 0.03)")
    p.add_argument("--device", help="substring of the loopback device name")
    p.add_argument("--list-devices", action="store_true")
    args = p.parse_args()

    if args.list_devices:
        list_devices()
        return

    colors = None
    if args.color:
        h = args.color.lstrip("#").upper()
        if len(h) != 6:
            p.error("--color expects RRGGBB")
        colors = gradient_colors(h)

    try:
        run_music(colors=colors, sensitivity=args.sensitivity,
                  floor=args.floor, min_interval=args.interval,
                  device=args.device)
    except PermissionError as e:
        print("ERROR: need Administrator for EC access:", e)
        sys.exit(1)


if __name__ == "__main__":
    main()
