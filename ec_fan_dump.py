"""ec_fan_dump.py — raw dump of fan EC registers 0xCE-0xD3 + mode 0x02.

Read-only. Samples a few times to see which channel is coherent
(duty vs rpm relationship) and which one reports garbage/noise.
"""
import sys
import time

sys.path.insert(0, __file__.rsplit("\\", 1)[0].rsplit("/", 1)[0] or ".")

from clevo_ec import ClevoKeyboardEC
import clevo_fan

ADDRS = list(range(0xCE, 0xD4))  # DUT1, DUT2, RPM1 hi, RPM1 lo, RPM2 hi, RPM2 lo


def main():
    kb = ClevoKeyboardEC()
    try:
        for i in range(6):
            row = {a: kb.read_reg(a) for a in ADDRS}
            mode = kb.read_reg(0x02)
            rpm1 = clevo_fan._decode_rpm(row[0xD0], row[0xD1])
            rpm2 = clevo_fan._decode_rpm(row[0xD2], row[0xD3])
            print("t%d  mode=0x%02X  DUT1=%3d DUT2=%3d | "
                  "RPM1[0xD0]=%02X %02X ->%4d   RPM2[0xD2]=%02X %02X ->%4d"
                  % (i, mode, row[0xCE], row[0xCF],
                     row[0xD0], row[0xD1], rpm1,
                     row[0xD2], row[0xD3], rpm2))
            if i < 5:
                time.sleep(1.2)
    finally:
        kb.close()


if __name__ == "__main__":
    main()
