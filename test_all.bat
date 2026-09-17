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
rem  Run before every exe build. Exit code 0 = all good.
rem ============================================================
setlocal
set "HERE=%~dp0"
set "PY=C:\opencv\venv312\Scripts\python.exe"
if not exist "%PY%" set "PY=python.exe"

cd /d "%HERE%"

echo [1/7] compile all modules...
"%PY%" -m py_compile clevo_ec.py clevo_backlight_gui.py clevo_daemon.py config.py hotkeys.py clevo_music.py clevo_ambient.py clevo_temp.py clevo_fan.py ec_sensor_finder.py ec_fan_dump.py ec_fan_loadtest.py launcher.py test_clevo_ec_offline.py test_clevo_music.py test_clevo_ambient.py test_clevo_temp.py test_config_and_daemon.py test_clevo_fan.py audit_self_attrs.py
if errorlevel 1 goto :fail

echo [2/7] AST audit (missing attributes)...
"%PY%" audit_self_attrs.py
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

echo.
echo ALL CHECKS PASSED
exit /b 0

:fail
echo.
echo CHECKS FAILED
exit /b 1
