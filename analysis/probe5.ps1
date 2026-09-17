$ErrorActionPreference = 'Continue'

function Get-DevProp($id, $key) {
  (Get-PnpDeviceProperty -InstanceId $id -KeyName $key -ErrorAction SilentlyContinue).Data
}

"=== 1EA7:0064 and 062A:410A device trees ==="
$targets = Get-PnpDevice -ErrorAction SilentlyContinue | Where-Object { $_.InstanceId -match 'VID_1EA7|VID_062A|VID_048D' }
foreach ($t in $targets) {
  "--- " + $t.InstanceId
  "  Friendly : " + $t.FriendlyName
  "  Status   : " + $t.Status + "   Class: " + $t.Class
  "  Parent   : " + (Get-DevProp $t.InstanceId 'DEVPKEY_Device_Parent')
  "  Location : " + (Get-DevProp $t.InstanceId 'DEVPKEY_Device_LocationInfo')
  "  BusDesc  : " + (Get-DevProp $t.InstanceId 'DEVPKEY_BusReportedDeviceDesc')
  "  Removable: " + (Get-DevProp $t.InstanceId 'DEVPKEY_Device_Removable')
  "  DevDesc  : " + (Get-DevProp $t.InstanceId 'DEVPKEY_Device_DeviceDesc')
}

"=== Walk ancestors of each USB\VID_1EA7 root to see if internal ==="
$usbRoots = $targets | Where-Object { $_.InstanceId -like 'USB\VID_*' } | Select-Object -ExpandProperty InstanceId -Unique
foreach ($r in $usbRoots) {
  "Chain for: " + $r
  $cur = $r
  $depth = 0
  while ($cur -and $depth -lt 8) {
    $p = Get-DevProp $cur 'DEVPKEY_Device_Parent'
    $fn = (Get-PnpDevice -InstanceId $cur -ErrorAction SilentlyContinue).FriendlyName
    "   -> $cur  [$fn]"
    $cur = $p
    $depth++
  }
}

"=== HID interface paths of 1EA7 HID children (for CreateFile) ==="
$hidKids = Get-PnpDevice -Class HIDClass -ErrorAction SilentlyContinue | Where-Object { $_.InstanceId -match 'VID_1EA7' }
foreach ($h in $hidKids) {
  "--- " + $h.InstanceId
  $paths = (Get-PnpDeviceProperty -InstanceId $h.InstanceId -KeyName 'DEVPKEY_Device_EnumeratorName' -ErrorAction SilentlyContinue).Data
  $ifaces = (Get-DevProp $h.InstanceId '{add9ecd6-0707-4d04-a4a4-5d0c4be1f209}' )
  "  (enumerator: $paths)"
}
