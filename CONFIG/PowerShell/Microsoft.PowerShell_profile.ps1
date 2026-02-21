function Write-HostWithTime {
	param([String]$Object, [switch]$NoNewline)
	Write-Host -NoNewline -Object "`e[92m[$(Get-Date -Format "MM:hh:ss.ffff")]`e[0m"
	if ($NoNewline) {
		Write-Host -NoNewline -Object $Object
	}
	else {
		Write-Host -Object $Object
	}
}

Write-HostWithTime -Object "Start loading `$PROFILE.CurrentUserCurrentHost"


Write-HostWithTime -Object "Dot sourcing more commands in `$HOME\.config\pwsh\"
Get-ChildItem -Path $HOME\.config\pwsh\ -Filter "*.ps1" | %{ . $_.FullName }


Write-HostWithTime -Object "Setting input and output encoding to UTF-8"
$OutputEncoding = `
[System.Console]::InputEncoding = `
[System.Console]::OutputEncoding = `
	[System.Text.Encoding]::GetEncoding(65001)


Write-HostWithTime -Object "Importing scoop-completion module from scoop bucket:extras/scoop-completion"
Import-Module "$((Get-Item (Get-Command scoop.ps1).Path).Directory.Parent.FullName)\modules\scoop-completion"


if ($env:USE_POSHGIT -eq $true) {
	Write-HostWithTime -Object "Importing posh-git module"
	Import-Module "$((Get-Module -ListAvailable -Name posh-git).Path)"
}
