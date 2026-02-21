Write-HostWithTime -Object "Setting new variable PSLastObject to record"
New-Variable -Name PSLastObject
function Out-Default {
	$input | Tee-Object -Variable Global:PSLastObject |
	Microsoft.PowerShell.Core\Out-Default
}
<##
 #...function Out-Default {
 #...	$input.MoveNext()
 #...
 #...	if( $input.Current -is [Object]) {
 #...		#...Write-Host -Object "`e[35m=== Output ===`e[0m"
 #...	}
 #...	$input.Current | Tee-Object -Variable Global:PSLastObject | Microsoft.PowerShell.Core\Out-Default
 #...	#...$input.Current | Tee-Object -Variable Global:PSLastObject
 #...	#...$input.Current | Microsoft.PowerShell.Core\Out-Default
 #...}
##>
