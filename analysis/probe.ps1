$ErrorActionPreference = 'Continue'

"=== Model ==="
Get-CimInstance Win32_ComputerSystemProduct | Select-Object Name, Version, IdentifyingNumber | Format-List

"=== WMI classes in root\WMI matching keywords ==="
$classes = Get-CimClass -Namespace root/WMI
$hits = $classes | Where-Object { $_.CimClassName -match 'CLEVO|Clevo|KBD|Keyboard|Backlight|Illum|Uniwill|UEFI|Method|EC_|_EC' } | Select-Object -ExpandProperty CimClassName | Sort-Object -Unique
$hits
"total classes: " + $classes.Count

"=== CLEVO class details ==="
foreach ($name in ($hits | Where-Object { $_ -match 'CLEVO|Clevo' })) {
  $c = Get-CimClass -Namespace root/WMI -ClassName $name -ErrorAction SilentlyContinue
  if ($c) {
    "Class: $name"
    "  Methods:"
    $c.CimClassMethods | ForEach-Object { "   - " + $_.Name + "  qualifiers: " + (($_.Qualifiers | ForEach-Object { $_.Name + '=' + $_.Value }) -join ', ') }
    "  Properties:"
    $c.CimClassProperties | ForEach-Object { "   - " + $_.Name }
  }
}

"=== Installed software related to control center / backlight ==="
$paths = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*','HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*','HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
Get-ItemProperty $paths -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -match 'Control Center|OpenRGB|Clevo|Flexikey|Uniwill|Sager|XMG|Tuxedo|MyOEM' } | Select-Object DisplayName, DisplayVersion, InstallLocation | Format-List

"=== Services that look like control center drivers ==="
Get-Service -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -match 'clevo|control center|uniwill|kbled|backlight' } | Select-Object Name, DisplayName, Status | Format-List

"=== Kernel drivers with clevo/uniwill in name ==="
Get-CimInstance Win32_SystemDriver -ErrorAction SilentlyContinue | Where-Object { $_.Name -match 'clevo|uniwill|tuxedo' } | Select-Object Name, State, PathName | Format-List
