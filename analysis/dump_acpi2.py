import ctypes, os, struct

k32 = ctypes.WinDLL("kernel32", use_last_error=True)
EnumSystemFirmwareTables = k32.EnumSystemFirmwareTables
EnumSystemFirmwareTables.restype = ctypes.c_uint
EnumSystemFirmwareTables.argtypes = [ctypes.c_uint, ctypes.c_void_p, ctypes.c_uint]
GetSystemFirmwareTable = k32.GetSystemFirmwareTable
GetSystemFirmwareTable.restype = ctypes.c_uint
GetSystemFirmwareTable.argtypes = [ctypes.c_uint, ctypes.c_uint, ctypes.c_void_p, ctypes.c_uint]

ACPI = 0x49504341  # 'ACPI' little-endian

size = EnumSystemFirmwareTables(ACPI, None, 0)
if size == 0:
    raise SystemExit("No ACPI firmware tables enumerable")
buf = ctypes.create_string_buffer(size)
EnumSystemFirmwareTables(ACPI, buf, size)

os.makedirs("acpi", exist_ok=True)
data = buf.raw[:size]
n = len(data) // 12  # each entry: Signature(4) TableID(4) Length(4)... actually Sig+ID+Rev? treat as sig/id pairs
print(f"total bytes {size}, entries {n}")
seen = set()
for i in range(n):
    sig, tid, rev = struct.unpack("<III", data[i*12:(i+1)*12])
    key = (sig, tid)
    if key in seen:
        continue
    seen.add(key)
    sig_txt = struct.pack("<I", sig).decode("ascii", "replace")
    id_txt = struct.pack("<I", tid).decode("ascii", "replace").strip('\x00 \x01\x02')
    tsz = GetSystemFirmwareTable(ACPI, tid, None, 0) if False else 0
    # proper size query uses signature as first DWORD of the table id
    tblid = tid  # for ACPI provider, low DWORD = signature, high = OEM table id prefix? see docs
    # GetSystemFirmwareTable: TableID = DWORD: first 4 bytes signature + 4 bytes OEM ID of table
    real_id = sig | (tid << 32) if False else tid
    sz = GetSystemFirmwareTable(ACPI, tid, None, 0)
    if sz == 0:
        continue
    tb = ctypes.create_string_buffer(sz)
    got = GetSystemFirmwareTable(ACPI, tid, tb, sz)
    fname = f"acpi/{sig_txt}_{id_txt}_{rev}.aml"
    with open(fname, "wb") as f:
        f.write(tb.raw[:got])
    print(f"{sig_txt:4s} id={id_txt!r} rev={rev} len={got} -> {fname}")
