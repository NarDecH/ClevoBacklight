$ErrorActionPreference = 'Continue'
$guid = '{86994C74-AD43-4812-B7E7-0C420B5C5DD7}'
$dc = "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceClasses\$guid"

"=== DeviceClasses for DCHU interface GUID ==="
if (Test-Path $dc) {
  Get-ChildItem $dc | ForEach-Object {
    "--- " + $_.PSChildName
    $p = Get-ItemProperty $_.PSPath
    "   SymbolicLink : " + $p.SymbolicLink
    Get-ChildItem $_.PSPath | ForEach-Object {
      "    ref: " + $_.PSChildName
      $pp = Get-ItemProperty $_.PSPath -ErrorAction SilentlyContinue
      if ($pp.PSObject.Properties.Name -contains 'Pdo') { "    Pdo: " + $pp.Pdo }
      if ($pp.PSObject.Properties.Name -contains 'IsEnabled') { "    IsEnabled: " + $pp.IsEnabled }
    }
  }
} else { "NOT FOUND in DeviceClasses" }

"=== Search services for wbtp/dchu provider ==="
Get-ChildItem 'HKLM:\SYSTEM\CurrentControlSet\Services' | Where-Object { $_.PSChildName -match 'wbtp|dchu|irdc|prov' } | ForEach-Object {
  $p = Get-ItemProperty $_.PSPath
  "{0} Start={1} Type={2} Path={3}" -f $_.PSChildName, $p.Start, $p.Type, $p.ImagePath
}
