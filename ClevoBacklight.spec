# -*- mode: python ; coding: utf-8 -*-
# PyInstaller spec: one-file ClevoBacklight.exe (GUI + daemon + CLI + music)
from PyInstaller.utils.hooks import collect_submodules

hiddenimports = [
    "soundcard",
    "pystray",
    "pystray._win32",
]
hiddenimports += collect_submodules("soundcard")
try:
    import comtypes  # noqa: F401
    hiddenimports.append("comtypes")
except ImportError:
    pass

a = Analysis(
    ["launcher.py"],
    pathex=[],
    binaries=[],
    datas=[("tools/WinRing0x64.sys", "tools"),
           ("dashboard.html", ".")],
    hiddenimports=hiddenimports,
    hookspath=[],
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
)
pyz = PYZ(a.pure)
exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.datas,
    [],
    name="ClevoBacklight",
    console=False,          # windowed: no console flash (GUI/daemon both log to files)
    upx=False,
)
