import pefile, struct, sys, io, re
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

path = r"C:\Users\NarDech\AppData\Local\Temp\ALSysIO64.sys"
pe = pefile.PE(path)
base = pe.OPTIONAL_HEADER.ImageBase
img = pe.get_memory_mapped_image()
md = Cs(CS_ARCH_X86, CS_MODE_64)
ep = pe.OPTIONAL_HEADER.AddressOfEntryPoint
print("entrypoint rva:", hex(ep), " va:", hex(base+ep))

def disasm(rva, length, label=""):
    print(f"----- {label} @ {hex(base+rva)} -----")
    for ins in md.disasm(img[rva:rva+length], base+rva):
        print(f"{ins.address:#x}  {ins.mnemonic} {ins.op_str}")

disasm(ep, 0x500, "DriverEntry")
