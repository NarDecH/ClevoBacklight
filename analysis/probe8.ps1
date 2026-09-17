$ErrorActionPreference = 'Continue'

"=== Devices with MON/CLEVO/NOTEBOOK in hardware IDs ==="
Get-PnpDevice -ErrorAction SilentlyContinue | Where-Object {
  $hw = (Get-PnpDeviceProperty -InstanceId $_.InstanceId -KeyName 'DEVPKEY_Device_HardwareIds' -ErrorAction SilentlyContinue).Data
  ($hw -join ' ') -match 'MON000|CLEVO|CLV|NOTEBOOK'
} | Select-Object Status, Class, FriendlyName, InstanceId | Format-List

"=== ACPI registry (table names only) ==="
Get-ChildItem 'HKLM:\HARDWARE\ACPI' -Recurse -ErrorAction SilentlyContinue | ForEach-Object { $_.Name }

"=== Driver services mentioning clevo/wmi/uniwill/ite/ec ==="
Get-ChildItem 'HKLM:\SYSTEM\CurrentControlSet\Services' | Where-Object { $_.PSChildName -match 'clevo|uniwill|wmi|ite|tuxedo|ec|kb' } | ForEach-Object {
  $p = Get-ItemProperty $_.PSPath
  [PSCustomObject]@{ Name = $_.PSChildName; Start = $p.Start; Type = $p.Type; ImagePath = $p.ImagePath }
} | Where-Object { $_.Name -match 'clevo|uniwill|tuxedo|^ITE|^EC|^WMI|^kb' } | Format-Table -AutoSize | Out-String -Width 200

"=== Installed apps (full list, publisher+name) ==="
$paths = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*','HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
Get-ItemProperty $paths -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName } | Sort-Object DisplayName | ForEach-Object { "{0}  |  {1}  |  {2}" -f $_.DisplayName, $_.DisplayVersion, $_.Publisher }

"=== Running processes that look like control centers ==="
Get-Process | Where-Object { $_.ProcessName -match 'control|center|ccenter|clevo|uniwill|rgb|led|kb' } | Select-Object ProcessName, Id, Path | Format-List
