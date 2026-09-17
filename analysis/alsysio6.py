import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

path = r"C:\Users\NarDech\AppData\Local\Temp\ALSysIO64.sys"
pe = pefile.PE(path)
base = pe.OPTIONAL_HEADER.ImageBase
img = pe.get_memory_mapped_image()
md = Cs(CS_ARCH_X86, CS_MODE_64)

for start, ln, label in [
    (0x7994, 0x150, "port WRITE dispatcher (tail-called by 0x985)"),
    (0x7554, 0x60, "MSR read wrapper (0x981)"),
    (0x7954, 0x40, "MSR write wrapper (0x982)"),
    (0x63b8, 0x80, "called by 0x998 3-byte handler"),
    (0x6518, 0x40, "called by 0x997 handler"),
    (0x62f4, 0x40, "called by 0x98b-alias handler"),
    (0x65c4, 0x60, "called by 0x995-alias handler"),
]:
    print(f"----- {label} @ {base+start:#x} -----")
    for ins in md.disasm(img[start:start+ln], base+start):
        print(f"{ins.address:#x}  {ins.mnemonic} {ins.op_str}")
    print()
