"Start Loading `$PROFILE.CurrentUserCurrentHost" | Write-Host


"`tSetting input and output encoding to UTF-8" | Write-Host
$OutputEncoding = `
[System.Console]::InputEncoding = `
[System.Console]::OutputEncoding = `
	[System.Text.Encoding]::GetEncoding(65001)
#...[System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding(65001)


"`tPowerShell parameter completion shim for the dotnet CLI" | Write-Host
# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
	param($commandName, $wordToComplete, $cursorPosition)
	dotnet complete --position $cursorPosition "$wordToComplete" | `
	ForEach-Object {
		[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
	}
}


"`tPowerShell parameter completion shim for the winget" | Write-Host
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
	param($wordToComplete, $commandAst, $cursorPosition)
	[Console]::InputEncoding = `
	[Console]::OutputEncoding = `
	$OutputEncoding = `
		[System.Text.Utf8Encoding]::new()
	$Local:word = $wordToComplete.Replace('"', '""')
	$Local:ast = $commandAst.ToString().Replace('"', '""')
	winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | `
	ForEach-Object {
		[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
	}
}


#..."`tImporting scoop-completion module from buckets:extras/scoop-completion" | Write-Host
# scoop-completion
# enable completion in current shell
# Import-Module "$($(Get-Item $(Get-Command scoop.ps1).Path).Directory.Parent.FullName)\modules\scoop-completion"
$scoop_root_path = (
	Get-Item (
		Get-Command scoop.ps1
	).Path
).Directory.Parent.FullName
$scoop_completion_path = "${scoop_root_path}\modules\scoop-completion"
#
if( Get-Item -Path $scoop_completion_path ) {
	"`tImporting scoop-completion module from buckets:extras/scoop-completion" | Write-Host
	Import-Module $scoop_completion_path
}
#
Remove-Variable -Name "scoop_root_path"
Remove-Variable -Name "scoop_completion_path"


"`tImporting posh-git module" | Write-Host
# posh-git
Import-Module posh-git


#...Set-PSReadLineOption -PredictionViewStyle ListView
#...Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete


"`tSetting cd with ls" | Write-Host
# Remove-Alias -Name cd
function cdls {
	Set-Location -Path $args[0]
	Get-ChildItem
}

"`tSetting PSReadLine TAB key function" | Write-Host
Set-PSReadlineKeyHandler -Key Tab -ScriptBlock {
	try {
		$line = $cursor = $null
		[Microsoft.PowerShell.PSConsoleReadline]::GetBufferState([ref]$line, [ref]$cursor)
		# Tilde replace to HOME
		$home_tilde_match ='(?<=(^)|( )|( '')|( "))~(?=[\\/]?)'
		# $home_tilde_match ='(?<=^| | ''| ")~(?=[\\/]?)'
		if($line -match $home_tilde_match) {
			[Microsoft.PowerShell.PSConsoleReadline]::RevertLine()
			[Microsoft.PowerShell.PSConsoleReadline]::Insert(
				($line -replace $home_tilde_match, $HOME)
			)
		}
		# Emulate cygwin drive mount
		$mount_match = '(?<=(^)|( )|( '')|( "))[\\/][a-z](?=[\\/]?)'	# $Matches[6]
		# $mount_match = '(?<=^| | ''| ")[\\/][a-z](?=[\\/]?)'		# $Matches[2]
		if($line -match $mount_match) {
			[Microsoft.PowerShell.PSConsoleReadline]::RevertLine()
			[Microsoft.PowerShell.PSConsoleReadline]::Insert(
				($line -replace $mount_match, "$( $Matches[0].Remove(0,1).ToUpper() ):\")
			)
		}
	}
	finally {
		[Microsoft.PowerShell.PSConsoleReadLine]::TabCompleteNext()
		Remove-Variable -Name "line"
		Remove-Variable -Name "cursor"
		Remove-Variable -Name "home_tilde_match"
		Remove-Variable -Name "mount_match"
	}
}


"`tSetting user's shell variable" | Write-Host
#...Set-Variable -Name 'Workstation' -Value 'C:\Users\PengChenxiang\OneDrive\Workstation' #'C:\Users\PengChenxiang\Workstation'
Set-Variable -Name "EnableMyPrompt" -Value $true
# Disabled Python venv prompt
$Env:VIRTUAL_ENV_DISABLE_PROMPT = 1


"`tImporting ErrorPowerCommonMdule" | Write-Host
$ep_common_module = "$Env:OneDrive\Programs\PowerShell\Modules\ErrorPowerCommonModule.psm1"
if(Test-Path -Path $ep_common_module ) {
	Import-Module $ep_common_module
}
Remove-Variable -Name "ep_common_module"


<#
"`tSetting Enter key transforms ~(tildes) to `$HOME" | Write-Host
Set-PSReadlineKeyHandler -Key Enter -ScriptBlock {
	try {
		$line = $cursor = $null
		[Microsoft.PowerShell.PSConsoleReadline]::GetBufferState([ref]$line, [ref]$cursor)
		if($line -match '(?<= | ''| ")~(?=[\\/]?)') {
			[Microsoft.PowerShell.PSConsoleReadline]::RevertLine()
			[Microsoft.PowerShell.PSConsoleReadline]::Insert(($line -replace '(?<= | ''| ")~(?=[\\/]?)', $HOME))
		}
	}
	finally {
		[Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
	}
}
#>
