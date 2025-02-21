New-Variable -Name PSLastObject
function Out-Default {
	#...Write-Host -Object "`e[35m=== Output End ===`e[0m"
	$input | Tee-Object -Variable global:PSLastObject |
	Microsoft.PowerShell.Core\Out-Default
}
