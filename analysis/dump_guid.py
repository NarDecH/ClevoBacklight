import pefile, struct

path = r"C:\Users\NarDech\AppData\Local\Temp\InsydeDCHU.dll"
pe = pefile.PE(path)
base = pe.OPTIONAL_HEADER.ImageBase
img = pe.get_memory_mapped_image()

# from disasm: movups xmm0, [rip+0x205d51] at 0x180002900 (next instr 0x180002907)
va = 0x180002907 + 0x205d51
rva = va - base
b = img[rva:rva+16]
print("bytes at", hex(va), ":", b.hex())

d1, d2, d3 = struct.unpack_from("<IHH", b, 0)
d4 = b[8:16]
print("GUID: {%08X-%04X-%04X-%02X%02X-%s}" % (
    d1, d2, d3, d4[0], d4[1], "".join(f"{x:02X}" for x in d4[2:])))
