$ErrorActionPreference = 'Continue'

"=== BIOS/CPU info ==="
Get-CimInstance Win32_BIOS | Select-Object Manufacturer, SMBIOSBIOSVersion, ReleaseDate | Format-List
Get-CimInstance Win32_BaseBoard | Select-Object Manufacturer, Product, Version | Format-List

"=== All root\WMI class names (non-MS) ==="
$all = (Get-CimClass -Namespace root/WMI).CimClassName | Sort-Object -Unique
"total: " + $all.Count
$nonMS = $all | Where-Object { $_ -notmatch '^(MSFT|MS|iWbem|Wmi|Win32|__|MSSmBios|MSKeyboard|MSNdis|MSFC|MSiSCSI|MSHBA|MS_SM|WHEA|Acpi|ACPI)' }
$nonMS
"nonMS count: " + $nonMS.Count

"=== Classes WITH methods (non-system) ==="
foreach ($name in $all) {
  $c = Get-CimClass -Namespace root/WMI -ClassName $name -ErrorAction SilentlyContinue
  if ($c -and $c.CimClassMethods.Count -gt 0) {
    "$name (methods: $($c.CimClassMethods.Count))"
  }
}
