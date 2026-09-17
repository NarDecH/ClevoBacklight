$ErrorActionPreference = 'Continue'
$guid = '{93F224E4-FBDC-4BBF-ADD6-DB71BDC0AFAD}'
$dc = "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceClasses\$guid"

"=== DeviceClasses entries for DCHU GUID ==="
if (Test-Path $dc) {
  Get-ChildItem $dc | ForEach-Object {
    "--- interface key: " + $_.PSChildName
    $p = Get-ItemProperty $_.PSPath
    "   SymbolicLink: " + $p.SymbolicLink
    Get-ChildItem $_.PSPath | ForEach-Object {
      "#  " + $_.PSChildName
      $pp = Get-ItemProperty $_.PSPath -ErrorAction SilentlyContinue
      if ($pp) { $pp | Format-List | Out-String }
    }
  }
} else {
  "DeviceClasses key not found for GUID"
}

"=== Search all DeviceClasses GUIDs mentioning DCHU (fallback) ==="
Get-ChildItem 'HKLM:\SYSTEM\CurrentControlSet\Control\DeviceClasses' -ErrorAction SilentlyContinue | Where-Object { $_.PSChildName -match '93F224E4' } | ForEach-Object { $_.Name }
