@echo off
rem ============================================================
rem  Run ALL offline checks in one command (no admin needed):
rem    [1/7] compile every module
rem    [2/7] AST audit -> missing self.* attributes
rem    [3/7] offline EC protocol tests (mock EC)
rem    [4/7] offline music engine tests (mock EC + synthetic audio)
rem    [5/7] offline ambient engine tests
rem    [6/7] offline temperature engine tests
rem    [7/7] config validation + daemon mixin + fan controller tests (offline)
rem    [8/8] auth-guard tests (rate limit + HTTP wiring, offline)
rem    [9/9] live smoke test vs running daemon (auto-skip if none on :8787)
rem  Run before every exe build. Exit code 0 = all good.
rem ============================================================
setlocal
set "HERE=%~dp0"
set "PY=C:\opencv\venv312\Scripts\python.exe"
if not exist "%PY%" set "PY=python.exe"
set "SMOKE_PORT=8787"
if not "%~1"=="" set "SMOKE_PORT=%~1"

rem token for the live smoke test — read from the local dist settings (if any);
rem empty on CI / fresh machines (daemon without a token needs none)
set "SMOKE_TOKEN="
for /f "usebackq delims=" %%T in (`powershell -NoProfile -Command "$p='%HERE%dist\settings.json'; if (Test-Path $p) { (Get-Content $p -Raw | ConvertFrom-Json).dashboard.token }"`) do set "SMOKE_TOKEN=%%T"

cd /d "%HERE%"

echo [1/7] compile all modules...
"%PY%" -m py_compile clevo_ec.py clevo_backlight_gui.py clevo_daemon.py config.py hotkeys.py clevo_music.py clevo_ambient.py clevo_temp.py clevo_fan.py ec_sensor_finder.py ec_fan_dump.py ec_fan_loadtest.py launcher.py smoke_test.py test_auth_guard.py test_clevo_ec_offline.py test_clevo_music.py test_clevo_ambient.py test_clevo_temp.py test_config_and_daemon.py test_clevo_fan.py audit_self_attrs.py audit_locks.py
if errorlevel 1 goto :fail

echo [2/7] AST audit (missing attributes)...
"%PY%" audit_self_attrs.py
if errorlevel 1 goto :fail
echo [2b/7] lock audit (self-deadlock guard, v1.9.13 lesson)...
"%PY%" audit_locks.py
if errorlevel 1 goto :fail

echo [3/7] offline EC protocol tests...
"%PY%" test_clevo_ec_offline.py
if errorlevel 1 goto :fail

echo [4/7] offline music engine tests...
"%PY%" test_clevo_music.py
if errorlevel 1 goto :fail

echo [5/7] offline ambient engine tests...
"%PY%" test_clevo_ambient.py
if errorlevel 1 goto :fail

echo [6/7] offline temperature engine tests...
"%PY%" test_clevo_temp.py
if errorlevel 1 goto :fail

echo [7/7] config + daemon mixin tests...
"%PY%" test_config_and_daemon.py
if errorlevel 1 goto :fail

echo [8/8] auth-guard tests...
"%PY%" test_auth_guard.py
if errorlevel 1 goto :fail

rem --- [9/9] live smoke test: only when a daemon answers on the dashboard port ---
echo [9/9] live smoke test vs running daemon...
"%PY%" -c "import socket;s=socket.socket();s.settimeout(0.5);import sys;sys.exit(0 if s.connect_ex(('127.0.0.1',%SMOKE_PORT%))==0 else 1)"
if errorlevel 1 (
    echo   skip - no daemon listening on 127.0.0.1:%SMOKE_PORT%
) else (
    if "%SMOKE_TOKEN%"=="" (
        "%PY%" smoke_test.py --port %SMOKE_PORT%
    ) else (
        "%PY%" smoke_test.py --port %SMOKE_PORT% --token %SMOKE_TOKEN%
    )
    if errorlevel 1 goto :fail
)

echo.
echo ALL CHECKS PASSED
exit /b 0

:fail
echo.
echo CHECKS FAILED
exit /b 1
