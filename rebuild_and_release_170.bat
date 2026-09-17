@echo off
rem ============================================================
rem  Rebuild the exe with the daemon stopped, then restart the
rem  autostart task and package the v1.7.0 release zip.
rem  (elevated: the running daemon holds the exe lock)
rem ============================================================
setlocal
cd /d "%~dp0"
set "PY=C:\opencv\venv312\Scripts\python.exe"
if not exist "%PY%" set "PY=python.exe"

echo [1/5] stopping daemon...
taskkill /IM ClevoBacklight.exe /F >nul 2>&1
timeout /t 2 /nobreak >nul

echo [2/5] building exe (runs test_all.bat first)...
call "%~dp0Build-Exe.bat"
if errorlevel 1 (
    echo BUILD FAILED - restarting daemon anyway
    schtasks /run /tn ClevoBacklightDaemon >nul 2>&1
    exit /b 1
)

echo [3/5] selftest...
del /q "%~dp0dist\selftest_ok.txt" >nul 2>&1
"%~dp0dist\ClevoBacklight.exe" --selftest
timeout /t 4 /nobreak >nul
if not exist "%~dp0dist\selftest_ok.txt" (
    echo SELFTEST FAILED
    type "%~dp0dist\selftest_ok.txt" 2>nul
    schtasks /run /tn ClevoBacklightDaemon >nul 2>&1
    exit /b 1
)
echo selftest ok:
type "%~dp0dist\selftest_ok.txt"

echo [4/5] restarting daemon task...
schtasks /run /tn ClevoBacklightDaemon

echo [5/5] packaging release 1.7.0...
call "%~dp0release.bat" 1.7.0
exit /b %errorlevel%
