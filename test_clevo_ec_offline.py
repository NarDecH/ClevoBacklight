"""
Offline test for clevo_ec.py — no hardware, no admin needed.
Mocks EC.write to record mailbox operations and asserts each public call
produces exactly the sequence the DSDT's SCMD/0x67 case performs
(decode verified against acpi_table_0_DSDT.dsl lines ~24685-24825).
"""
from clevo_ec import EC, ClevoKeyboardEC


class MockEC(EC):
    def __init__(self):
        self.ops = []
        self.io = None

    def write(self, addr, value):
        self.ops.append((addr & 0xFF, value & 0xFF))


def reset(ec):
    ec.ops = []


def main():
    ec = MockEC()
    kb = ClevoKeyboardEC.__new__(ClevoKeyboardEC)
    kb.io = None
    kb.ec = ec
    import threading
    kb._lock = threading.RLock()      # normally created in __init__

    # power ON (arg 0xE007F001) -> FDAT=0x0C, FBUF=0x3F, FCMD=0xC4
    kb.power_on(True)
    assert ec.ops == [(0xF9, 0x0C), (0xFA, 0x3F), (0xF8, 0xC4)], ec.ops

    # power OFF (arg 0xE0030001) -> FDAT=0x0C, FBUF=0x20, FCMD=0xC4
    reset(ec)
    kb.power_on(False)
    assert ec.ops == [(0xF9, 0x0C), (0xFA, 0x20), (0xF8, 0xC4)], ec.ops

    # brightness 2 -> FDAT=0x06, FBUF=189, FBF1=0, FBF2=189, FCMD=0xCA
    reset(ec)
    kb.set_brightness(2)
    assert ec.ops == [(0xF9, 0x06), (0xFA, 189), (0xFB, 0x00), (0xFC, 189), (0xF8, 0xCA)], ec.ops

    # zone 0, RGB(FF,80,01) -> FDAT=0x03, FBUF=B=01, FBF1=R=FF, FBF2=G=80, FCMD=0xCA
    reset(ec)
    kb.set_zone_color(0, 0xFF, 0x80, 0x01)
    assert ec.ops == [(0xF9, 0x03), (0xFA, 0x01), (0xFB, 0xFF), (0xFC, 0x80), (0xF8, 0xCA)], ec.ops

    # zone 2 -> FDAT=0x05
    reset(ec)
    kb.set_zone_color(2, 0, 0, 0)
    assert ec.ops[0] == (0xF9, 0x05), ec.ops

    # breathe -> FDAT=0x03, FBUF=0x2A, FCMD=0xC4 (single write, no preamble)
    reset(ec)
    kb.set_mode("breathe")
    assert ec.ops == [(0xF9, 0x03), (0xFA, 0x2A), (0xF8, 0xC4)], ec.ops

    # cycle -> FDAT=0x06, FBUF=0x01, FBF1=0x03, FCMD=0xC4
    reset(ec)
    kb.set_mode("cycle")
    assert ec.ops == [(0xF9, 0x06), (0xFA, 0x01), (0xFB, 0x03), (0xF8, 0xC4)], ec.ops

    # wave -> FDAT=0x0B, FCMD=0xC4 (bare flag write, no preamble/payload)
    reset(ec)
    kb.set_mode("wave")
    assert ec.ops == [(0xF9, 0x0B), (0xF8, 0xC4)], ec.ops

    # random -> FDAT=0x07
    reset(ec)
    kb.set_mode("random")
    assert ec.ops == [(0xF9, 0x07), (0xF8, 0xC4)], ec.ops

    # speed 0 (fastest) -> FDAT=0x02, FBUF=0xFF, FCMD=0xC4
    reset(ec)
    kb.set_speed(0)
    assert ec.ops == [(0xF9, 0x02), (0xFA, 0xFF), (0xF8, 0xC4)], ec.ops

    # legacy 9-bit color R=9,G=5,B=13: word=333=0b101001101 -> FDAT=0x4D, FBUF=0x01
    reset(ec)
    kb.set_color_legacy(9, 5, 13)
    assert ec.ops == [(0xF9, 0x4D), (0xFA, 0x01), (0xF8, 0xC2)], ec.ops

    # brightness clamp
    reset(ec)
    kb.set_brightness(9)
    assert ec.ops[1] == (0xFA, 252), ec.ops

    print("ALL OFFLINE PROTOCOL TESTS PASSED")
    print("mailbox protocol matches authoritative DSDT decode: OK")


if __name__ == "__main__":
    main()
