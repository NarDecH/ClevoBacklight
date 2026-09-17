import re, sys

path = r"C:\Users\NarDech\AppData\Local\Temp\InsydeDCHU.dll"
data = open(path, "rb").read()
print("size", len(data))

# ASCII strings
ascii_strs = re.findall(rb"[\x20-\x7e]{5,}", data)
# UTF-16LE strings
u16_strs = re.findall(rb"(?:[\x20-\x7e]\x00){5,}", data)

def decode(bs): return bs.decode("latin1")
def decode16(bs): return bs.decode("utf-16-le")

patterns = {
    "device_path": re.compile(r"\\\\\.\\[A-Za-z0-9_\-]+"),
    "guid": re.compile(r"\{[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}\}"),
    "wmi_like": re.compile(r"WM[A-Z]{2}|WMI_|_WMI", re.IGNORECASE),
    "ioctl_like": re.compile(r"IOCTL_[A-Z_]+"),
    "ec_like": re.compile(r"\bEC[A-Z_]{2,}|\b[A-Z_]*EC\b"),
    "dchu": re.compile(r"DCHU|IRDC|WBT|H2O|Insyde", re.IGNORECASE),
}

def scan(strings, label):
    for s in strings:
        for name, rx in patterns.items():
            if rx.search(s):
                print(f"[{label}:{name}] {s}")

seen = set()
for s in map(decode16, u16_strs):
    if s not in seen:
        seen.add(s)
        scan([s], "u16")

seen2 = set()
for s in map(decode, ascii_strs):
    if s not in seen2:
        seen2.add(s)
        scan([s], "asc")

print("---- unique interesting ascii (longer list) ----")
kws = ["DCHU", "EC", "WMI", "KB", "LED", "Backlight", "Color", "Fan", "Temp",
       "Power", "Mode", "GUID", "Device", "Open", "Read", "Write", "IOCTL",
       "Insyde", "IRD", "WBT", "Acpi", "ACPI", "Port", "Io"]
out = []
for s in map(decode, ascii_strs):
    if any(k in s for k in kws) and len(s) < 120:
        out.append(s)
print("\n".join(sorted(set(out))[:400]))
