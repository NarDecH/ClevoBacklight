$ErrorActionPreference = 'Continue'

"=== DeviceClasses: search SymbolicLink values containing WBT/IRDC/Insyde ==="
$found = 0
Get-ChildItem 'HKLM:\SYSTEM\CurrentControlSet\Control\DeviceClasses' -ErrorAction SilentlyContinue | ForEach-Object {
  $guidDir = $_
  Get-ChildItem $_.PSPath -ErrorAction SilentlyContinue | ForEach-Object {
    $p = Get-ItemProperty $_.PSPath -ErrorAction SilentlyContinue
    if ($p.SymbolicLink -match 'WBT|IRDC|INDE|DCHU|Insyde') {
      "GUID-dir: " + $guidDir.PSChildName
      "  link: " + $p.SymbolicLink
      $found++
    }
  }
}
"matches: $found"

"=== Services: WbtP / INDE / irdc (any start mode) ==="
Get-ChildItem 'HKLM:\SYSTEM\CurrentControlSet\Services' | Where-Object { $_.PSChildName -match '^Wbt|^WBT|INDE|IRDC' } | ForEach-Object {
  $p = Get-ItemProperty $_.PSPath
  "{0}: Start={1} Type={2} ImagePath={3}" -f $_.PSChildName, $p.Start, $p.Type, $p.ImagePath
}

"=== Enum values named *Wbt* anywhere in Services ==="
Get-ChildItem 'HKLM:\SYSTEM\CurrentControlSet\Services' | ForEach-Object {
  $props = (Get-ItemProperty $_.PSPath -ErrorAction SilentlyContinue).PSObject.Properties
  foreach ($pr in $props) {
    if ($pr.Value -is [string] -and $pr.Value -match 'Wbt|Insyde') {
      "{0} :: {1} = {2}" -f $_.PSChildName, $pr.Name, $pr.Value
    }
  }
}
