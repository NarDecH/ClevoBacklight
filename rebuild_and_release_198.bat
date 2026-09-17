@echo off
rem ============================================================
rem  Rebuild the exe (daemon stopped), build the Inno Setup
rem  installer, restart the task, package release 1.9.8.
rem  Double-click me: I request admin myself, then keep the
rem  window open so you can read the result.
rem ============================================================
setlocal

rem --- self-elevate (double-click friendly) ---
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator rights...
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"
set "PY=C:\opencv\venv312\Scripts\python.exe"
if not exist "%PY%" set "PY=python.exe"

echo [1/6] stopping daemon...
taskkill /IM ClevoBacklight.exe /F >nul 2>&1
timeout /t 2 /nobreak >nul

echo [2/6] building exe (runs test_all.bat first)...
call "%~dp0Build-Exe.bat"
if errorlevel 1 (
    echo BUILD FAILED - restarting daemon anyway
    schtasks /run /tn ClevoBacklightDaemon >nul 2>&1
    pause
    exit /b 1
)

echo [3/6] selftest...
del /q "%~dp0dist\selftest_ok.txt" >nul 2>&1
"%~dp0dist\ClevoBacklight.exe" --selftest
timeout /t 4 /nobreak >nul
if not exist "%~dp0dist\selftest_ok.txt" (
    echo SELFTEST FAILED
    schtasks /run /tn ClevoBacklightDaemon >nul 2>&1
    pause
    exit /b 1
)
echo selftest ok:
type "%~dp0dist\selftest_ok.txt"
echo.

echo [4/6] building Inno Setup installer...
call "%~dp0Build-Installer.bat"
if errorlevel 1 (
    echo INSTALLER BUILD FAILED - continuing with the zip anyway
)

echo [5/6] restarting daemon task...
schtasks /run /tn ClevoBacklightDaemon
timeout /t 10 /nobreak >nul

echo [6/6] packaging release 1.9.8...
call "%~dp0release.bat" 1.9.8
echo.
echo ==== DONE - exit code %errorlevel% ====
pause
exit /b %errorlevel%
