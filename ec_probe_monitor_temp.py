"""
Elevated probe (two parts):

Part M — monitor verification without sleeping:
    find the daemon's hidden message window and PostMessage it the exact
    events Windows sends on resume (PBT_APMRESUMEAUTOMATIC) and display
    change (WM_DISPLAYCHANGE); the daemon should log + re-apply by itself.

Part T — temperature source discovery:
    * DSDT read-back mailbox IDs 0xA1 / 0xA2 (FCMD=0xB8 pattern)
    * EC RAM 0x02..0x0C (Clevo convention: 0x07 CPU / 0x08 GPU temps)
    * Windows ACPI thermal zone (MSAcpi_ThermalZoneTemperature) as cross-check

Log -> ec_probe_monitor_temp.log. Colors are restored after the probes.
"""
import ctypes
import subprocess
import sys
import time
import traceback

sys.path.insert(0, r"C:\_Project\backlight_controller_intended_for_Clevo")

LOG_PATH = r"C:\_Project\backlight_controller_intended_for_Clevo\ec_probe_monitor_temp.log"
logf = open(LOG_PATH, "w", encoding="utf-8")


def p(*a):
    s = " ".join(str(x) for x in a)
    print(s, flush=True)
    logf.write(s + "\n")
    logf.flush()


user32 = ctypes.WinDLL("user32", use_last_error=True)
WM_POWERBROADCAST = 0x0218
PBT_APMRESUMEAUTOMATIC = 0x12
WM_DISPLAYCHANGE = 0x007E

try:
    # ---------------- Part M ----------------
    p("== Part M: daemon monitor window ==")
    # message-only windows: look up by CLASS (title lookup returns 0 here)
    hwnd = user32.FindWindowW("ClevoBacklightDaemon", None)
    if not hwnd:
        hwnd = user32.FindWindowW(None, "ClevoBacklightDaemon")
    if not hwnd:
        p("FAIL  daemon window not found (is the daemon running?)")
    else:
        p("ok    window found: 0x%X" % hwnd)
        user32.PostMessageW(hwnd, WM_POWERBROADCAST, PBT_APMRESUMEAUTOMATIC, 0)
        p("sent  WM_POWERBROADCAST (resume)")
        time.sleep(6)
        user32.PostMessageW(hwnd, WM_DISPLAYCHANGE, 0, 0)
        p("sent  WM_DISPLAYCHANGE")
        time.sleep(4)

    p("--- daemon.log tail ---")
    try:
        with open(r"C:\_Project\backlight_controller_intended_for_Clevo\dist\daemon.log",
                  "r", encoding="utf-8") as f:
            for line in f.read().splitlines()[-8:]:
                p("  " + line)
    except OSError as e:
        p("  log read failed:", e)

    # ---------------- Part T ----------------
    p("")
    p("== Part T: temperature sources ==")
    from clevo_ec import ClevoKeyboardEC
    import config
    kb = ClevoKeyboardEC()
    st = config.Settings().snapshot()
    st["power"] = True
    config.apply_state(kb, st)

    p("mailbox read-back (DSDT FCMD=0xB8 pattern):")
    for ident in (0xA1, 0xA2):
        try:
            v = kb.read_reg(ident, via_fdat=True)
            p("  ID 0x%02X -> 0x%02X (%d)" % (ident, v, v))
        except Exception as e:
            p("  ID 0x%02X -> ERROR %r" % (ident, e))

    p("EC RAM 0x02..0x0C:")
    try:
        for reg, v in kb.dump_regs().items():
            p("  0x%02X -> 0x%02X (%d)" % (reg, v, v))
    except Exception as e:
        p("  dump failed:", e)

    try:
        kb.power_on(bool(st.get("power", True)))
        config.apply_state(kb, st)
        p("colors restored")
    finally:
        kb.close()

    p("ACPI thermal zone (Windows):")
    try:
        out = subprocess.run(
            ["powershell", "-NoProfile", "-Command",
             "Get-CimInstance -Namespace root/wmi -ClassName MSAcpi_ThermalZoneTemperature "
             "| ForEach-Object { '{0}: {1:N1} C' -f $_.InstanceName, ($_.CurrentTemperature/10-273.15) }"],
            capture_output=True, text=True, timeout=20)
        for line in (out.stdout or "").strip().splitlines():
            p("  " + line)
        if out.returncode != 0 and not out.stdout:
            p("  (unavailable: %s)" % (out.stderr or "").strip()[:120])
    except Exception as e:
        p("  thermal zone query failed:", e)

    p("DONE")
except Exception as e:
    p("ERROR:", e)
    traceback.print_exc(file=logf)
logf.close()
sys.exit(0)
