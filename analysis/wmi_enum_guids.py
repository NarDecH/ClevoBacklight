import ctypes, sys, io
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')
from ctypes import wintypes

wmi = ctypes.WinDLL("wmi", use_last_error=True)

WmiEnumerateGuids = wmi.WmiEnumerateGuids
WmiEnumerateGuids.restype = ctypes.c_long
WmiEnumerateGuids.argtypes = [ctypes.POINTER(ctypes.c_wchar_p), ctypes.POINTER(ctypes.c_ulong)]
WmiQueryGuidInformation = wmi.WmiQueryGuidInformation
WmiQueryGuidInformation.restype = ctypes.c_long
WmiQueryGuidInformation.argtypes = [ctypes.c_wchar_p, ctypes.POINTER(ctypes.c_ulong)]

cnt = ctypes.c_ulong(0)
rc = WmiEnumerateGuids(None, ctypes.byref(cnt))
print("count query rc:", rc, "cnt:", cnt.value)
if cnt.value == 0:
    sys.exit()
buf = (ctypes.c_wchar_p * cnt.value)()
cnt2 = ctypes.c_ulong(cnt.value)
rc = WmiEnumerateGuids(buf, ctypes.byref(cnt2))
print("enum rc:", rc, "returned:", cnt2.value)
guids = [buf[i] for i in range(cnt2.value)]
abbc = [g for g in guids if "ABBC" in g.upper()]
print("ABBC guids:", abbc)
print("total registered guids:", len(guids))
target = "{ABBC0F6D-8EA1-11D1-00A0-C90629100000}"
gi = ctypes.c_ulong()
print("query target info rc:", WmiQueryGuidInformation(target, ctypes.byref(gi)), "info:", gi.value)
