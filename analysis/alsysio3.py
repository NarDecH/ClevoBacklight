import pefile, struct, sys, io
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

path = r"C:\Users\NarDech\AppData\Local\Temp\ALSysIO64.sys"
pe = pefile.PE(path)
base = pe.OPTIONAL_HEADER.ImageBase
img = pe.get_memory_mapped_image()
md = Cs(CS_ARCH_X86, CS_MODE_64)
md.detail = False

# 1) find all immediates 0x9C40xxxx anywhere in .text
hits = []
sec = None
for s in pe.sections:
    if b'.text' in s.Name:
        sec = s
        break
if sec is None:
    print("no .text"); sys.exit(1)
td = sec.get_data()
trva = sec.VirtualAddress
for off in range(len(td) - 4):
    v = struct.unpack_from('<I', td, off)[0]
    if (v >> 16) == 0x9C40:
        hits.append((trva + off, v))

# dedupe by value, keep first addr
seen = {}
for a, v in hits:
    if v not in seen:
        seen[v] = a
print("distinct 0x9C40xxxx immediates:")
for v, a in sorted(seen.items()):
    func = (v >> 2) & 0xFFF
    meth = v & 3
    acc = (v >> 14) & 3
    print(f"  {v:#010x}  @va {base+a:#x}  func={func:#05x} method={meth} access={acc}")

# 2) disassemble dispatcher 0x140003BF0 fully
def disasm(rva, length, label):
    print(f"\n----- {label} @ {base+rva:#x} -----")
    for ins in md.disasm(img[rva:rva+length], base+rva):
        print(f"{ins.address:#x}  {ins.mnemonic} {ins.op_str}")

disasm(0x3BF0, 0x500, "dispatch (MJ_CREATE/CLOSE/DEVICE_CONTROL)")
