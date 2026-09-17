"""
clevo_ec.py — Direct EC access for Clevo N9xTP6 (dsanke BIOS) keyboard backlight.

Protocol decoded from THIS machine's own DSDT (acpi_table_0_DSDT.dsl, SCMD case
0x67 at ~line 24685, OperationRegion EC81 at line 27721):

  Mailbox fields (EC81 @ EmbeddedControl base +0xF8):
      FCMD @ 0xF8, FDAT @ 0xF9, FBUF @ 0xFA, FBF1 @ 0xFB, FBF2 @ 0xFC

  WMBB(0, 0x67, ARGS) — subcommand Local7 = (ARGS >> 0x1C) & 0xF:
    0x0  legacy 9-bit color : FDAT=(g|r<<3|b<<6)&0xFF, FBUF=bit8, FCMD=0xC2
    0x1  byte -> reg 0x03   : FDAT=0x03, FBUF=v, FCMD=0xC4   (breathe = v 0x2A)
    0x2  byte -> reg 0x04   : FDAT=0x04, FBUF=v, FCMD=0xC4
    0x3  cycle/all-zones    : FDAT=0x06, FBUF=0x01, FBF1=0x03, FCMD=0xC4
    0x7..B effect flags     : FDAT=flag, FCMD=0xC4   (NO preamble!)
           0x07 random, 0x08 dance, 0x09 tempo, 0x0A flash, 0x0B wave
    0xD  speed              : FDAT=0x02, FBUF=0xFF-(spd*0x19), FCMD=0xC4
    0xE  power              : FDAT=0x0C, FBUF=((ARGS>>0x0E)&0x1F)|(0x20 if ARGS&0x2000)
           standard args: ON 0xE007F001 -> 0x3F, OFF 0xE0030001 -> 0x20
    0xF  zones + brightness (FCMD=0xCA, FBUF/FBF1/FBF2 payload):
           zone color (Local4=ARGS>>0x18 &0xF < 3):
               FDAT=zone+3, FBUF=BLUE, FBF1=RED, FBF2=GREEN
           brightness (Local4==4):
               FDAT=0x06, FBUF=raw, FBF1=0x00, FBF2=raw  (raw 63/126/189/252)

  IMPORTANT: the FDAT values 0x02-0x0C are mailbox REGISTER IDs, not raw EC RAM
  addresses (verified on this machine: EC RAM 0x02-0x0C holds fan/thermal data).

  Read-back (DSDT pattern, e.g. lines 23535/24376): FCMD=0xB8 with the ID in FBUF
  (some sites put it in FDAT), result appears in FDAT.

EC RAM access: standard ITE 8-bit protocol on ports 0x66 (cmd) / 0x62 (data):
  read : cmd 0x80, then address; result from data port (OBF)
  write: cmd 0x81, then address, then value
Kernel access via WinRing0x64.sys (loaded on demand as a service; requires admin).
"""
import ctypes, json, struct, sys, io, os, time
import threading
from contextlib import contextmanager
if sys.stdout is not None:      # pythonw has no stdout
    try:
        sys.stdout.flush()
        _buf = sys.stdout.detach()   # old wrapper must not own/close the buffer
        sys.stdout = io.TextIOWrapper(_buf, encoding="utf-8",
                                      errors="replace", line_buffering=True)
    except Exception:
        pass
from ctypes import wintypes

k32 = ctypes.WinDLL("kernel32", use_last_error=True)
adv32 = ctypes.WinDLL("advapi32", use_last_error=True)

GENERIC_READ  = 0x80000000
GENERIC_WRITE = 0x40000000
SHARE_RW      = 3
OPEN_EXISTING = 3

IOCTL_OLS_WRITE_IO_PORT_BYTE = 0x9C40A0D8  # CTL_CODE(40000, 0x832, METHOD_BUFFERED, FILE_WRITE_ACCESS)
IOCTL_OLS_READ_IO_PORT_BYTE  = 0x9C4060CC  # CTL_CODE(40000, 0x833, METHOD_BUFFERED, FILE_READ_ACCESS)
IOCTL_OLS_GET_DRIVER_VERSION = 0x9C406800  # CTL_CODE(40000, 0x800, METHOD_BUFFERED, FILE_ANY_ACCESS)

