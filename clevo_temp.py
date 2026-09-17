"""
clevo_temp.py — temperature-reactive keyboard backlight.

Reads the CPU/GPU temperature straight from EC RAM (verified on this
machine against the Windows ACPI thermal zone):

    EC RAM 0x07 -> CPU temperature (°C)   [== MSAcpi_ThermalZoneTemperature]
    EC RAM 0xC7 -> GPU temperature (°C)   [DSDT field VGAT in the RAM mirror]

Maps temperature onto a color gradient across all three zones:

    ≤35°C  cool cyan-green, dim        (idle)
    50°C   green
    62°C   yellow
    75°C   orange
    85°C   red-orange
    ≥95°C  saturated red, blinking     (alarm)

Brightness follows heat: ~35% floor when cool, 100% when hot. Color changes
are smoothed so the keyboard glides instead of jumping.

Hardware profiles:
    Sensor addresses live in settings.json under "hardware":
        {"profile": "n957tp6", "temp_reg_override": null}
    - profile selects a per-model map (n957tp6 is the verified built-in)
    - temp_reg_override (0-255) wins over both maps when set

Sensor-hunting tools (for other Clevo models):
    python clevo_temp.py --dump-ec --label idle --save-dump idle.json
    python clevo_temp.py --dump-ec --label load --diff idle.json
    (the addresses whose value tracks the heat are your temp registers)
"""
import argparse
import json
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

# Verified from this machine's DSDT (acpi_table_0_DSDT.dsl, the RAM mirror
# block at lines 27548+ whose offsets mirror EC RAM 1:1 — proven by TMP@0x07
# == MSAcpi_ThermalZoneTemperature):
#   0x07 TMP  = CPU temperature (live)      <- cross-verified vs Windows
#   0xC7 VGAT = GPU (VGA) temperature       <- DSDT field, live temp
#   (0x08 is AC1, a trip-point value ACPI WRITES to the EC — NOT a live
#    temperature; the earlier 'gpu = 0x08' assumption was wrong and is
#    corrected here)
TEMP_REG = {"cpu": 0x07, "gpu": 0xC7}

# Built-in per-model sensor maps (verified against this machine + Windows
# thermal zones + the DSDT RAM-mirror field names). Extend by editing
# settings.json hardware.profile -> a key here, or override the address
# directly with hardware.temp_reg_override.
HW_DEFAULTS = {
    "n957tp6": {
        "display_name": "Clevo N957TP6 / N9xTP6 (dsanke BIOS)",
        "temp_regs": {"cpu": 0x07, "gpu": 0xC7},   # TMP / VGAT per DSDT
    },
}


def hardware_templates():
    """Model keys + display names for GUI dropdowns and validation."""
    return {key: HW_DEFAULTS[key]["display_name"] for key in HW_DEFAULTS}


def resolve_temp_reg(settings, source="cpu"):
    """EC RAM address for a temperature source.

    Order: hardware.temp_reg_override > hardware.profile map > built-in map.
    `settings` may be a config.Settings or a plain snapshot dict.
    """
    hw = (settings.get("hardware") if hasattr(settings, "get") else
          settings.get("hardware", {})) or {}
    regs = HW_DEFAULTS.get(hw.get("profile", ""), {}).get("temp_regs") or TEMP_REG
    override = hw.get("temp_reg_override")
    if override not in (None, ""):
        try:
            return int(str(override), 0)
        except (TypeError, ValueError):
            pass
    return regs.get(source, TEMP_REG.get(source, 0x07))

# (temp_stop, (r, g, b)) — ascending; colors are interpolated between stops
COLOR_STOPS = [
    (35, (0, 210, 180)),    # cool cyan-green
    (50, (0, 255, 80)),     # green
    (62, (255, 255, 0)),    # yellow
    (75, (255, 150, 0)),    # orange
    (85, (255, 60, 0)),     # red-orange
    (95, (255, 0, 0)),      # full red
]
ALARM_TEMP = 90           # above this: blink
ALARM_HZ = 1.0            # blink rate
ZONE_EDGE_DIM = 0.85      # style: left/right zones slightly dimmer


def temp_to_rgb(t):
    """Temperature (°C) -> (r, g, b) via COLOR_STOPS interpolation."""
    if t <= COLOR_STOPS[0][0]:
        return COLOR_STOPS[0][1]
    if t >= COLOR_STOPS[-1][0]:
        return COLOR_STOPS[-1][1]
    for (t0, c0), (t1, c1) in zip(COLOR_STOPS, COLOR_STOPS[1:]):
        if t0 <= t <= t1:
            f = (t - t0) / (t1 - t0)
            return tuple(int(c0[i] + f * (c1[i] - c0[i])) for i in range(3))
    return COLOR_STOPS[-1][1]


def temp_to_factor(t):
    """Temperature -> brightness factor 0.35..1.0 (35..85°C ramp)."""
    f = (max(35, min(85, t)) - 35) / 50.0
    return 0.35 + f * 0.65


