import pefile, sys, io
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

path = r"C:\Users\NarDech\AppData\Local\Temp\InsydeDCHU.dll"
pe = pefile.PE(path)
base = pe.OPTIONAL_HEADER.ImageBase
img = pe.get_memory_mapped_image()

md = Cs(CS_ARCH_X86, CS_MODE_64)

def disasm(rva, length, label):
    print(f"----- {label} @ {hex(base+rva)} -----")
    for ins in md.disasm(img[rva:rva+length], base+rva):
        note = ""
        # annotate rip-relative lea/mov with target
        if 'rip +' in ins.op_str or 'rip - ' in ins.op_str:
            try:
                import re
                m = re.search(r"rip ([+-]) (0x[0-9a-f]+)", ins.op_str)
                if m:
                    off = int(m.group(2), 16) * (1 if m.group(1) == '+' else -1)
                    target = ins.address + ins.size + off
                    fo = target - base
                    raw = img[fo:fo+32]
                    # try utf16
                    s16 = raw.decode('utf-16-le', 'ignore').split('\x00')[0]
                    sa = raw.split(b'\x00')[0]
                    note = f"   ; -> {hex(target)} u16={s16!r} asc={sa[:20]!r}"
            except Exception:
                pass
        print(f"{ins.address:#x}  {ins.mnemonic} {ins.op_str}{note}")

disasm(0x2330, 700, "open-handle helper (0x2330)")
