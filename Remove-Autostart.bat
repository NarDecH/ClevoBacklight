@echo off
rem ============================================================
rem  Remove autostart: Clevo keyboard backlight daemon
rem  Stops the daemon and deletes the scheduled task.
rem  (The backlight keeps its last state; nothing is uninstalled.)
rem  Self-elevates via UAC - just double-click.
rem ============================================================
set "HERE=%~dp0"
powershell -NoProfile -Command "Start-Process -FilePath '%HERE%Install-Autostart.bat' -ArgumentList 'elevated remove' -Verb RunAs" >nul 2>&1
exit /b