SERVICE_KERNEL_DRIVER = 1
SERVICE_DEMAND_START  = 3
SERVICE_START         = 0x0010
SERVICE_STOP          = 0x0020
DELETE                = 0x10000
SC_MANAGER_ALL_ACCESS = 0xF003F


class WinRing0:
    """Ensure WinRing0x64 driver is running; raw port byte read/write via DeviceIoControl."""
    DRIVER_NAME = "WinRing0_1_2_0"
    DEVICE_PATH = r"\\.\WinRing0_1_2_0"

    # ---- cross-process EC mutex (GUI + daemon + CLI may run at once) ----
    def acquire_ec_mutex(self, timeout_ms=1000):
        """Hold 'Global\\ClevoBacklightEC' so two processes never interleave
        an EC transaction mid-mailbox. Returns handle or None (best effort)."""
        k32.CreateMutexW.restype = wintypes.HANDLE
        k32.CreateMutexW.argtypes = [wintypes.LPVOID, wintypes.BOOL, wintypes.LPCWSTR]
        k32.WaitForSingleObject.restype = wintypes.DWORD
        k32.WaitForSingleObject.argtypes = [wintypes.HANDLE, wintypes.DWORD]
        h = k32.CreateMutexW(None, False, "Global\\ClevoBacklightEC")
        if not h:
            return None                      # e.g. non-admin sandbox: degrade gracefully
        wait = k32.WaitForSingleObject(h, timeout_ms)
        if wait not in (0, 0x80):            # 0 = ok, 0x80 = abandoned (previous owner died)
            k32.CloseHandle(h)
            return None
        return h

    def release_ec_mutex(self, h):
        if h:
            try:
                k32.ReleaseMutex(h)
            except Exception:
                pass
            k32.CloseHandle(h)

    # proper ctypes prototypes (avoid 64-bit handle truncation)
    adv32.OpenSCManagerW.restype = wintypes.HANDLE
    adv32.OpenSCManagerW.argtypes = [wintypes.LPCWSTR, wintypes.LPCWSTR, wintypes.DWORD]
    adv32.CreateServiceW.restype = wintypes.HANDLE
    adv32.CreateServiceW.argtypes = [
        wintypes.HANDLE, wintypes.LPCWSTR, wintypes.LPCWSTR, wintypes.DWORD,
        wintypes.DWORD, wintypes.DWORD, wintypes.DWORD, wintypes.LPCWSTR,
        wintypes.LPCWSTR, ctypes.POINTER(wintypes.DWORD), wintypes.LPCWSTR,
        wintypes.LPCWSTR, wintypes.LPCWSTR]
    adv32.OpenServiceW.restype = wintypes.HANDLE
    adv32.OpenServiceW.argtypes = [wintypes.HANDLE, wintypes.LPCWSTR, wintypes.DWORD]
    adv32.StartServiceW.argtypes = [wintypes.HANDLE, wintypes.DWORD, wintypes.LPCWSTR]
    adv32.CloseServiceHandle.argtypes = [wintypes.HANDLE]
    k32.CreateFileW.restype = wintypes.HANDLE
    k32.CreateFileW.argtypes = [
        wintypes.LPCWSTR, wintypes.DWORD, wintypes.DWORD, wintypes.LPVOID,
        wintypes.DWORD, wintypes.DWORD, wintypes.HANDLE]
    k32.DeviceIoControl.argtypes = [
        wintypes.HANDLE, wintypes.DWORD, wintypes.LPVOID, wintypes.DWORD,
        wintypes.LPVOID, wintypes.DWORD, ctypes.POINTER(wintypes.DWORD), wintypes.LPVOID]
    k32.CloseHandle.argtypes = [wintypes.HANDLE]

    def __init__(self, driver_path=None):
        if driver_path is None:
            candidates = []
            if getattr(sys, "frozen", False):      # PyInstaller exe: sys + _MEIPASS
                meipass = getattr(sys, "_MEIPASS", None)
                exe_dir = os.path.dirname(sys.executable)
                if meipass:
                    candidates.append(os.path.join(meipass, "tools", "WinRing0x64.sys"))
                    candidates.append(os.path.join(meipass, "WinRing0x64.sys"))
                candidates.append(os.path.join(exe_dir, "tools", "WinRing0x64.sys"))
                candidates.append(os.path.join(exe_dir, "WinRing0x64.sys"))
            candidates.append(os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                           "tools", "WinRing0x64.sys"))
            driver_path = next((c for c in candidates if os.path.isfile(c)),
                               candidates[-1])   # last one gives a clear not-found error
        self.driver_path = os.path.abspath(driver_path)
        self.h = None
        self._ensure_driver()
        self._open()

    def _ensure_driver(self):
        scm = adv32.OpenSCManagerW(None, None, SC_MANAGER_ALL_ACCESS)
        if not scm:
            raise OSError(f"OpenSCManager failed (run as admin): {ctypes.get_last_error()}")
        svc = None
        try:
            svc = adv32.OpenServiceW(scm, self.DRIVER_NAME,
                                     SERVICE_START | SERVICE_STOP | DELETE | 0x0002 | 0x0004)
            if not svc:
                err = ctypes.get_last_error()
                if not os.path.isfile(self.driver_path):
                    raise FileNotFoundError(f"driver not found: {self.driver_path}")
                svc = adv32.CreateServiceW(
                    scm, self.DRIVER_NAME, None, SERVICE_START | SERVICE_STOP | DELETE,
                    SERVICE_KERNEL_DRIVER, SERVICE_DEMAND_START, 1,
                    self.driver_path, None, None, None, None, None)
                if not svc:
                    err2 = ctypes.get_last_error()
                    if err2 == 1073:  # already exists: reopen
                        svc = adv32.OpenServiceW(scm, self.DRIVER_NAME,
                                                 SERVICE_START | SERVICE_STOP | DELETE)
                        if not svc:
                            raise OSError(f"service exists but cannot open: {ctypes.get_last_error()}")
                    else:
                        raise OSError(f"CreateService failed: {err2}")
            if not adv32.StartServiceW(svc, 0, None):  # no-op if already running
                err3 = ctypes.get_last_error()
                if err3 not in (1056,):  # 1056 = already running
                    raise OSError(f"StartService failed: {err3}")
        finally:
            if svc:
                adv32.CloseServiceHandle(svc)
            adv32.CloseServiceHandle(scm)

    INVALID_HANDLE_VALUE = wintypes.HANDLE(-1).value

    def _open(self):
        h = k32.CreateFileW(self.DEVICE_PATH, GENERIC_READ | GENERIC_WRITE, SHARE_RW,
                            None, OPEN_EXISTING, 0, None)
        if h in (None, self.INVALID_HANDLE_VALUE):
            raise OSError(f"cannot open {self.DEVICE_PATH}: {ctypes.get_last_error()}")
        self.h = h

    def write_port(self, port, value):
        inp = struct.pack("<IB", port, value & 0xFF)
        ret = wintypes.DWORD()
        if not k32.DeviceIoControl(self.h, IOCTL_OLS_WRITE_IO_PORT_BYTE, inp, len(inp),
                                   None, 0, ctypes.byref(ret), None):
            raise OSError(f"write port {port:#x} failed: {ctypes.get_last_error()}")

    def read_port(self, port):
        inp = struct.pack("<I", port)
        out = (ctypes.c_ubyte * 8)()
        ret = wintypes.DWORD()
        if not k32.DeviceIoControl(self.h, IOCTL_OLS_READ_IO_PORT_BYTE, inp, 4,
                                   out, 8, ctypes.byref(ret), None):
            raise OSError(f"read port {port:#x} failed: {ctypes.get_last_error()}")
        return out[0]

    def close(self):
        if self.h and self.h not in (None, self.INVALID_HANDLE_VALUE):
            k32.CloseHandle(self.h)
            self.h = None


