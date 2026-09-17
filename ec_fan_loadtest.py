"""ec_fan_loadtest.py — which fan channel is real, and how is it encoded?

Read-only. Timeline: 6 s idle -> 12 s all-core load (numpy) -> 8 s cool.
Prints raw bytes at 0xD0-0xD3 every second plus both endianness readings
so we can see which channel tracks the fan and in which direction.
"""
import sys
import threading
import time

sys.path.insert(0, __file__.rsplit("\\", 1)[0].rsplit("/", 1)[0] or ".")

from clevo_ec import ClevoKeyboardEC


def load_burst(seconds):
    """Burn all cores with numpy matmul so the EC ramps the fan up."""
    import numpy as np
    end = time.time() + seconds
    a = np.random.rand(900, 900).astype(np.float32)
    while time.time() < end:
        for _ in range(6):            # a few threads' worth of work
            a @ a
    return


def main():
    kb = ClevoKeyboardEC()
    t = threading.Thread(target=load_burst, args=(12,), daemon=True)
    print("phase     time  DUT1 DUT2 | D0 D1 -> BE    LE  | D2 D3 -> BE    LE")
    t0 = time.time()

    def sample(tag):
        d0, d1 = kb.read_reg(0xD0), kb.read_reg(0xD1)
        d2, d3 = kb.read_reg(0xD2), kb.read_reg(0xD3)
        be1 = d0 * 256 + d1
        le1 = d1 * 256 + d0
        be2 = d2 * 256 + d3
        le2 = d3 * 256 + d2
        print("%-8s %5.1f  %3d  %3d | %02X %02X -> %4d %5d | "
              "%02X %02X -> %4d %5d"
              % (tag, time.time() - t0,
                 kb.read_reg(0xCE), kb.read_reg(0xCF),
                 d0, d1, be1, le1, d2, d3, be2, le2))

    for _ in range(6):                 # idle
        sample("idle"); time.sleep(1)
    t.start()
    for _ in range(12):                # load
        sample("LOAD"); time.sleep(1)
    for _ in range(8):                 # cool
        sample("cool"); time.sleep(1)


if __name__ == "__main__":
    main()
