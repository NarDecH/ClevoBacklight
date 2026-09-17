@echo off
rem Recreate the project's daemon Scheduled Task (the uninstaller test
rem removed it) and start the daemon again.
schtasks /Create /F /TN ClevoBacklightDaemon /TR "\"C:\_Project\backlight_controller_intended_for_Clevo\dist\ClevoBacklight.exe\" --daemon" /SC ONLOGON /RL HIGHEST
schtasks /Run /TN ClevoBacklightDaemon
