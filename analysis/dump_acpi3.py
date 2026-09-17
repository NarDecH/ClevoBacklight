import ctypes, struct

k32 = ctypes.WinDLL("kernel32", use_last_error=True)
EnumSystemFirmwareTables = k32.EnumSystemFirmwareTables
EnumSystemFirmwareTables.restype = ctypes.c_uint
EnumSystemFirmwareTables.argtypes = [ctypes.c_uint, ctypes.c_void_p, ctypes.c_uint]

for prov in (b"ACPI", b"FIRM"):
    sig = struct.unpack("<I", prov)[0]
    size = EnumSystemFirmwareTables(sig, None, 0)
    err = ctypes.get_last_error()
    print(prov.decode(), "size=", size, "err=", err)
    if size:
        buf = ctypes.create_string_buffer(size)
        got = EnumSystemFirmwareTables(sig, buf, size)
        print("  got", got)
        for i in range(got // 12):
            s, tid, rev = struct.unpack("<III", buf.raw[i*12:(i+1)*12])
            print("   ", struct.pack("<I", s).decode("ascii", "replace"),
                  hex(tid), rev)
