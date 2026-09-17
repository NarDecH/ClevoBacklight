$ErrorActionPreference = 'Stop'
$out = Join-Path $PSScriptRoot 'acpi'
New-Item -ItemType Directory -Force -Path $out | Out-Null

$tables = 0
Get-ChildItem 'HKLM:\HARDWARE\ACPI' -ErrorAction Stop | ForEach-Object {
  $kind = $_.PSChildName
  Get-ChildItem $_.PSPath -ErrorAction SilentlyContinue | ForEach-Object {
    $oemid = $_.PSChildName
    Get-ChildItem $_.PSPath -ErrorAction SilentlyContinue | ForEach-Object {
      $tbl = $_.PSChildName
      $props = Get-ItemProperty $_.PSPath -ErrorAction SilentlyContinue
      $blob = $props.'00000000'
      if ($blob) {
        $file = Join-Path $out ("{0}_{1}_{2}.aml" -f $kind, $oemid, $tbl)
        [IO.File]::WriteAllBytes($file, [byte[]]$blob)
        $tables++
        "{0} -> {1} ({2} bytes)" -f "$kind\$oemid\$tbl", $file, $blob.Length
      }
    }
  }
}
"Dumped $tables tables."
