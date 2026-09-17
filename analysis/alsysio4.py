import pefile, sys
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

path = r"C:\Users\NarDech\AppData\Local\Temp\ALSysIO64.sys"
pe = pefile.PE(path)
base = pe.OPTIONAL_HEADER.ImageBase
img = pe.get_memory_mapped_image()
md = Cs(CS_ARCH_X86, CS_MODE_64)

out = []
def disasm(rva, length, label):
    out.append(f"----- {label} @ {base+rva:#x} -----")
    for ins in md.disasm(img[rva:rva+length], base+rva):
        out.append(f"{ins.address:#x}  {ins.mnemonic} {ins.op_str}")
    out.append("")

disasm(0x3eab, 0x240, "dispatch tail (0x997..0x99f + aliases)")
handlers = [
    (0x4d0c, 0xb8, "IOCTL 0x981"),
    (0x5d84, 0x90, "IOCTL 0x982"),
    (0x4dcc, 0x48, "IOCTL 0x984"),
    (0x5e14, 0xa8, "IOCTL 0x985"),
    (0x4a9c, 0x370, "IOCTL 0x988"),
    (0x4614, 0x98, "IOCTL 0x989"),
    (0x4478, 0x19c, "IOCTL 0x98b"),
    (0x4f64, 0xf00, "IOCTL 0x992"),
    (0x4ed8, 0x8c, "IOCTL 0x994"),
    (0x4be8, 0xa4, "IOCTL 0x995"),
    (0x46ac, 0x1f0, "IOCTL 0x996"),
]
for rva, ln, lbl in handlers:
    disasm(rva, ln, lbl)

with open("alsysio_dispatch.txt", "w", encoding="utf-8") as f:
    f.write("\n".join(out))
print("written", len(out), "lines")
