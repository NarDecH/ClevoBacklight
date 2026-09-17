@echo off
rem ============================================================
rem  Install autostart: Clevo keyboard backlight daemon
rem  - registers a scheduled task (highest rights, at logon)
rem  - starts the daemon immediately
rem  - prefers dist\ClevoBacklight.exe --daemon if it exists,
rem    otherwise falls back to pythonw + clevo_daemon.py
rem  Self-elevates via UAC (double-click and confirm once)
rem ============================================================
setlocal
set "HERE=%~dp0"
set "PYW=C:\opencv\venv312\Scripts\pythonw.exe"
if not exist "%PYW%" set "PYW=pythonw.exe"
set "EXE=%HERE%dist\ClevoBacklight.exe"

set "ACTION=install"
if /i "%1"=="elevated" set "ACTION=%2"

net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -ArgumentList 'elevated %ACTION%' -Verb RunAs" >nul 2>&1
    exit /b
)

if "%ACTION%"=="remove" goto :remove

if exist "%EXE%" (
    echo Creating scheduled task "ClevoBacklightDaemon" ^(using ClevoBacklight.exe^)...
    schtasks /Create /F /TN "ClevoBacklightDaemon" /SC ONLOGON /RL HIGHEST ^
      /TR "\"%EXE%\" --daemon"
) else (
    echo Creating scheduled task "ClevoBacklightDaemon" ^(using pythonw^)...
    schtasks /Create /F /TN "ClevoBacklightDaemon" /SC ONLOGON /RL HIGHEST ^
      /TR "\"%PYW%\" \"%HERE%clevo_daemon.py\""
)
if errorlevel 1 (
    echo [FAILED] could not create the task.
    pause
    exit /b 1
)
echo Starting daemon now...
schtasks /Run /TN "ClevoBacklightDaemon" >nul 2>&1
echo.
echo Done. The tray icon appears in a few seconds.
echo Stop it any time: tray menu "Exit", or press Ctrl+Alt+K.
timeout /t 3 >nul
exit /b 0

:remove
echo Stopping and deleting task "ClevoBacklightDaemon"...
taskkill /IM ClevoBacklight.exe /F >nul 2>&1
schtasks /End /TN "ClevoBacklightDaemon" >nul 2>&1
schtasks /Delete /F /TN "ClevoBacklightDaemon" >nul 2>&1
if errorlevel 1 (
    echo [note] task not found or already removed.
) else (
    echo Task removed.
)
if exist "%HERE%daemon.pid" (
    for /f %%p in ('type "%HERE%daemon.pid"') do taskkill /PID %%p /F >nul 2>&1
    del "%HERE%daemon.pid" >nul 2>&1
)
echo Autostart removed. The backlight keeps its last state.
timeout /t 3 >nul
exit /b 0
