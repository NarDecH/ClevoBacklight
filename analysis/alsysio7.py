import pefile, re
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

path = r"C:\Users\NarDech\AppData\Local\Temp\ALSysIO64.sys"
pe = pefile.PE(path)
base = pe.OPTIONAL_HEADER.ImageBase
img = pe.get_memory_mapped_image()

iat_map = {}
print("=== IMPORTS ===")
for entry in pe.DIRECTORY_ENTRY_IMPORT:
    dll = entry.dll.decode()
    names = []
    for imp in entry.imports:
        if imp.address:
            n = imp.name.decode() if imp.name else f"ord{imp.ordinal}"
            iat_map[imp.address] = f"{dll}!{n}"
            names.append(n)
    print(f"{dll}: {', '.join(names)}")
print()

sec = [s for s in pe.sections if b'.text' in s.Name][0]
td = sec.get_data()
trva = sec.VirtualAddress
print("=== raw OUT opcode hits ===")
for byte, name in [(0xEE, "out dx,al"), (0xEF, "out dx,eax"), (0xE6, "out imm8,al"), (0xE7, "out imm8,eax")]:
    hits, start = [], 0
    while True:
        i = td.find(bytes([byte]), start)
        if i < 0: break
        hits.append(hex(base + trva + i))
        start = i + 1
    print(f"{name}: {len(hits)} hits: {hits[:10]}")
print()

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

disasm(0x4dfc, 0x48, "IOCTL 0x984 handler body (continued)")
disasm(0x6d40, 0x100, "in-users A (0x6d73/0x6d8c/0x6dc7)")
disasm(0x7030, 0x120, "in-users B (0x7064/0x7087/0x70db)")
disasm(0x77e0, 0x60, "in-user C (0x780b)")
disasm(0x783c, 0x40, "target of 0x994 handler")
