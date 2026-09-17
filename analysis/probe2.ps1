$ErrorActionPreference = 'Continue'

"=== GUID-named classes in root\WMI ==="
$classes = Get-CimClass -Namespace root/WMI
$guidNamed = $classes | Where-Object { $_.CimClassName -match '^[0-9A-Fa-f]{8}_' } | Select-Object -ExpandProperty CimClassName | Sort-Object -Unique
$guidNamed
"count: " + $guidNamed.Count

"=== Details of GUID-named classes (methods + properties) ==="
foreach ($name in $guidNamed) {
  $c = Get-CimClass -Namespace root/WMI -ClassName $name -ErrorAction SilentlyContinue
  if ($c) {
    "Class: $name"
    $m = $c.CimClassMethods
    if ($m.Count -gt 0) {
      "  Methods:"
      $m | ForEach-Object {
        $q = ($_.Qualifiers | ForEach-Object { $_.Name + '=' + $_.Value }) -join ','
        "   - " + $_.Name + " [" + $q + "]"
        $_.Parameters | ForEach-Object { "       param: " + $_.Name + " : " + $_.CimType }
      }
    }
    $p = $c.CimClassProperties | Where-Object { $_.Name -notin @('InstanceName','Active') }
    if ($p.Count -gt 0) {
      "  Properties:"
      $p | ForEach-Object { "   - " + $_.Name + " : " + $_.CimType }
    }
  }
}

"=== Classes whose name contains KSW/IT/ASUS/TONGF/QUANTA/NOTEBOOK (extra sweep) ==="
$classes | Where-Object { $_.CimClassName -match 'KSW|ITE|IT55|TONGF|QUANTA|NOTEBOOK|OEM' } | Select-Object -ExpandProperty CimClassName | Sort-Object -Unique
