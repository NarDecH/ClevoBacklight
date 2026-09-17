; ============================================================
;  ClevoBacklight installer script (Inno Setup 6)
;  Build:  Build-Installer.bat   (needs Inno Setup 6: ISCC.exe)
;  Output: dist\ClevoBacklight-Setup-<version>.exe
;
;  Does: install exe + files -> Program Files,
;        Start Menu shortcuts (GUI + Dashboard),
;        optional autostart Scheduled Task (checkbox at the end),
;        clean uninstall (stops task/process, removes task + files).
; ============================================================

#define MyAppName "Clevo Backlight Controller"
#ifndef MyAppVersion
#define MyAppVersion "1.9.10"
#endif
#define MyAppExe "ClevoBacklight.exe"
#define MyAppGUID "{{7E1F4C2A-9B3D-4E58-8A6C-1D2F5A9B0C33}"

[Setup]
AppId={#MyAppGUID}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher=ClevoBacklight project
DefaultDirName={autopf}\ClevoBacklight
DefaultGroupName=Clevo Backlight
UninstallDisplayName={#MyAppName}
UninstallDisplayIcon={app}\{#MyAppExe}
OutputDir=dist
OutputBaseFilename=ClevoBacklight-Setup-{#MyAppVersion}
Compression=lzma2/max
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64compatible
PrivilegesRequired=admin
WizardStyle=modern

[Tasks]
Name: "desktopicon"; Description: "สร้างไอคอนบน Desktop"; \
    GroupDescription: "ทางลัด:"
Name: "autostart"; Description: "เริ่ม daemon อัตโนมัติตอนเปิดเครื่อง (คืนค่าไฟหลัง boot/sleep)"; \
    GroupDescription: "การทำงานอัตโนมัติ:"; Flags: unchecked

[Files]
Source: "dist\ClevoBacklight.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "dashboard.html"; DestDir: "{app}"; Flags: ignoreversion
Source: "README.md"; DestDir: "{app}"; Flags: ignoreversion
Source: "CHANGELOG.md"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\Clevo Backlight (GUI)"; Filename: "{app}\{#MyAppExe}"
Name: "{group}\Clevo Backlight Dashboard"; Filename: "http://127.0.0.1:8787/"
Name: "{group}\ถอนการติดตั้ง Clevo Backlight"; Filename: "{uninstallexe}"
Name: "{autodesktop}\Clevo Backlight"; Filename: "{app}\{#MyAppExe}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExe}"; Description: "เปิด Clevo Backlight ตอนนี้"; \
    Flags: nowait postinstall skipifsilent runascurrentuser
Filename: "schtasks"; \
    Parameters: "/Create /F /TN ClevoBacklightAutostart /TR """"{app}\{#MyAppExe}"" --daemon"" /SC ONLOGON /RL HIGHEST"; \
    Flags: runhidden; Tasks: autostart
Filename: "schtasks"; Parameters: "/Run /TN ClevoBacklightAutostart"; \
    Flags: runhidden; Tasks: autostart

[UninstallRun]
Filename: "schtasks"; Parameters: "/End /TN ClevoBacklightAutostart"; Flags: runhidden; RunOnceId: "StopTask"
Filename: "schtasks"; Parameters: "/Delete /F /TN ClevoBacklightAutostart"; Flags: runhidden; RunOnceId: "DelTask"
Filename: "taskkill"; Parameters: "/IM ClevoBacklight.exe /F"; Flags: runhidden; RunOnceId: "KillProc"

[UninstallDelete]
; user settings (settings.json / history.json / logs) are intentionally kept
Type: files; Name: "{app}\selftest_ok.txt"
