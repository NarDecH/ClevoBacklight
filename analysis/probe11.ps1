$ErrorActionPreference = 'Continue'

"=== All running kernel drivers matching insyde/dchu/h2o/irdc/acpi-ec-ish ==="
Get-CimInstance Win32_SystemDriver | Where-Object { $_.Name -match 'insyde|dchu|h2o|irdc|wbt|ec' -or $_.DisplayName -match 'Insyde|DCHU' } | Select-Object Name, DisplayName, State, StartMode, PathName | Format-List

"=== DriverStore packages with insyde/dchu ==="
Get-ChildItem 'C:\Windows\System32\DriverStore\FileRepository' -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -match 'insyde|dchu' } | ForEach-Object {
  "--- " + $_.Name
  Get-ChildItem $_.FullName | Select-Object Name, Length | Format-Table -AutoSize | Out-String -Width 150
}

"=== System32 drivers with insyde/dchu in name ==="
Get-ChildItem 'C:\Windows\System32\drivers' -Filter '*.sys' | Where-Object { $_.Name -match 'insyde|dchu' } | ForEach-Object { $_.FullName; $_.VersionInfo.CompanyName; $_.VersionInfo.FileDescription }

"=== InsydeDCHU.dll details ==="
$dll = Get-ChildItem 'C:\Program Files\WindowsApps' -Recurse -Filter 'InsydeDCHU.dll' -ErrorAction SilentlyContinue | Select-Object -First 1
if ($dll) {
  $dll.FullName; $dll.Length
  $dll.VersionInfo | Format-List CompanyName, ProductName, FileDescription, FileVersion
}

"=== All driver services sorted by company (unique, non-MS) ==="
Get-CimInstance Win32_SystemDriver | ForEach-Object {
  $p = $_.PathName
  if ($p) {
    $p = $p -replace '^\\\?\?\\','' -replace '^\\SystemRoot\\',"$env:SystemRoot\" -replace '^\\System32',"$env:SystemRoot\System32"
    $p = [Environment]::ExpandEnvironmentVariables($p)
    if (Test-Path $p) {
      $vi = (Get-Item $p -ErrorAction SilentlyContinue).VersionInfo
      if ($vi.CompanyName -and $vi.CompanyName -notmatch 'Microsoft') {
        "{0,-20} {1,-30} {2}" -f $_.Name, $vi.CompanyName, $p
      }
    }
  }
} | Sort-Object -Unique
