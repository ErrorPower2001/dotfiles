###############################################################################
# Create symbolic link to config my dotfiles
###############################################################################


###############################################################################
# 创建 $HOME/.config/
###############################################################################
if( !(Test-Path -Path $HOME\.config\) ) {
	New-Item -ItemType Directory -Path $HOME\.config\
}


###############################################################################
# Function
###############################################################################
# 配置文件目录 $HOME\.config
# 该方法仅对 New-Item -ItemType SymbolicLink 进行包装
function Set-ConfigurationSymbolicLink {
	param(
		[string]$Config,
		[string]$Name
	)
	
	# 配置文件的绝对路径
	$ConfigInRoot = "$PSScriptRoot\$Config"
	
	# 如果未填写名称
	if ( ! $Name ) {
		# 名称设置为配置文件名称
		$Name = (Get-Item -Force -Path $ConfigInRoot).Name
		
		<#
		# 由于没有具体路径，说明会配置到 $HOME\.config\ -> $HOME\AppData\Local\
		# 介于一些 Windows 端的配置文件目录不在 %LOCALAPPDATA% 而是在
		# %APPDATA% -> $HOME\AppData\Roaming\，将未填写名称的配置文件同时链接。
		if ( $IsWindows ) {
			# 将配置文件链接到 $HOME\AppData\Roaming\
			New-Item -Force -ItemType SymbolicLink `
			-Target "$( (Get-Item -Force -Path $ConfigInRoot).FullName )" `
			-Path "$HOME\AppData\Roaming\$Name"
		}
		#>
	}
	
	# 将配置文件链接到 $HOME\.config\
	New-Item -Force -ItemType SymbolicLink `
	-Target "$( (Get-Item -Force -Path $ConfigInRoot).FullName )" `
	-Path "$HOME\.config\$Name"
}


###############################################################################
# Configuration
###############################################################################
Set-ConfigurationSymbolicLink -Config alacritty
Set-ConfigurationSymbolicLink -Config wezterm
Set-ConfigurationSymbolicLink -Config rio
Set-ConfigurationSymbolicLink -Config hypr
Set-ConfigurationSymbolicLink -Config waybar
Set-ConfigurationSymbolicLink -Config kitty
####Set-ConfigurationSymbolicLink -Config xdg-user-dirs

#...if (! $IsWindows)
#...{ Set-ConfigurationSymbolicLink -Config neoORvim -Name "..\.vim" }
#...else
#...{ Set-ConfigurationSymbolicLink -Config neoORvim -Name "..\vimfiles" }
#...Set-ConfigurationSymbolicLink -Config neoORvim -Name nvim
#...Set-ConfigurationSymbolicLink -Config 'neoORvim\epcommon.vimrc' -Name "..\epcommon.vimrc"
Set-ConfigurationSymbolicLink -Config "vim\epcommon.vimrc" -Name "..\epcommon.vimrc"
#
# For Linux
Set-ConfigurationSymbolicLink -Config "vim" -Name "..\.vim"
Set-ConfigurationSymbolicLink -Config "vim\vimrc" -Name "..\.vimrc"
# For Windows
Set-ConfigurationSymbolicLink -Config "vim" -Name "..\vimfiles"
Set-ConfigurationSymbolicLink -Config "vim\vimrc" -Name "..\_vimrc"
#
Set-ConfigurationSymbolicLink -Config "vim" -Name "nvim"

Set-ConfigurationSymbolicLink -Config 'bash\.bash_profile' -Name "..\.bash_profile"
Set-ConfigurationSymbolicLink -Config 'bash\.bashrc' -Name "..\.bashrc"
Set-ConfigurationSymbolicLink -Config 'bash\epcommon.bashrc' -Name "..\epcommon.bashrc"
Set-ConfigurationSymbolicLink -Config 'mintty\.minttyrc' -Name "..\.minttyrc"
Set-ConfigurationSymbolicLink -Config 'inputrc' -Name '..\.inputrc'


###############################################################################
# Unset funcrion
###############################################################################
Remove-Item -Path Function:\Set-ConfigurationSymbolicLink


###############################################################################
# Link config file to Windows AppData
###############################################################################
if ( $IsWindows ) {
	Get-ChildItem -Path $HOME\.config\ | `
	%{
		foreach( $i in ('Local', 'LocalLow', 'Roaming') ) {
			New-Item -Force -ItemType SymbolicLink `
			-Target $_.FullName `
			-Path "$HOME\AppData\$i" -Name $_.Name
		}
	}
}
