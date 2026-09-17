"""
Elevated write test: validates the mailbox protocol end-to-end.

1. sets brightness to dimmest (63)  — visible, instantly reversible
2. tries the DSDT read-back patterns for reg id 0x06
3. restores brightness to mid (189)

Only touches brightness (reg id 0x06). No colors, no modes, no power changes.
Output -> ec_write_test.log
"""
import sys, time, traceback
sys.path.insert(0, r"C:\_Project\backlight_controller_intended_for_Clevo")
log = open(r"C:\_Project\backlight_controller_intended_for_Clevo\ec_write_test.log",
           "w", encoding="utf-8")

def p(*a):
    s = " ".join(str(x) for x in a)
    print(s)
    log.write(s + "\n")
    log.flush()

try:
    from clevo_ec import WinRing0, EC, ClevoKeyboardEC
    io = WinRing0()
    ec = EC(io)
    kb = ClevoKeyboardEC(io, ec)

    p("step 1: brightness -> 63 (dimmest)")
    kb.set_brightness(0)
    p("  sent: FDAT=0x06 FBUF=63 FBF1=0 FBF2=63 FCMD=0xCA")

    p("step 2: holding 10s (watch the keyboard!)...")
    time.sleep(10)

    p("step 3: mailbox read-back attempts for brightness reg")
    try:
        p("  via FBUF id 0x06 -> FDAT =", hex(ec.read_mailbox(0x06)))
    except Exception as e:
        p("  via FBUF failed:", e)
    try:
        p("  via FDAT id 0x06 -> FDAT =", hex(ec.read_mailbox(0x06, via_fdat=True)))
    except Exception as e:
        p("  via FDAT failed:", e)

    p("step 4: restore brightness -> 189 (mid)")
    kb.set_brightness(2)
    p("DONE")
    io.close()
except Exception as e:
    p("ERROR:", e)
    traceback.print_exc(file=log)
log.close()
