@echo off
rem ============================================================
rem  Package a release: dist\ClevoBacklight.exe + README +
rem  CHANGELOG -> ClevoBacklight-<version>.zip
rem  Usage:  release.bat            (default version from CHANGELOG)
rem          release.bat 1.4.0      (explicit version tag)
rem ============================================================
setlocal
set "HERE=%~dp0"
set "EXE=%HERE%dist\ClevoBacklight.exe"

set "VER=%~1"
if "%VER%"=="" set "VER=1.9.13"

if not exist "%EXE%" (
    echo [FAIL] %EXE% not found - build first with Build-Exe.bat
    exit /b 1
)

set "STAGE=%TEMP%\ClevoBacklight-release"
rmdir /s /q "%STAGE%" >nul 2>&1
mkdir "%STAGE%" >nul 2>&1

copy /y "%EXE%" "%STAGE%\ClevoBacklight.exe" >nul
copy /y "%HERE%README.md" "%STAGE%\README.md" >nul
copy /y "%HERE%CHANGELOG.md" "%STAGE%\CHANGELOG.md" >nul

rem  First-run hint so a fresh machine knows what to double-click
> "%STAGE%\START-HERE.txt" echo Clevo Keyboard Backlight Controller v%VER%
>> "%STAGE%\START-HERE.txt" echo.
>> "%STAGE%\START-HERE.txt" echo 1. Right-click ClevoBacklight.exe - Run as administrator
>> "%STAGE%\START-HERE.txt" echo 2. To auto-restore after boot: create a Scheduled Task with:
>> "%STAGE%\START-HERE.txt" echo      ClevoBacklight.exe --daemon   ^(at logon, highest rights^)
>> "%STAGE%\START-HERE.txt" echo 3. Full manual: README.md

set "ZIP=%HERE%ClevoBacklight-v%VER%.zip"
powershell -NoProfile -Command "Compress-Archive -Force -Path '%STAGE%\*' -DestinationPath '%ZIP%'"
if errorlevel 1 (
    echo [FAIL] could not create the zip
    exit /b 1
)
rmdir /s /q "%STAGE%" >nul 2>&1

echo.
echo Release ready: %ZIP%
for %%A in ("%ZIP%") do echo   size: %%~zA bytes
exit /b 0
