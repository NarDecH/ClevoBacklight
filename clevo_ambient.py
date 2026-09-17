"""
clevo_ambient.py — ambient (Ambilight-style) mode for the Clevo keyboard backlight.

Grabs the screen with the Windows DirectX 11 desktop-duplication API
(mss if available, else PIL ImageGrab), splits it into three vertical
strips and maps each strip's average color onto one keyboard zone:

    zone 0 (left)   <- left strip
    zone 1 (middle) <- center strip
    zone 2 (right)  <- right strip

Colors are smoothed (attack/decay) so the keyboard glides instead of
strobing, and the final color is blended with the colors saved in
settings.json ("mix" 0 = saved color, 1 = full screen color).

CLI:
    python clevo_ambient.py                 # run with default settings
    python clevo_ambient.py --mix 0.5       # 50% screen / 50% saved colors
    python clevo_ambient.py --interval 0.15 # faster updates (more CPU)
"""
import argparse
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

import config

try:
    import mss
    HAS_MSS = True
except Exception:
    HAS_MSS = False

try:
    from PIL import ImageGrab
    HAS_PIL = True
except Exception:
    HAS_PIL = False


def _screen_size():
    """(width, height) of the primary monitor."""
    if HAS_MSS:
        with mss.mss() as sct:
            mon = sct.monitors[1]          # primary
            return int(mon["width"]), int(mon["height"])
    if HAS_PIL:
        img = ImageGrab.grab()
        return img.size
    raise RuntimeError("no screen capture backend (install mss or Pillow)")


def grab_strips():
    """Average color of the left/center/right vertical strips -> [(r,g,b)*3].

    Returns None when no capture backend is available.
    """
    if HAS_MSS:
        with mss.mss() as sct:
            mon = sct.monitors[1]
            w, h = int(mon["width"]), int(mon["height"])
            shot = sct.grab(mon)                     # BGRA raw
            img = None                                # built lazily below
            # mss gives raw bytes; convert once per call (BGRA -> RGB handled
            # implicitly by averaging channels: [2]=R, [1]=G, [0]=B)
            raw = shot.rgb                            # mss helper: bytes as RGB
            stride = w * 3
            third = w // 3
            out = []
            for s in range(3):
                x0 = s * third
                x1 = (s + 1) * third if s < 2 else w
                rs = gs = bs = n = 0
                for y in range(0, h, 4):             # sample every 4th row
                    row = raw[y * stride + x0 * 3: y * stride + x1 * 3]
                    rs += sum(row[0::3])
                    gs += sum(row[1::3])
                    bs += sum(row[2::3])
                    n += (x1 - x0)
                if n == 0:
                    out.append((0, 0, 0))
                else:
                    out.append((int(rs / n), int(gs / n), int(bs / n)))
            return out
    if HAS_PIL:
        w, h = ImageGrab.grab().size
        img = ImageGrab.grab().resize((96, 54))      # tiny -> fast averages
        px = img.load()
        third = 96 // 3
        out = []
        for s in range(3):
            x0, x1 = s * third, (s + 1) * third if s < 2 else 96
            rs = gs = bs = n = 0
            for y in range(0, 54, 2):
                for x in range(x0, x1, 2):
                    r, g, b = px[x, y][:3]
                    rs += r; gs += g; bs += b; n += 1
            out.append((int(rs / n), int(gs / n), int(bs / n)))
        return out
    return None


class AmbientRenderer(threading.Thread):
    """Grabs the screen periodically and drives the EC; stops on .stop()."""

    def __init__(self, kb, *, mix=0.35, interval=0.25, gamma=1.6):
        super().__init__(daemon=True, name="ClevoAmbient")
        self.kb = kb
        self.mix = float(mix)             # 0 = saved colors, 1 = pure screen
        self.interval = float(interval)   # seconds between updates
        self.gamma = float(gamma)         # >1 boosts dark scenes
        self.last_strips = [(0, 0, 0)] * 3
        self._stop_ev = threading.Event()   # NOT _stop: that shadows Thread._stop()

    def stop(self):
        self._stop_ev.set()

    def _draw(self, strips):
        st = config.Settings()
        saved = st.colors_rgb()
        for z in range(3):
            sr, sg, sb = strips[z]
            # gamma boost so dark scenes still show a hue
            sr = int(255 * (sr / 255.0) ** (1.0 / self.gamma))
            sg = int(255 * (sg / 255.0) ** (1.0 / self.gamma))
            sb = int(255 * (sb / 255.0) ** (1.0 / self.gamma))
            br, bg, bb = saved[z]
            r = int(br * (1 - self.mix) + sr * self.mix)
            g = int(bg * (1 - self.mix) + sg * self.mix)
            b = int(bb * (1 - self.mix) + sb * self.mix)
            self.kb.set_zone_color(z, r, g, b)
        self.last_strips = list(strips)

    def run(self):
        try:
            _screen_size()
        except Exception as e:
            print("ambient: screen capture unavailable:", e, flush=True)
            return
        # attack/decay smoothing state
        cur = [(0, 0, 0)] * 3
        attack, decay = 0.55, 0.25
        print("ambient mode: mirroring the screen — Ctrl+C to stop", flush=True)
        while not self._stop_ev.is_set():
            t0 = time.perf_counter()
            try:
                strips = grab_strips()
            except Exception as e:
                print("ambient: grab failed:", e, flush=True)
                time.sleep(1.0)
                continue
            if strips is None:
                print("ambient: no capture backend", flush=True)
                break
            nxt = []
            for z in range(3):
                k = [attack if strips[z][c] > cur[z][c] else decay for c in range(3)]
                nxt.append(tuple(int(cur[z][c] + k[c] * (strips[z][c] - cur[z][c]))
                                 for c in range(3)))
            cur = nxt
            try:
                self._draw(cur)
            except Exception as e:
                print("ambient: EC write failed:", e, flush=True)
                break
            wait = self.interval - (time.perf_counter() - t0)
            if wait > 0:
                time.sleep(wait)
        # restore steady saved colors
        try:
            st = config.Settings()
            for z, (r, g, b) in enumerate(st.colors_rgb()):
                self.kb.set_zone_color(z, r, g, b)
        except Exception:
            pass


def run_ambient(mix=0.35, interval=0.25):
    """Blocking convenience wrapper: apply saved settings, run ambient, restore."""
    from clevo_ec import ClevoKeyboardEC
    kb = ClevoKeyboardEC()
    rend = None
    try:
        st = config.Settings().snapshot()
        st["power"] = True
        config.apply_state(kb, st)
        try:
            kb.power_on(True)
            rend = AmbientRenderer(kb, mix=mix, interval=interval)
            rend.start()
            while rend.is_alive():
                time.sleep(0.2)
        except KeyboardInterrupt:
            print("\nstopped — restoring steady colors", flush=True)
        finally:
            if rend is not None:
                try:
                    rend.stop()
                except Exception:
                    pass
            time.sleep(0.4)
            st = config.Settings().snapshot()
            config.apply_state(kb, st)
    finally:
        kb.close()


def main():
    ap = argparse.ArgumentParser(description="ambient (screen color) keyboard backlight")
    ap.add_argument("--mix", type=float, default=0.35,
                    help="0 = saved colors only, 1 = pure screen color (default 0.35)")
    ap.add_argument("--interval", type=float, default=0.25,
                    help="seconds between screen grabs (default 0.25)")
    args = ap.parse_args()
    try:
        run_ambient(mix=args.mix, interval=args.interval)
    except PermissionError as e:
        print("ERROR: need Administrator for EC access:", e)
        sys.exit(1)


if __name__ == "__main__":
    main()
