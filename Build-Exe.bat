@echo off
rem ============================================================
rem  Build dist\ClevoBacklight.exe (one file: GUI + daemon + CLI)
rem  Requires: PyInstaller in the venv (pip install pyinstaller)
rem ============================================================
setlocal
cd /d "%~dp0"
set "PY=C:\opencv\venv\Scripts\python.exe"
if not exist "%PY%" set "PY=python.exe"

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
