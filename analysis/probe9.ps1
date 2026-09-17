$ErrorActionPreference = 'Continue'

"=== kbldfltr.sys file info ==="
Get-Item C:\Windows\System32\drivers\kbldfltr.sys -ErrorAction SilentlyContinue | ForEach-Object {
  $_.FullName; $_.Length; $_.LastWriteTime
  (Get-Item $_.FullName).VersionInfo | Format-List CompanyName, ProductName, FileDescription, FileVersion, OriginalFilename
}

"=== Kernel drivers currently loaded, non-Microsoft ==="
Get-CimInstance Win32_SystemDriver | Where-Object { $_.State -eq 'Running' } | ForEach-Object {
  $p = $_.PathName -replace '^\\\?\?\\','' -replace '^\\SystemRoot\\',"$env:SystemRoot\"
  $p = [Environment]::ExpandEnvironmentVariables($p)
  if ($p -and (Test-Path $p)) {
    $vi = (Get-Item $p -ErrorAction SilentlyContinue).VersionInfo
    if ($vi -and $vi.CompanyName -notmatch 'Microsoft|Intel|NVIDIA|Advanced Micro|AMD|Realtek|Synaptics|Conexant|Qualcomm') {
      [PSCustomObject]@{ Name=$_.Name; Company=$vi.CompanyName; Desc=$vi.FileDescription; Path=$p }
    }
  }
} | Format-Table -AutoSize | Out-String -Width 220

"=== Services with ImagePath under WindowsApps ==="
Get-CimInstance Win32_Service | Where-Object { $_.PathName -match 'WindowsApps|ControlCenter' } | Select-Object Name, State, PathName | Format-List

"=== Try listing the Control Center package folder ==="
$pkg = Get-ChildItem 'C:\Program Files\WindowsApps' -Filter 'CLEVOCO.ControlCenter3.0*' -ErrorAction SilentlyContinue
$pkg | ForEach-Object { $_.FullName }
if ($pkg) {
  Get-ChildItem $pkg.FullName -Recurse -ErrorAction SilentlyContinue | Select-Object -First 60 FullName, Length | Format-Table -AutoSize | Out-String -Width 220
}