class EC:
    """ITE EC RAM access through ports 0x62/0x66 (8-bit addressing, 0x00-0xFF)."""
    CMD_PORT  = 0x66
    DATA_PORT = 0x62

    # mailbox registers (DSDT EC81 field)
    FCMD = 0xF8
    FDAT = 0xF9
    FBUF = 0xFA
    FBF1 = 0xFB
    FBF2 = 0xFC

    def __init__(self, io: WinRing0):
        self.io = io

    def _ibf_clear(self, timeout=20000):
        for _ in range(timeout):
            if not (self.io.read_port(self.CMD_PORT) & 0x02):
                return
        raise TimeoutError("EC IBF never cleared")

    def _obf_set(self, timeout=20000):
        for _ in range(timeout):
            if self.io.read_port(self.CMD_PORT) & 0x01:
                return
        raise TimeoutError("EC OBF never set")

    def _drain_obf(self):
        """Discard stale output bytes so a previous timeout cannot poison the next try."""
        for _ in range(16):
            if not (self.io.read_port(self.CMD_PORT) & 0x01):
                break
            self.io.read_port(self.DATA_PORT)

    def _read_once(self, addr):
        self._drain_obf()
        self._ibf_clear()
        self.io.write_port(self.CMD_PORT, 0x80)   # read EC RAM
        self._ibf_clear()
        self.io.write_port(self.DATA_PORT, addr)
        self._obf_set()
        return self.io.read_port(self.DATA_PORT)

    def _write_once(self, addr, value):
        self._drain_obf()
        self._ibf_clear()
        self.io.write_port(self.CMD_PORT, 0x81)   # write EC RAM
        self._ibf_clear()
        self.io.write_port(self.DATA_PORT, addr)
        self._ibf_clear()
        self.io.write_port(self.DATA_PORT, value & 0xFF)

    PORT_RETRIES = 3

    def read(self, addr):
        addr &= 0xFF
        last = None
        for attempt in range(self.PORT_RETRIES):
            try:
                return self._read_once(addr)
            except TimeoutError as exc:
                last = exc
                time.sleep(0.002 * (attempt + 1))   # brief backoff, then retry
        raise last

    def write(self, addr, value):
        addr &= 0xFF
        last = None
        for attempt in range(self.PORT_RETRIES):
            try:
                return self._write_once(addr, value)
            except TimeoutError as exc:
                last = exc
                time.sleep(0.002 * (attempt + 1))
        raise last

    # ---- mailbox helpers (mirror the DSDT 0x67 case field writes exactly) ----
    def _c2(self):
        """FCMD=0xC2: 9-bit legacy color word (FDAT + FBUF bit8)."""
        self.write(self.FCMD, 0xC2)

    def _c4(self, val, *, fd=0):
        """FCMD=0xC4: FDAT=reg-id, FBUF=value."""
        self.write(self.FDAT, fd)
        self.write(self.FBUF, val & 0xFF)
        self.write(self.FCMD, 0xC4)

    def _c4b(self, fd, v):
        """FCMD=0xC4 with FDAT held from a previous _c4 (effect-flag shape: FDAT=flag)."""
        self.write(self.FBUF, v & 0xFF)
        self.write(self.FCMD, 0xC4)

    def _ca(self, fd, fbuf, fbf1, fbf2):
        """FCMD=0xCA: FDAT=start register id, payload FBUF/FBF1/FBF2."""
        self.write(self.FDAT, fd)
        self.write(self.FBUF, fbuf & 0xFF)
        self.write(self.FBF1, fbf1 & 0xFF)
        self.write(self.FBF2, fbf2 & 0xFF)
        self.write(self.FCMD, 0xCA)

    def read_mailbox(self, ident, *, via_fdat=False):
        """DSDT read-back pattern: FCMD=0xB8 with ident in FBUF (or FDAT), result in FDAT."""
        if via_fdat:
            self.write(self.FDAT, ident & 0xFF)
            self.write(self.FCMD, 0xB8)
        else:
            self.write(self.FBUF, ident & 0xFF)
            self.write(self.FCMD, 0xB8)
        return self.read(self.FDAT)


