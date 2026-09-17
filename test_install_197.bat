@echo off
rem ============================================================
rem  Silent-install the built installer, verify files, Start
rem  Menu shortcuts and the uninstall registry entry, then
rem  uninstall again and restart the project daemon task.
rem  (Run elevated.)
rem ============================================================
setlocal
cd /d "%~dp0"

echo [1/5] installing dist\ClevoBacklight-Setup-1.9.7.exe (silent)...
"C:\_Project\backlight_controller_intended_for_Clevo\dist\ClevoBacklight-Setup-1.9.7.exe" /SILENT /SUPPRESSMSGBOXES /NORESTART
if errorlevel 1 (
    echo INSTALL FAILED
    exit /b 1
)
timeout /t 3 /nobreak >nul

echo [2/5] installed files:
dir /b "C:\Program Files\ClevoBacklight"
echo [3/5] Start Menu shortcuts:
dir /b "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Clevo Backlight" 2>nul
echo [4/5] uninstall registry entry:
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{7E1F4C2A-9B3D-4E58-8A6C-1D2F5A9B0C33}_is1" /v DisplayVersion

echo [5/5] uninstalling again (silent)...
"C:\Program Files\ClevoBacklight\unins000.exe" /SILENT /SUPPRESSMSGBOXES /NORESTART
timeout /t 4 /nobreak >nul
if exist "C:\Program Files\ClevoBacklight\ClevoBacklight.exe" (
    echo WARN: exe still present after uninstall
) else (
    echo UNINSTALL CLEAN
)

echo restoring the project daemon task...
schtasks /run /tn ClevoBacklightDaemon >nul 2>&1
echo ==== INSTALL TEST DONE ====
exit /b 0
