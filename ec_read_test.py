import sys, traceback
sys.path.insert(0, r"C:\_Project\backlight_controller_intended_for_Clevo")
log = open(r"C:\_Project\backlight_controller_intended_for_Clevo\ec_read_test.log", "w", encoding="utf-8")

def p(*a):
    s = " ".join(str(x) for x in a)
    print(s)
    log.write(s + "\n")
    log.flush()

try:
    from clevo_ec import WinRing0, EC
    io = WinRing0()
    p("WinRing0 opened OK")
    ec = EC(io)
    # safe register dump of KB-LED area + mailbox state
    for reg in list(range(0x02, 0x0D)) + [0xF8, 0xF9, 0xFA, 0xFB, 0xFC]:
        try:
            v = ec.read(reg)
            p(f"EC RAM 0x{reg:02X} = 0x{v:02X}")
        except Exception as e:
            p(f"EC RAM 0x{reg:02X} FAILED: {e}")
    io.close()
    p("DONE")
except Exception as e:
    p("ERROR:", e)
    traceback.print_exc(file=log)
log.close()