BRIGHTNESS_RAW = {0: 63, 1: 126, 2: 189, 3: 252}

# effect flags: FDAT=flag, FCMD=0xC4 (Local7 = 0x7..0xB branch — no preamble)
MODE_REGS = {
    "random": 0x07,
    "dance":  0x08,
    "tempo":  0x09,
    "flash":  0x0A,
    "wave":   0x0B,
    "breathe": 0x03,   # special: Local7==1 byte write of 0x2A to reg 0x03
}
BREATHE_VALUE = 0x2A
POWER_ON = 0x3F   # from arg 0xE007F001: ((arg>>0x0E)&0x1F)=0x1F | 0x20
POWER_OFF = 0x20  # from arg 0xE0030001: ((arg>>0x0E)&0x1F)=0x00 | 0x20


class ClevoKeyboardEC:
    def __init__(self, io=None, ec=None):
        self.io = io or WinRing0()
        self.ec = ec or EC(self.io)
        self._lock = threading.RLock()

    @contextmanager
    def _txn(self, timeout_ms=1000):
        """One atomic EC transaction: in-process lock + cross-process mutex.

        Mocked ECs (offline tests) without .io skip the OS mutex gracefully.
        """
        with self._lock:
            mh = None
            try:
                mh = self.io.acquire_ec_mutex(timeout_ms)
            except AttributeError:            # mock io
                pass
            try:
                yield
            finally:
                try:
                    self.io.release_ec_mutex(mh)
                except AttributeError:
                    pass

    # ---- state ----
    def power_on(self, on=True):
        # DSDT 0x0E case: reg 0x0C = 0x3F on / 0x20 off
        with self._txn():
            self.ec._c4(POWER_ON if on else POWER_OFF, fd=0x0C)

    def set_brightness(self, level):
        level = max(0, min(3, int(level)))
        raw = BRIGHTNESS_RAW[level]
        # DSDT 0xF Local4==4: FDAT=0x06, FBUF=raw, FBF1=0x00, FBF2=raw, FCMD=0xCA
        with self._txn():
            self.ec._ca(0x06, raw, 0x00, raw)

    def set_brightness_raw(self, raw):
        """Brightness by raw value (DSDT standard steps: 63/126/189/252)."""
        raw = max(0, min(255, int(raw)))
        with self._txn():
            self.ec._ca(0x06, raw, 0x00, raw)

    def set_zone_color(self, zone, r, g, b):
        if zone not in (0, 1, 2):
            raise ValueError("zone must be 0 (left), 1 (mid), 2 (right)")
        # DSDT 0xF Local4<3: FDAT=zone+3, FBUF=blue, FBF1=red, FBF2=green, FCMD=0xCA
        with self._txn():
            self.ec._ca(0x03 + zone, b, r, g)

    def set_color(self, r, g, b):
        with self._txn():
            for zone in (0, 1, 2):
                self.ec._ca(0x03 + zone, b, r, g)

    def set_mode(self, name):
        if name == "custom":
            return  # colors are set individually via set_zone_color
        with self._txn():
            if name == "breathe":
                # Local7==1 byte write: FDAT=0x03, FBUF=0x2A, FCMD=0xC4
                self.ec._c4(BREATHE_VALUE, fd=0x03)
                return
            if name == "cycle":
                # Local7==3: FDAT=0x06, FBUF=0x01, FBF1=0x03, FCMD=0xC4
                self._cycle()
                return
            if name not in MODE_REGS:
                raise ValueError(
                    f"unknown mode {name!r}; valid: "
                    f"{sorted(set(MODE_REGS) | {'custom', 'cycle'})}")
            # Local7 0x7..0xB: FDAT=flag, FCMD=0xC4 — no preamble, no payload
            flag = MODE_REGS[name]
            self.ec.write(self.ec.FDAT, flag)
            self.ec.write(self.ec.FCMD, 0xC4)

    def _cycle(self):
        ec = self.ec
        ec.write(ec.FDAT, 0x06)
        ec.write(ec.FBUF, 0x01)
        ec.write(ec.FBF1, 0x03)
        ec.write(ec.FCMD, 0xC4)

    # ---- EC state inspection ----
    def dump_regs(self):
        with self._txn():
            return {reg: self.ec.read(reg) for reg in range(0x02, 0x0D)}

    def set_speed(self, level):
        """Effect speed 0..9 (0 = fastest); DSDT 0xD case."""
        level = max(0, min(9, int(level)))
        with self._txn():
            self.ec._c4(0xFF - level * 0x19, fd=0x02)

    def set_color_legacy(self, r, g, b):
        """Single-zone 9-bit color (Local7==0, FCMD=0xC2) — older 1-zone machines.

        DSDT: Local0 = (g&7) | (r&7)<<3 | (b&7)<<6  (9-bit word)
              FDAT = Local0 & 0xFF, FBUF = Local0 >> 8, FCMD = 0xC2"""
        w = ((g & 7) | ((r & 7) << 3) | ((b & 7) << 6)) & 0x1FF
        with self._txn():
            self.ec.write(self.ec.FDAT, w & 0xFF)
            self.ec.write(self.ec.FBUF, (w >> 8) & 0xFF)
            self.ec._c2()

    def read_reg(self, ident, via_fdat=False):
        """Read back an LED register via the DSDT FCMD=0xB8 pattern."""
        return self.ec.read_mailbox(ident, via_fdat=via_fdat)

    def close(self):
        io = getattr(self, "io", None)
        if io:
            try:
                io.close()
            except Exception:
                pass


