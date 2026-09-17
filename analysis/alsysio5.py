import pefile, struct
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

path = r"C:\Users\NarDech\AppData\Local\Temp\ALSysIO64.sys"
pe = pefile.PE(path)
base = pe.OPTIONAL_HEADER.ImageBase
img = pe.get_memory_mapped_image()
md = Cs(CS_ARCH_X86, CS_MODE_64)

sec = None
for s in pe.sections:
    if b'.text' in s.Name:
        sec = s
        break
td = sec.get_data()
trva = sec.VirtualAddress

out = []
port_ops = []
for ins in md.disasm(td, base + trva):
    line = f"{ins.address:#x}  {ins.mnemonic} {ins.op_str}"
    out.append(line)
    if ins.mnemonic in ("in", "out", "rdmsr", "wrmsr", "cli", "sti", "cpuid", "rdtsc", "hlt", "invd", "wbinvd"):
        port_ops.append((ins.address, ins.mnemonic, ins.op_str))

with open("alsysio_full_text.txt", "w", encoding="utf-8") as f:
    f.write("\n".join(out))

print("privileged ops found:")
for a, m, o in port_ops:
    print(f"  {a:#x}  {m} {o}")
