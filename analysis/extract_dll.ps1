$ErrorActionPreference = 'Continue'
$src = Get-ChildItem 'C:\Program Files\WindowsApps\CLEVOCO.ControlCenter3.0*\ControlCenter30\InsydeDCHU.dll' -ErrorAction SilentlyContinue | Select-Object -First 1
if (-not $src) { $src = Get-Item 'C:\Program Files\WindowsApps\CLEVOCO.ControlCenter3.0_7.68.1.0_x64__6h6z29zh29qx0\ControlCenter30\InsydeDCHU.dll' -ErrorAction SilentlyContinue }
if ($src) {
  Copy-Item $src.FullName "$env:TEMP\InsydeDCHU.dll" -Force
  "copied: $env:TEMP\InsydeDCHU.dll ($($src.Length) bytes)"
} else {
  "direct access failed, trying runas-free dir listing"
  cmd /c dir /b "C:\Program Files\WindowsApps" 2>&1 | Select-String CLEVO
}