def main():
    import argparse
    p = argparse.ArgumentParser(description="Clevo N957TP6 keyboard backlight (direct EC, dsanke BIOS)")
    p.add_argument("--on", action="store_true", help="power on backlight")
    p.add_argument("--off", action="store_true", help="power off backlight")
    p.add_argument("--brightness", type=int, choices=[0, 1, 2, 3], help="brightness level 0-3")
    p.add_argument("--mode", help="random|dance|tempo|flash|wave|breathe|cycle")
    p.add_argument("--speed", type=int, choices=range(0, 10), metavar="0-9",
                   help="effect speed (0 = fastest, 9 = slowest)")
    p.add_argument("--color", help="RRGGBB hex for all zones, e.g. FF0080")
    p.add_argument("--zone", type=int, choices=[0, 1, 2], help="target single zone for --color")
    p.add_argument("--read", action="store_true", help="dump EC KB-LED registers 0x02-0x0C")
    p.add_argument("--save", action="store_true",
                   help="save the flags given here as startup defaults (settings.json)")
    p.add_argument("--apply-saved", action="store_true",
                   help="re-apply the saved settings from settings.json")
    p.add_argument("--music", action="store_true",
                   help="music-reactive mode (bass/mid/treble -> the three zones)")
    p.add_argument("--sensitivity", type=float, default=1.0,
                   help="music mode gain multiplier (default 1.0)")
    p.add_argument("--profile", help="apply a named color profile (see settings.json 'profiles')")
    p.add_argument("--ambient", action="store_true",
                   help="ambient mode: mirror the screen colors onto the zones")
    p.add_argument("--temp", action="store_true",
                   help="temperature-reactive mode (color follows CPU/GPU heat)")
    p.add_argument("--source", choices=["cpu", "gpu"], default="cpu",
                   help="temperature source for --temp (default cpu)")
    p.add_argument("--mix", type=float, default=0.35,
                   help="ambient mix 0=saved colors, 1=pure screen color (default 0.35)")
    p.add_argument("--interval", type=float, default=None,
                   help="ambient mode: seconds between screen grabs (default 0.25)")
    p.add_argument("--reg", type=str, default=None,
                   help="--temp: EC RAM address override (hex like 0x07 or decimal)")
    p.add_argument("--hardware", action="store_true",
                   help="--temp: respect settings.json 'hardware' (profile / override)")
    p.add_argument("--fan", nargs="?", const="status", default=None,
                   choices=["status", "watch", "auto"],
                   help="fan MONITOR: status / watch (1s poll) / auto (no-op)")
    p.add_argument("--fan-duty", type=str, default=None,
                   help="(removed: manual fan duty is not supported by this EC "
                        "firmware — the EC rewrites DUT and ignores it for PWM; "
                        "use --fan status instead)")
    p.add_argument("--dump-ec", action="store_true",
                   help="dump EC RAM 0x00-0xFF (helps find temp/fan sensors on other Clevo models)")
    p.add_argument("--label", default="",
                   help="--dump-ec: tag for the dump header (e.g. idle / load)")
    p.add_argument("--diff", default=None,
                   help="--dump-ec: baseline JSON from a previous --save-dump")
    p.add_argument("--save-dump", default=None,
                   help="--dump-ec: save this dump as a baseline JSON")
    p.add_argument("--export-csv", nargs="?", const="clevo_history.csv", default=None,
                   metavar="FILE",
                   help="export the daemon history (history.json) to CSV — "
                        "no admin needed (default file: clevo_history.csv)")
    p.add_argument("--list-backups", action="store_true",
                   help="show available daily backup sets (no admin needed)")
    p.add_argument("--export-events", nargs="?", const="clevo_events.jsonl", default=None,
                   metavar="FILE",
                   help="copy the structured event log (events.jsonl) — no admin needed")
    p.add_argument("--restore-backup", metavar="STAMP",
                   help="restore settings.json/history.json from a backup stamp "
                        "(see --list-backups; takes effect on next daemon restart)")
    args = p.parse_args()

    if args.list_backups:
        import clevo_daemon
        stamps = clevo_daemon.Daemon.list_backups(clevo_daemon.Daemon)
        if not stamps:
            print("ยังไม่มี backup (daemon จะทำวันละ 1 ชุดใน backups/)")
        for s in stamps:
            print(s)
        return
    if args.export_events:
        import shutil
        import clevo_daemon
        src = clevo_daemon.EVENTS_PATH
        if not os.path.isfile(src):
            print("ยังไม่มี event log:", src)
            return 1
        shutil.copyfile(src, args.export_events)
        print("events ->", args.export_events)
        return

    if args.restore_backup:
        import clevo_daemon
        d = clevo_daemon.Daemon.__new__(clevo_daemon.Daemon)
        try:
            done = clevo_daemon.Daemon.restore_backup(d, args.restore_backup)
        except ValueError as e:
            print("restore ไม่สำเร็จ:", e)
            return 1
        print("restored:", ", ".join(done) or "(nothing)",
              "— รีสตาร์ท daemon เพื่อใช้ settings ใหม่")
        return

    if args.export_csv:
        import csv as _csv
        import clevo_daemon
        hist_path = clevo_daemon.HISTORY_PATH
        rows = []
        try:
            with open(hist_path, "r", encoding="utf-8") as f:
                data = json.load(f)
            if isinstance(data, list):
                rows = [r for r in data if isinstance(r, dict)]
        except (OSError, ValueError) as e:
            print("อ่าน %s ไม่ได้: %s" % (hist_path, e))
            return 1
        if not rows:
            print("history ว่าง (daemon ยังไม่เคยรัน health loop?) —", hist_path)
            return 1
        with open(args.export_csv, "w", encoding="utf-8-sig", newline="") as f:
            w = _csv.writer(f)
            headers = ["time", "version", "ec_ok", "cpu_temp", "cpu_rpm", "gpu_rpm",
                       "cpu_duty_pct", "gpu_duty_pct", "power", "engines",
                       "seconds_since_last_ok", "error"]
            w.writerow(headers)
            w.writerows(clevo_daemon.history_csv_rows(rows))
        print("exported %d rows -> %s" % (len(rows), args.export_csv))
        return

    kb = ClevoKeyboardEC()
    try:
        if args.dump_ec:
            import clevo_temp
            baseline = None
            if args.diff:
                with open(args.diff, "r", encoding="utf-8") as f:
                    baseline = {int(k): v for k, v in json.load(f).items()}
            print("EC RAM dump%s — %s (โหลดเครื่องหนักแล้ว dump ซ้ำด้วย --diff เพื่อหาเซ็นเซอร์)"
                  % ((" [%s]" % args.label) if args.label else "",
                     time.strftime("%Y-%m-%d %H:%M:%S")))
            rows = clevo_temp.dump_ec(kb, label=args.label, baseline=baseline)
            if args.save_dump:
                with open(args.save_dump, "w", encoding="utf-8") as f:
                    json.dump({str(k): v for k, v in rows.items()}, f)
                print("saved baseline ->", args.save_dump)
            return
        if args.fan or args.fan_duty:
            import clevo_fan
            if args.fan_duty:
                print("--fan-duty ถูกถอดออก: EC ของรุ่นนี้เขียน DUT ทับเองและไม่ใช้ค่านั้นขับ PWM "
                      "(พิสูจน์บนเครื่องจริง — ดู RESEARCH.md) จึงเหลือโหมดมอนิเตอร์อย่างเดียว")
                return 2
            fc = clevo_fan.FanController(kb)
            if args.fan == "watch":
                clevo_fan.watch_fan(fc, interval=1.0)
                return
            if args.fan == "status" or args.fan is None:
                st = fc.status()
                print(clevo_fan._fan_line("cpu", st["cpu"]))
                print(clevo_fan._fan_line("gpu", st["gpu"]))
                return
            if args.fan == "auto":
                print("EC always runs its own fan policy on this firmware "
                      "(manual control unsupported) — nothing to restore")
                return
        if args.read:
            for reg, v in kb.dump_regs().items():
                print(f"EC RAM 0x{reg:02X} = 0x{v:02X}")
            return
        if args.apply_saved:
            import config
            st = config.Settings().snapshot()
            st["power"] = True
            config.apply_state(kb, st)
            print("applied saved settings:", st)
            return
        if args.profile:
            import config
            config.apply_profile(kb, config.Settings(), args.profile)
            print("profile ->", args.profile)
            return
        if args.ambient:
            import clevo_ambient
            print("ambient mode — Ctrl+C to stop")
            clevo_ambient.run_ambient(
                mix=args.mix,
                interval=(args.interval if args.interval is not None else 0.25))
            return
        if args.temp:
            import config
            import clevo_temp
            print("temp mode — Ctrl+C to stop")
            clevo_temp.run_temp(
                source=args.source, reg=args.reg,
                settings=(config.Settings() if args.hardware else None))
            return
        if args.music:
            import clevo_music
            colors = None
            if args.color:
                h = args.color.lstrip("#").upper()
                if len(h) != 6:
                    p.error("--color expects RRGGBB")
                colors = clevo_music.gradient_colors(h)
            print("music mode — Ctrl+C to stop")
            clevo_music.run_music(colors=colors, sensitivity=args.sensitivity)
            return
        if args.save:
            import config
            cfg = config.Settings()
            if args.off:
                cfg.set("power", False)
            else:
                cfg.set("power", True)
            if args.brightness is not None:
                cfg.set("brightness", args.brightness)
            if args.color:
                hexcol = args.color.upper()
                cfg.set("colors", [hexcol] * 3 if args.zone is None else
                       [hexcol if z == args.zone else c
                        for z, c in enumerate(cfg.get("colors"))])
                cfg.set("mode", "custom")
            if args.mode:
                cfg.set("mode", args.mode)
            if args.speed is not None:
                cfg.set("speed", args.speed)
            cfg.save()
            print("saved defaults ->", cfg.path)
            return
        if args.off:
            kb.power_on(False)
            print("backlight OFF")
            return
        if args.on:
            kb.power_on(True)
            print("backlight ON")
        if args.color:
            r, g, b = int(args.color[0:2], 16), int(args.color[2:4], 16), int(args.color[4:6], 16)
            if args.zone is not None:
                kb.set_zone_color(args.zone, r, g, b)
                print(f"zone {args.zone} -> RGB({r},{g},{b})")
            else:
                kb.set_color(r, g, b)
                print(f"all zones -> RGB({r},{g},{b})")
        if args.mode:
            kb.set_mode(args.mode)
            print(f"mode -> {args.mode}")
        if args.brightness is not None:
            kb.set_brightness(args.brightness)
            print(f"brightness -> {args.brightness}")
        if args.speed is not None:
            kb.set_speed(args.speed)
            print(f"speed -> {args.speed}")
        # keep settings.json in sync (daemon/GUI restore what you last set)
        try:
            import config
            cfg = config.Settings()
            if args.off:
                cfg.set("power", False)
            else:
                if args.on:
                    cfg.set("power", True)
                if args.brightness is not None:
                    cfg.set("brightness", args.brightness)
                if args.color:
                    hexcol = args.color.upper()
                    cfg.set("colors", [hexcol] * 3 if args.zone is None else
                            [hexcol if z == args.zone else c
                             for z, c in enumerate(cfg.get("colors"))])
                    cfg.set("mode", "custom")
                if args.mode:
                    cfg.set("mode", args.mode)
                if args.speed is not None:
                    cfg.set("speed", args.speed)
                if args.sensitivity != 1.0:   # remember the last used gain (GUI + daemon)
                    eng = cfg.get("engines")
                    eng["music_sensitivity"] = max(0.1, min(5.0, float(args.sensitivity)))
                    cfg.set("engines", eng)
                cfg.save()
        except Exception:
            pass
        if not any([args.on, args.off, args.color, args.mode, args.brightness is not None,
                    args.speed is not None, args.read, args.dump_ec, args.save,
                    args.apply_saved, args.music, args.profile, args.ambient,
                    args.temp]):
            p.print_help()
    finally:
        kb.close()


if __name__ == "__main__":
    main()
