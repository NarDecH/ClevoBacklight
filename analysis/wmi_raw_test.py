import ctypes, sys, io
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')
from ctypes import wintypes

GUID = "{ABBC0F6D-8EA1-11D1-00A0-C90629100000}"
k32 = ctypes.WinDLL("kernel32", use_last_error=True)
wmi = ctypes.WinDLL("wmi", use_last_error=True)

WmiOpenBlock = wmi.WmiOpenBlock
WmiOpenBlock.restype = ctypes.c_long
WmiOpenBlock.argtypes = [ctypes.c_wchar_p, ctypes.c_ulong, ctypes.POINTER(ctypes.c_void_p)]
WmiCloseBlock = wmi.WmiCloseBlock
WmiCloseBlock.restype = ctypes.c_long
WmiCloseBlock.argtypes = [ctypes.c_void_p]
WmiExecuteMethodW = wmi.WmiExecuteMethodW
WmiExecuteMethodW.restype = ctypes.c_long
WmiExecuteMethodW.argtypes = [ctypes.c_void_p, ctypes.c_wchar_p, ctypes.c_ulong,
                              ctypes.c_ulong, ctypes.c_void_p,
                              ctypes.POINTER(ctypes.c_ulong), ctypes.c_void_p]
WmiFreeBuffer = wmi.WmiFreeBuffer
WmiFreeBuffer.restype = ctypes.c_long
WmiFreeBuffer.argtypes = [ctypes.c_void_p]

WMIGUID_EXECUTE = 0x1

h = ctypes.c_void_p()
rc = WmiOpenBlock(GUID, WMIGUID_EXECUTE, ctypes.byref(h))
print("WmiOpenBlock:", rc, hex(ctypes.get_last_error()))
if rc != 0:
    sys.exit(1)

# WmiExecuteMethodW(handle, instanceName, methodId, inBufferSize, inBuffer, outBufferSize, outBuffer)
# method id 0x01 = GET_EVENT (read-only)
inbuf = (ctypes.c_uint * 1)(0)
outsize = ctypes.c_ulong(64)
outbuf = (ctypes.c_ubyte * 64)()
rc = WmiExecuteMethodW(h, None, 0x01, 4, inbuf, ctypes.byref(outsize), outbuf)
print("WmiExecuteMethodW(GET_EVENT):", rc, "outsize:", outsize.value)
if rc == 0:
    print("out:", bytes(outbuf[:outsize.value]).hex())
    print("\n*** WMI RAW KERNEL PATH WORKS — Clevo WMBB is reachable! ***")
elif rc in (0xC0000001, 0x80004005):
    print("generic failure")

WmiCloseBlock(h)
