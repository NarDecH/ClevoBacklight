import pefile, struct, re
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

path = r"C:\Users\NarDech\AppData\Local\Temp\InsydeDCHU.dll"
pe = pefile.PE(path)
base = pe.OPTIONAL_HEADER.ImageBase
data = pe.get_memory_mapped_image()

exports = {e.name.decode(): base + e.address for e in pe.DIRECTORY_ENTRY_EXPORT.symbols}
print("exports:", {k: hex(v) for k, v in exports.items()})

md = Cs(CS_ARCH_X86, CS_MODE_64)
md.detail = False

def disasm(rva_start, length=400, label=""):
    print(f"----- {label} @ {hex(rva_start)} -----")
    code = data[rva_start:rva_start+length]
    for ins in md.disasm(code, base + rva_start):
        print(f"{ins.address:#x}  {ins.mnemonic} {ins.op_str}")

for name in ("SetDCHU_Data", "SetDCHU_DataEx", "GetDCHU_Data_Integer"):
    va = exports[name]
    disasm(va - base, 500, name)

# scan all sections for ASCII/UTF16 GUID strings
raw = open(path, "rb").read()
guid_rx = re.compile(rb"\{[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}\}")
print("--- GUID strings (ascii) ---")
for m in guid_rx.finditer(raw):
    print(m.group().decode())
print("--- GUID strings (utf16) ---")
u16 = raw
for m in guid_rx.finditer(u16):
    pass
# utf-16 pattern
guid_rx16 = re.compile(rb"(?:\{[\x20-\x7e]\x00){37,}")
for m in guid_rx16.finditer(raw):
    s = m.group().decode("utf-16-le", "ignore")
    if "-" in s:
        print(s)
