@echo off
rem ============================================================
rem  Build dist\ClevoBacklight.exe (one file: GUI + daemon + CLI)
rem  Requires: PyInstaller in the venv (pip install pyinstaller)
rem ============================================================
setlocal
cd /d "%~dp0"
set "PY=C:\opencv\venv\Scripts\python.exe"
if not exist "%PY%" set "PY=python.exe"

rem  v1.9.22 toolchain guard: the venv312 incident (2026-09-19) proved a
rem  missing python/PyInstaller fails SILENTLY via the fallback above —
rem  fail loudly instead.
if not exist "%PY%" (
    echo [TOOLCHAIN] python not found: %PY%
    echo [TOOLCHAIN] install Python 3.12 + pyinstaller, or fix Build-Exe.bat
    exit /b 1
)
"%PY%" -c "import PyInstaller" 2>nul
if errorlevel 1 (
    echo [TOOLCHAIN] PyInstaller missing in %PY%
    echo [TOOLCHAIN] run: "%PY%" -m pip install pyinstaller
    exit /b 1
)

rem  never build from a red state: run every offline check first
call "%~dp0test_all.bat"
if errorlevel 1 (
    echo BUILD ABORTED - fix the failed checks above
    exit /b 1
)

"%PY%" -m PyInstaller --noconfirm --clean ClevoBacklight.spec
if errorlevel 1 (
    echo BUILD FAILED
    exit /b 1
)
echo.
echo Build OK: %~dp0dist\ClevoBacklight.exe
echo Try:  ClevoBacklight.exe            (GUI, run as admin)
echo       ClevoBacklight.exe --on --color 00FF88 --brightness 3
echo       ClevoBacklight.exe --daemon   (tray autostart)
exit /b 0
