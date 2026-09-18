@echo off
rem ============================================================
rem  Clevo Keyboard Backlight - one-click launcher
rem  Prefers dist\ClevoBacklight.exe if built; otherwise runs
rem  the Python GUI (asks for admin once, console closes).
rem ============================================================
setlocal
set "HERE=%~dp0"
set "EXE=%HERE%dist\ClevoBacklight.exe"
set "PY=C:\opencv\venv\Scripts\python.exe"
if not exist "%PY%" set "PY=python.exe"

rem packaged exe -> just start it (it elevates itself via its own .bat flow)
if exist "%EXE%" (
    powershell -NoProfile -Command "Start-Process -FilePath '%EXE%' -Verb RunAs" >nul 2>&1
    exit /b
)

rem elevated relaunch entry point (python path)
if "%1"=="--elevated" goto :elevated_entry

"%PY%" -c "import ctypes,sys; sys.exit(0 if ctypes.windll.shell32.IsUserAnAdmin() else 1)" && goto :elevated_ok

rem not admin yet -> relaunch self elevated (UAC prompt appears once)
powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -ArgumentList '--elevated' -Verb RunAs" >nul 2>&1
exit /b

:elevated_ok
start "" "%PY:python.exe=pythonw.exe%" "%HERE%clevo_backlight_gui.py"
exit /b

:elevated_entry
start "" "%PY:python.exe=pythonw.exe%" "%HERE%clevo_backlight_gui.py"
exit /b
