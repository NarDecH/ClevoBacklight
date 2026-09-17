import ctypes, struct, sys, io
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')
from ctypes import wintypes

k32 = ctypes.WinDLL("kernel32", use_last_error=True)
CreateFileW = k32.CreateFileW
CreateFileW.restype = wintypes.HANDLE
CreateFileW.argtypes = [wintypes.LPCWSTR, wintypes.DWORD, wintypes.DWORD, wintypes.LPVOID, wintypes.DWORD, wintypes.DWORD, wintypes.HANDLE]
DeviceIoControl = k32.DeviceIoControl
DeviceIoControl.restype = wintypes.BOOL
DeviceIoControl.argtypes = [wintypes.HANDLE, wintypes.DWORD, wintypes.LPVOID, wintypes.DWORD, wintypes.LPVOID, wintypes.DWORD, ctypes.POINTER(wintypes.DWORD), wintypes.LPVOID]
CloseHandle = k32.CloseHandle
CloseHandle.argtypes = [wintypes.HANDLE]

GENERIC_READ  = 0x80000000
GENERIC_WRITE = 0x40000000
SHARE_RW      = 3
OPEN_EXISTING = 3

# IOCTL_ACPI_EVAL_METHOD_EX = CTL_CODE(FILE_DEVICE_ACPI=0x32, 3, METHOD_BUFFERED, FILE_ANY_ACCESS)
IOCTL_EVAL_EX  = 0x32000C
IOCTL_EVAL     = 0x320004   # relative-name variant (fallback)

ACPI_METHOD_ARGUMENT_INTEGER = 1
SIG_COMPLEX_EX = 0x454E4943  # 'AENC'
SIG_OUTPUT     = 0x4F454E41  # 'AENO'

def build_input_complex(path, int_args):
    # ACPI_EVAL_INPUT_BUFFER_COMPLEX_EX:
    #  Signature, MethodNameAsInteger=0, SizeMethodName=len(path)+1 (incl NUL), ArgumentCount,
    #  MethodName bytes, then ACPI_METHOD_ARGUMENT array (8 bytes each: Type, DataLength, Argument)
    name = path.encode('ascii') + b'\x00'
    size_name = len(name)
    n = len(int_args)
    header = struct.pack('<IIII', SIG_COMPLEX_EX, 0, size_name, n)
    tail = name
    # align to 4 after name
    pad = (-len(tail)) % 4
    tail += b'\x00' * pad
    for a in int_args:
        tail += struct.pack('<HHI', ACPI_METHOD_ARGUMENT_INTEGER, 4, a & 0xFFFFFFFF)
    return header + tail

def eval_method(path, args, out_len=256):
    h = CreateFileW(r"\\.\ACPI", GENERIC_READ | GENERIC_WRITE, SHARE_RW, None, OPEN_EXISTING, 0, None)
    if h == -1 or h is None or h == 0xFFFFFFFFFFFFFFFF:
        return None, ctypes.get_last_error()
    try:
        inp = build_input_complex(path, args)
        out = ctypes.create_string_buffer(out_len)
        ret = wintypes.DWORD(0)
        ok = DeviceIoControl(h, IOCTL_EVAL_EX, inp, len(inp), out, out_len, ctypes.byref(ret), None)
        err = ctypes.get_last_error()
        if not ok:
            return None, err
        data = out.raw[:ret.value]
        if len(data) >= 12:
            sig, length, count = struct.unpack_from('<III', data, 0)
            if sig == SIG_OUTPUT and count >= 1:
                # first argument at offset 12: Type(2), DataLength(2), Argument(4)
                t, dl, val = struct.unpack_from('<HHI', data, 12)
                return val, 0
        return ('ok', data.hex()), 0
    finally:
        CloseHandle(h)

def main():
    err = 0
    h = CreateFileW(r"\\.\ACPI", GENERIC_READ | GENERIC_WRITE, SHARE_RW, None, OPEN_EXISTING, 0, None)
    if h in (-1, 0xFFFFFFFFFFFFFFFF, None):
        print(f"cannot open \\\\.\\ACPI (need admin?), err={ctypes.get_last_error()}")
        return
    CloseHandle(h)
    print("\\\\.\\ACPI opened OK")

    candidates = [
        "\\_SB.WMI1.WMBB",
        "\\_SB.WMI2.WMBB",
        "\\_SB.WMI.WMBB",
        "\\_SB.WMI0.WMBB",
        "\\WMI1.WMBB",
        "\\_SB.PCI0.LPCB.EC0.WMBB",
        "\\_SB.PCI0.LPCB.EC.WMBB",
    ]
    # GET_EVENT (0x01) is read-only -> safe existence probe: WMBB(0, 0x01, 0)
    for path in candidates:
        res, err = eval_method(path, [0, 0x01, 0])
        print(f"{path:28s} -> {res}  (err={err})")

if __name__ == "__main__":
    main()