class TempRenderer(threading.Thread):
    """Polls the EC temperature register and repaints the zones; .stop() ends it."""

    def __init__(self, kb, *, source="cpu", interval=2.0, reg=None, settings=None):
        super().__init__(daemon=True, name="ClevoTemp")
        if source not in TEMP_REG:
            raise ValueError("source must be 'cpu' or 'gpu'")
        self.kb = kb
        self.source = source
        if reg not in (None, ""):
            self.reg = int(str(reg), 0)          # explicit CLI/GUI override
        elif settings is not None:
            self.reg = resolve_temp_reg(settings, source)
        else:
            self.reg = TEMP_REG[source]
        if not (0 <= self.reg <= 0xFF):
            raise ValueError("reg must be 0-255")
        self.interval = float(interval)
        self.last_temp = None
        self._stop_ev = threading.Event()   # NOT _stop: shadows Thread._stop()

    def stop(self):
        self._stop_ev.set()

    def _read_temp(self):
        return self.kb.ec.read(self.reg)

    def _paint(self, t, now):
        r, g, b = temp_to_rgb(t)
        f = temp_to_factor(t)
        if t >= ALARM_TEMP:                       # alarm blink
            phase = int(now * ALARM_HZ) % 2
            f *= (1.0 if phase else 0.25)
        for z in range(3):
            zf = 1.0 if z == 1 else ZONE_EDGE_DIM
            self.kb.set_zone_color(z, int(r * f * zf),
                                   int(g * f * zf), int(b * f * zf))

    def run(self):
        print("temp mode: source=%s — Ctrl+C to stop" % self.source, flush=True)
        try:
            while not self._stop_ev.is_set():
                try:
                    t = self._read_temp()
                    self.last_temp = t
                    self._paint(t, time.time())
                except Exception as e:            # transient EC hiccup: keep going
                    print("temp mode: read failed:", e, flush=True)
                self._stop_ev.wait(self.interval)
        finally:
            try:
                import config
                st = config.Settings().snapshot()
                config.apply_state(self.kb, st)
            except Exception:
                pass


def read_temp_once(kb, source="cpu", reg=None):
    """Read one temperature sample; reg=None uses the built-in map (or override)."""
    if reg in (None, ""):
        return kb.ec.read(TEMP_REG[source])
    return kb.ec.read(int(str(reg), 0))


def run_temp(source="cpu", interval=2.0, reg=None, settings=None):
    """Blocking convenience wrapper: apply saved settings, run, restore."""
    from clevo_ec import ClevoKeyboardEC
    kb = ClevoKeyboardEC()
    rend = None
    try:
        import config
        st = config.Settings().snapshot()
        st["power"] = True
        config.apply_state(kb, st)
        try:
            kb.power_on(True)
            rend = TempRenderer(kb, source=source, interval=interval,
                                reg=reg, settings=settings)
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


def dump_ec(kb, label="", baseline=None):
    """Print EC RAM 0x00-0xFF (hex + ASCII); mark rows that differ from a
    baseline dict {int_base: [16 values]}. Returns the dump for --save-dump."""
    rows = {}
    for base in range(0, 256, 16):
        rows[base] = [kb.ec.read(base + i) for i in range(16)]
    for base, row in rows.items():
        chg = ""
        if baseline and base in baseline:
            old = baseline[base]
            diff = [i for i in range(min(16, len(old))) if row[i] != old[i]]
            if diff:
                chg = "   changed: " + ", ".join("0x%02X" % (base + i) for i in diff)
            else:
                chg = "   (same)"
        lbl = "  [%s]" % label if (label and base == 0) else ""
        print("0x%02X: %s   %s%s%s"
              % (base, " ".join("%02X" % v for v in row),
                 "".join(chr(v) if 32 <= v < 127 else "." for v in row), chg, lbl))
    return rows


def main():
    ap = argparse.ArgumentParser(description="temperature-reactive keyboard backlight")
    ap.add_argument("--source", choices=["cpu", "gpu"], default="cpu")
    ap.add_argument("--interval", type=float, default=2.0,
                    help="seconds between reads (default 2.0)")
    ap.add_argument("--reg", type=str, default=None,
                    help="override the EC RAM address (hex like 0x07 or decimal)")
    ap.add_argument("--dump-ec", action="store_true",
                    help="dump EC RAM 0x00-0xFF and exit (sensor hunting)")
    ap.add_argument("--label", default="", help="tag shown on the dump header")
    ap.add_argument("--diff", default=None,
                    help="baseline JSON (from --save-dump) to diff against")
    ap.add_argument("--save-dump", default=None,
                    help="save this dump to a JSON file for a later --diff")
    args = ap.parse_args()
    try:
        if args.dump_ec or args.diff or args.save_dump:
            from clevo_ec import ClevoKeyboardEC
            kb = ClevoKeyboardEC()
            try:
                baseline = None
                if args.diff:
                    with open(args.diff, "r", encoding="utf-8") as f:
                        baseline = {int(k): v for k, v in json.load(f).items()}
                print("EC RAM dump%s — %s"
                      % ((" [%s]" % args.label) if args.label else "",
                         time.strftime("%Y-%m-%d %H:%M:%S")))
                rows = dump_ec(kb, label=args.label, baseline=baseline)
                if args.save_dump:
                    with open(args.save_dump, "w", encoding="utf-8") as f:
                        json.dump({str(k): v for k, v in rows.items()}, f)
                    print("saved baseline ->", args.save_dump)
            finally:
                kb.close()
            return
        import config
        run_temp(source=args.source, interval=args.interval, reg=args.reg,
                 settings=config.Settings())
    except PermissionError as e:
        print("ERROR: need Administrator for EC access:", e)
        sys.exit(1)


if __name__ == "__main__":
    main()
