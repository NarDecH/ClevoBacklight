import pefile, re
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

path = r"C:\Users\NarDech\AppData\Local\Temp\ALSysIO64.sys"
pe = pefile.PE(path)
base = pe.OPTIONAL_HEADER.ImageBase
img = pe.get_memory_mapped_image()
iat_map = {}
for entry in pe.DIRECTORY_ENTRY_IMPORT:
    for imp in entry.imports:
        if imp.address:
            iat_map[imp.address] = f"{entry.dll.decode()}!{imp.name.decode() if imp.name else imp.ordinal}"

md = Cs(CS_ARCH_X86, CS_MODE_64)
def disasm(start, ln, label):
    print(f"----- {label} @ {base+start:#x} -----")
    for ins in md.disasm(img[start:start+ln], base+start):
        ann = ""
        if ins.mnemonic in ("call", "jmp") and "rip" in ins.op_str:
            m = re.search(r"rip ([+-]) (0x[0-9a-f]+)", ins.op_str)
            if m:
                d = int(m.group(2), 16) * (1 if m.group(1) == '+' else -1)
                tgt = ins.address + ins.size + d
                ann = f"   ; -> {tgt:#x} {iat_map.get(tgt, 'local')}"
        print(f"{ins.address:#x}  {ins.mnemonic} {ins.op_str}{ann}")
    print()

disasm(0x63b8, 0x140, "0x99e target: 3-byte (cl,dl,r8b) fn")
disasm(0x62f4, 0x104, "0x99f target: (port, buf, len) fn")
disasm(0x4e58, 0x80, "IOCTL 0x99c handler")
disasm(0x4c74, 0x9c, "IOCTL 0x99d handler")
disasm(0x433c, 0x9c, "IOCTL 0x99b handler")
disasm(0x6518, 0x180, "0x997 target fn (full)")
