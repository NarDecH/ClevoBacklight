"""
Visual demo test: unambiguous color sequence, 15s per phase.
  1. all RED    (0-15s)
  2. all GREEN  (15-30s)
  3. all BLUE   (30-45s)
  4. OFF / dark (45-60s)
  5. ON all WHITE max (final state, stays)
Logs mailbox snapshot after each step -> ec_power_test.log
"""
import sys, time, traceback
sys.path.insert(0, r"C:\_Project\backlight_controller_intended_for_Clevo")
log = open(r"C:\_Project\backlight_controller_intended_for_Clevo\ec_power_test.log",
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
    HOLD = 15

    p(f"1) ALL RED ({HOLD}s)")
    kb.power_on(True)
    kb.set_brightness(3)
    kb.set_color(255, 0, 0)
    snap(ec, "red")
    time.sleep(HOLD)

    p(f"2) ALL GREEN ({HOLD}s)")
    kb.set_color(0, 255, 0)
    snap(ec, "green")
    time.sleep(HOLD)

    p(f"3) ALL BLUE ({HOLD}s)")
    kb.set_color(0, 0, 255)
    snap(ec, "blue")
    time.sleep(HOLD)

    p(f"4) OFF - dark ({HOLD}s)")
    kb.power_on(False)
    snap(ec, "off")
    time.sleep(HOLD)

    p("5) ON all WHITE max (final state, stays)")
    kb.power_on(True)
    kb.set_brightness(3)
    kb.set_color(255, 255, 255)
    snap(ec, "white")
    p("DONE")
    io.close()
except Exception as e:
    p("ERROR:", e)
    traceback.print_exc(file=log)
log.close()
