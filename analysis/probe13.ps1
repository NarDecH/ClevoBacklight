$ErrorActionPreference = 'Continue'

"=== Full Control Center package listing ==="
$pkgRoot = 'C:\Program Files\WindowsApps\CLEVOCO.ControlCenter3.0_7.68.1.0_x64__6h6z29zh29qx0'
Get-ChildItem $pkgRoot -Recurse -ErrorAction SilentlyContinue | ForEach-Object { "{0}  {1}" -f $_.FullName.Substring($pkgRoot.Length), $_.Length }

"=== DriverStore: any .sys whose company is Insyde ==="
Get-ChildItem 'C:\Windows\System32\DriverStore\FileRepository' -Recurse -Filter '*.sys' -ErrorAction SilentlyContinue | ForEach-Object {
  $vi = $_.VersionInfo
  if ($vi.CompanyName -match 'Insyde') { "{0} | {1} | {2}" -f $_.FullName, $vi.CompanyName, $vi.FileDescription }
}

"=== System32 drivers: Insyde company ==="
Get-ChildItem 'C:\Windows\System32\drivers' -Filter '*.sys' | ForEach-Object {
  $vi = $_.VersionInfo
  if ($vi.CompanyName -match 'Insyde') { "{0} | {1} | {2}" -f $_.FullName, $vi.CompanyName, $vi.FileDescription }
}
