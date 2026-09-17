import struct, re

path = r"bios_extract/N9xTP-0712.rom_output/regions/region-bios/volume-0/file-9e21fd93-9c72-4c15-8c4b-e77f1db2d792/section0/section1/volume-ee4e5898-3914-4259-9d6e-dc7bd79403cf/file-c118f50d-391d-45f4-b3d3-11bc931aa56d/section0.raw"
data = open(path, "rb").read()
print("size:", len(data))

# find ACPI table headers: sig (4) + len (4) at plausible offsets
sigs = [m.start() for m in re.finditer(rb"(DSDT|SSDT|FACS|FACP)", data)]
print("sig hits:", [(s, data[s:s+4]) for s in sigs[:20]])

for s in sigs:
    if s + 36 <= len(data):
        length = struct.unpack_from("<I", data, s + 4)[0]
        if 36 < length <= len(data) - s:
            oem = data[s+10:s+16]
            print(f"table candidate at {s}: sig={data[s:s+4]} len={length} oemid={oem}")
            out = data[s:s+length]
            name = f"acpi_table_{s}_{data[s:s+4].decode()}.aml"
            open(name, "wb").write(out)
            print("  saved", name, len(out), "bytes")
