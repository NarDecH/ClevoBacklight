import ctypes, struct, os, sys

k32 = ctypes.WinDLL("kernel32", use_last_error=True)
GSFT = k32.GetSystemFirmwareTable
GSFT.restype = ctypes.c_uint
GSFT.argtypes = [ctypes.c_uint, ctypes.c_uint, ctypes.c_void_p, ctypes.c_uint]

out_dir = r"C:\_Project\backlight_controller_intended_for_Clevo\acpi"
os.makedirs(out_dir, exist_ok=True)
log = []

def logln(s):
    log.append(str(s))

def try_table(sig_txt):
    sig = struct.unpack("<I", sig_txt.encode())[0]
    sz = GSFT(sig, 0, None, 0)
    err = ctypes.get_last_error()
    logln(f"{sig_txt}: size={sz} err={err}")
    if sz == 0:
        return False
    buf = ctypes.create_string_buffer(sz)
    got = GSFT(sig, 0, buf, sz)
    err = ctypes.get_last_error()
    logln(f"  got={got} err={err}")
    if got:
        with open(os.path.join(out_dir, f"{sig_txt}.aml"), "wb") as f:
            f.write(buf.raw[:got])
        logln(f"  saved {sig_txt}.aml ({got} bytes), sig={buf.raw[:4]}")
        return True
    return False

for t in ("DSDT", "FACP", "APIC", "MCFG", "HPET", "SSDT"):
    try_table(t)

with open(r"C:\_Project\backlight_controller_intended_for_Clevo\acpi\dump_log.txt", "w") as f:
    f.write("\n".join(log))
