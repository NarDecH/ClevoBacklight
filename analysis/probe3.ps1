$ErrorActionPreference = 'Continue'

"=== WMI mapper (PNP0C14) present? ==="
Get-PnpDevice -ErrorAction SilentlyContinue | Where-Object { $_.HardwareID -match 'PNP0C14' } | Select-Object Status, Class, FriendlyName, InstanceId | Format-List

"=== ACPI EC / OEM devices ==="
Get-PnpDevice -ErrorAction SilentlyContinue | Where-Object { $_.InstanceId -match 'ACPI\\' -and ($_.HardwareID -match 'PNP0C09|CLEVO|UNIWILL|PNP0C14|INT33|PNP0C0A' -or $_.Class -eq 'System' -and $_.InstanceId -match 'ACPI\\\\') } | Select-Object Status, Class, FriendlyName, InstanceId | Format-List

"=== Kernel drivers: hid/lamp/ec/wmi ==="
Get-CimInstance Win32_SystemDriver | Where-Object { $_.Name -match 'lamp|wmi|ec|ite|acpi|hid' } | Select-Object Name, State, PathName | Format-Table -AutoSize | Out-String -Width 200

"=== HID devices ==="
Get-PnpDevice -Class HIDClass -ErrorAction SilentlyContinue | Select-Object Status, FriendlyName, InstanceId | Format-Table -AutoSize | Out-String -Width 220

"=== HID hardware IDs (look for usage page 0x20 Lighting / LampArray collections) ==="
Get-PnpDevice -Class HIDClass -ErrorAction SilentlyContinue | ForEach-Object {
  $dev = $_
  $hw = (Get-PnpDeviceProperty -InstanceId $dev.InstanceId -KeyName 'DEVPKEY_Device_HardwareIds' -ErrorAction SilentlyContinue).Data
  if ($hw) { [PSCustomObject]@{ Friendly = $dev.FriendlyName; Ids = ($hw -join ' | ') } }
} | Format-List

"=== Keyboards (raw) ==="
Get-PnpDevice -Class Keyboard -ErrorAction SilentlyContinue | Select-Object Status, FriendlyName, InstanceId | Format-List
