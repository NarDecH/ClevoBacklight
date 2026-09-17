"""
Calibration test: verify color byte order + brightness response.
  1. power on, brightness max
  2. RED   10s
  3. GREEN 10s
  4. BLUE  10s
  5. BLUE brightness ramp 252 -> 189 -> 126 -> 63 (8s each)
  6. try single-reg (0xC4) brightness 252 on BLUE 8s
  7. final: all WHITE max (stays)
Output -> ec_calib_test.log
"""
import sys, time, traceback
sys.path.insert(0, r"C:\_Project\backlight_controller_intended_for_Clevo")
log = open(r"C:\_Project\backlight_controller_intended_for_Clevo\ec_calib_test.log",
           "w", encoding="utf-8")

def p(*a):
    s = " ".join(str(x) for x in a)
    print(s, flush=True)
    log.write(s + "\n")
    log.flush()

def snap(ec, tag):
    vals = {n: ec.read(a) for n, a in
            (("FCMD", 0xF8), ("FDAT", 0xF9), ("FBUF", 0xFA), ("FBF1", 0xFB), ("FBF2", 0xFC))}
    p(f"  [{tag}] " + " ".join(f"{k}={v:02X}" for k, v in vals.items()))

try:
    from clevo_ec import WinRing0, EC, ClevoKeyboardEC
    io = WinRing0()
    ec = EC(io)
    kb = ClevoKeyboardEC(io, ec)

    p("1) power ON + brightness max")
    kb.power_on(True)
    kb.set_brightness(3)
    snap(ec, "on")

    p("2) ALL RED (10s)")
    kb.set_color(255, 0, 0)
    snap(ec, "red")
    time.sleep(10)

    p("3) ALL GREEN (10s)")
    kb.set_color(0, 255, 0)
    snap(ec, "green")
    time.sleep(10)

    p("4) ALL BLUE (10s)")
    kb.set_color(0, 0, 255)
    snap(ec, "blue")
    time.sleep(10)

    for raw in (252, 189, 126, 63):
        p(f"5) BLUE brightness raw={raw} (8s)")
        kb.set_brightness_raw(raw)
        time.sleep(8)

    p("6) BLUE, single-reg brightness 252 via FCMD=0xC4 (8s)")
    ec.write(ec.FDAT, 0x06)
    ec.write(ec.FBUF, 252)
    ec.write(ec.FCMD, 0xC4)
    snap(ec, "c4-bright")
    time.sleep(8)

    p("7) FINAL: all WHITE max (stays)")
    kb.set_brightness(3)
    kb.set_color(255, 255, 255)
    snap(ec, "white")
    p("DONE")
    io.close()
except Exception as e:
    p("ERROR:", e)
    traceback.print_exc(file=log)
log.close()
