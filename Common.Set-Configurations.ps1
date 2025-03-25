$CONFIG_PATH = "${HOME}\.config\"


# 创建 $HOME/.config/
if( -not (Test-Path -Path "${CONFIG_PATH}") ) {
	New-Item -ItemType Directory -Path "${CONFIG_PATH}"
}

# 将 HOME/ 下的所有 文件/文件夹 链接到 $HOME/
Get-ChildItem -Path "${PSScriptRoot}\HOME\" | %{
	New-Item -Force `
		-ItemType SymbolicLink `
		-Target $_.FullName `
		-Path "${HOME}\$($_.Name)"
}

# 将 CONFIG/ 下的所有 文件/文件夹 链接到 $HOME/.config/
Get-ChildItem -Path "${PSScriptRoot}\CONFIG\" | %{
	New-Item -Force `
		-ItemType SymbolicLink `
		-Target $_.FullName `
		-Path "${CONFIG_PATH}\$($_.Name)"
}


# vim/neovim 的特殊处理
(".vim", "vimfiles") | %{
	New-Item -Force `
		-ItemType SymbolicLink `
		-Target "${PSScriptRoot}\HOME.VIM\" `
		-Path "${HOME}\${_}"
}
(".vimrc", "_vimrc") | %{
	New-Item -Force `
		-ItemType SymbolicLink `
		-Target "${PSScriptRoot}\HOME.VIM\vimrc" `
		-Path "${HOME}\${_}"
}
New-Item -Force `
	-ItemType SymbolicLink `
	-Target "${PSScriptRoot}\HOME.VIM\" `
	-Path "${CONFIG_PATH}\nvim"


# Windows 的特殊处理
if( $IsWindows ) {
	# PowerShell
	New-Item -Force `
		-ItemType SymbolicLink `
		-Target "${PSScriptRoot}\CONFIG\PowerShell\profile.ps1" `
	-Path $PROFILE.CurrentUserAllHosts
	New-Item -Force `
		-ItemType SymbolicLink `
		-Target "${PSScriptRoot}\CONFIG\PowerShell\Microsoft.PowerShell_profile.ps1" `
	-Path $PROFILE.CurrentUserCurrentHost

	# 将所有 $HOME/.config/ 下的 文件/文件夹 链接到 $HOME/AppData/*/
	Get-ChildItem -Path $HOME\.config\ | %{
		foreach( $i in ('Local', 'LocalLow', 'Roaming') ) {
			New-Item -Force `
				-ItemType SymbolicLink `
				-Target $_.FullName `
				-Path "$HOME\AppData\$i" `
			-Name $_.Name
		}
	}
}
