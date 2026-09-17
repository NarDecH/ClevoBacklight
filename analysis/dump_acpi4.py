import ctypes, struct

k32 = ctypes.WinDLL("kernel32", use_last_error=True)
GSFT = k32.GetSystemFirmwareTable
GSFT.restype = ctypes.c_uint
GSFT.argtypes = [ctypes.c_uint, ctypes.c_uint, ctypes.c_void_p, ctypes.c_uint]

import platform
print("python:", platform.architecture(), platform.machine())

def try_table(sig_txt, oemid_txt=b"\x00\x00\x00\x00"):
    sig = struct.unpack("<I", sig_txt.encode())[0]
    oem = struct.unpack("<I", oemid_txt)[0]
    tid = (sig & 0xFFFFFFFF) | (oem << 32) & 0xFFFFFFFFFFFFFFFF
    # c_uint arg can't hold 64-bit; do two variants: signature-only and full
    for label, tidval in (("sig-only", sig), ("sig+oem", ((oem << 32) | sig) & 0xFFFFFFFFFFFFFFFF)):
        try:
            sz = GSFT(sig, tidval & 0xFFFFFFFF if label == "sig-only" else tidval, None, 0)
        except Exception as e:
            print(sig_txt, label, "exc", e)
            continue
        err = ctypes.get_last_error()
        print(f"{sig_txt} {label}: size={sz} err={err}")
        if sz:
            buf = ctypes.create_string_buffer(sz)
            got = GSFT(sig, tidval & 0xFFFFFFFF if label == "sig-only" else tidval, buf, sz)
            print("   got", got, "header:", buf.raw[:16].hex())
            with open(f"acpi/{sig_txt}.aml", "wb") as f:
                f.write(buf.raw[:got])
            return True
    return False

import os
os.makedirs("acpi", exist_ok=True)

for t in ("DSDT", "FACP", "APIC"):
    try_table(t)
