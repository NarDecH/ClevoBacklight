import pefile, struct, sys, io
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

path = r"C:\Users\NarDech\AppData\Local\Temp\ALSysIO64.sys"
pe = pefile.PE(path)
base = pe.OPTIONAL_HEADER.ImageBase
img = pe.get_memory_mapped_image()
md = Cs(CS_ARCH_X86, CS_MODE_64)

print("sections:", [(s.Name.decode().strip('\x00'), hex(s.VirtualAddress), hex(s.Misc_VirtualSize)) for s in pe.sections])

# strings
import re
raw = open(path, 'rb').read()
print("--- unicode strings ---")
for m in re.finditer(rb"(?:[\x20-\x7e]\x00){4,}", raw):
    s = m.group().decode("utf-16-le", "ignore")
    print(repr(s))
print("--- ascii strings ---")
for m in re.finditer(rb"[\x20-\x7e]{6,}", raw):
    s = m.group().decode("latin1")
    if any(k in s for k in ("\\Device", "\\Dos", "ALSys", "Ring0", "IO", "port")):
        print(repr(s))
