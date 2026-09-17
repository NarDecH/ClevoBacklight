$ErrorActionPreference = 'Continue'

"=== ControlCenter30 loaded modules (non-Windows) ==="
try {
  $p = Get-Process -Id 18120 -ErrorAction Stop
  $p.Modules | ForEach-Object {
    $vi = $_.FileVersionInfo
    if ($_.FileName -notmatch '\\Windows\\|\\.NET\\|mscorlib|WindowsBase|System\\.') {
      "{0}  [{1} | {2}]" -f $_.FileName, $vi.CompanyName, $vi.FileDescription
    }
  }
} catch { "module list failed: $_" }

"=== Code integrity / test signing state ==="
bcdedit /enum "{current}" 2>&1 | Select-String -Pattern 'testsigning|nointegritychecks|hypervisorlaunchtype'

"=== Core Temp folder (does it ship ALSysIO?) ==="
Get-ChildItem 'C:\Program Files\Core Temp' -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Name
