"""
Hardware test for every effect mode, 10s each (~90s total):
  white base -> random -> dance -> tempo -> flash -> wave ->
  breathe -> cycle -> back to custom white max

Watch the keyboard and note which modes actually animate.
Output -> ec_mode_test.log
"""
import sys, time, traceback
sys.path.insert(0, r"C:\_Project\backlight_controller_intended_for_Clevo")
log = open(r"C:\_Project\backlight_controller_intended_for_Clevo\ec_mode_test.log",
           "w", encoding="utf-8")

def p(*a):
    s = " ".join(str(x) for x in a)
    print(s, flush=True)
    log.write(s + "\n")
    log.flush()

MODES = ["random", "dance", "tempo", "flash", "wave", "breathe", "cycle"]

try:
    from clevo_ec import WinRing0, EC, ClevoKeyboardEC
    io = WinRing0()
    ec = EC(io)
    kb = ClevoKeyboardEC(io, ec)
    HOLD = 10

    p("setup: ON, brightness max, white")
    kb.power_on(True)
    kb.set_brightness(3)
    kb.set_color(255, 255, 255)
    time.sleep(5)

    for i, mode in enumerate(MODES, 1):
        p(f"{i}) mode = {mode}  ({HOLD}s)")
        try:
            kb.set_mode(mode)
            kb.set_speed(2)
        except Exception as exc:
            p(f"   ERROR applying {mode}: {exc}")
            continue
        time.sleep(HOLD)

    p("final: back to custom, white max (stays)")
    kb.set_mode("custom")
    kb.set_color(255, 255, 255)
    kb.set_brightness(3)
    p("DONE")
    io.close()
except Exception as e:
    p("ERROR:", e)
    traceback.print_exc(file=log)
log.close()
