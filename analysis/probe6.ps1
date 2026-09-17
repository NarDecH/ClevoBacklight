$ErrorActionPreference = 'Continue'

"=== All live USB devices ==="
Get-PnpDevice -Class USB -Status OK -ErrorAction SilentlyContinue | Select-Object FriendlyName, InstanceId | Format-Table -AutoSize | Out-String -Width 200

"=== All live HIDClass devices ==="
Get-PnpDevice -Class HIDClass -Status OK -ErrorAction SilentlyContinue | Select-Object FriendlyName, InstanceId | Format-Table -AutoSize | Out-String -Width 200
