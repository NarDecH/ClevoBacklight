@echo off
rem ============================================================
rem  Build dist\ClevoBacklight-Setup-<ver>.exe via Inno Setup 6.
rem  Needs: Inno Setup 6 (ISCC.exe) - https://jrsoftware.org/isinfo.php
rem  Runs the exe build first if dist\ClevoBacklight.exe is missing.
rem ============================================================
setlocal
cd /d "%~dp0"
set "PY=C:\opencv\venv\Scripts\python.exe"
if not exist "%PY%" set "PY=python.exe"

if not exist "dist\ClevoBacklight.exe" (
    echo dist\ClevoBacklight.exe missing - building it first...
    call "%~dp0Build-Exe.bat" || exit /b 1
)

set "ISCC=%LocalAppData%\Programs\Inno Setup 6\ISCC.exe"
if not exist "%ISCC%" set "ISCC=%ProgramFiles(x86)%\Inno Setup 6\ISCC.exe"
if not exist "%ISCC%" set "ISCC=%ProgramFiles%\Inno Setup 6\ISCC.exe"
if not exist "%ISCC%" (
    echo [FAIL] Inno Setup 6 not found - install from https://jrsoftware.org/isdl.php
    echo        or: winget install --id JRSoftware.InnoSetup -e
    exit /b 1
)

"%ISCC%" "%~dp0installer.iss"
if errorlevel 1 (
    echo INSTALLER BUILD FAILED
    exit /b 1
)
echo.
echo Installer ready: dist\ClevoBacklight-Setup-1.8.0.exe
exit /b 0
