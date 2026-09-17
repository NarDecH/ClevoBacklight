$ErrorActionPreference = 'Continue'

"=== Keyboards ==="
Get-PnpDevice -Class Keyboard -ErrorAction SilentlyContinue | Select-Object Status, FriendlyName, InstanceId | Format-List

"=== HID devices (Class HIDClass) ==="
$hids = @(Get-PnpDevice -Class HIDClass -ErrorAction SilentlyContinue)
"HID count: " + $hids.Count
$hids | Select-Object Status, FriendlyName, InstanceId | Format-List

"=== ACPI devices (first 60) ==="
$acpi = @(Get-PnpDevice -ErrorAction SilentlyContinue | Where-Object { $_.InstanceId -like 'ACPI*' })
"ACPI count: " + $acpi.Count
$acpi | Select-Object -First 60 Status, Class, FriendlyName, InstanceId | Format-Table -AutoSize | Out-String -Width 200

"=== EC (PNP0C09) ==="
Get-PnpDevice -ErrorAction SilentlyContinue | Where-Object {
  $hw = (Get-PnpDeviceProperty -InstanceId $_.InstanceId -KeyName 'DEVPKEY_Device_HardwareIds' -ErrorAction SilentlyContinue).Data
  $hw -contains 'ACPI\PNP0C09'
} | Select-Object Status, Class, FriendlyName, InstanceId | Format-List
