import pefile, sys
pe = pefile.PE(r"C:\Windows\System32\wmi.dll")
names = []
if hasattr(pe, "DIRECTORY_ENTRY_EXPORT"):
    for exp in pe.DIRECTORY_ENTRY_EXPORT.symbols:
        if exp.name:
            names.append(exp.name.decode())
print("\n".join(n for n in names if "Wmi" in n or "Execute" in n or "Open" in n or "Close" in n))
print("total exports:", len(names))
