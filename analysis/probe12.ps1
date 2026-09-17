$ErrorActionPreference = 'Continue'

"=== ALSysIO64.sys signature ==="
$f = Get-AuthenticodeSignature "$env:TEMP\ALSysIO64.sys" -ErrorAction SilentlyContinue
$f | Format-List Status, StatusMessage, SignerCertificate

"=== ALSysIO64.sys file details ==="
Get-Item "$env:TEMP\ALSysIO64.sys" -ErrorAction SilentlyContinue | ForEach-Object { $_.Length; $_.VersionInfo | Format-List CompanyName, FileDescription, FileVersion }

"=== CI policy files ==="
Get-ChildItem 'C:\Windows\System32\CodeIntegrity' -Filter 'CiPolicies*' -ErrorAction SilentlyContinue | Select-Object Name, Length
Get-ChildItem 'C:\Windows\System32\CodeIntegrity' -Filter '*.bin' -ErrorAction SilentlyContinue | Select-Object Name, Length

"=== Current driver services that run from user paths ==="
Get-ChildItem 'HKLM:\SYSTEM\CurrentControlSet\Services' | ForEach-Object {
  $p = (Get-ItemProperty $_.PSPath).ImagePath
  if ($p -and ($p -match 'Temp|Users|Program Files[^\\]*\\[^\\]*\.sys$' -or $p -match 'ALSysIO')) {
    "{0}: {1} (Start={2})" -f $_.PSChildName, $p, (Get-ItemProperty $_.PSPath).Start
  }
}

"=== Test signing effective state ==="
bcdedit 2>&1 | Select-String -Pattern 'testsigning|nointegritychecks|allowed_in_memory|disable_elam'
