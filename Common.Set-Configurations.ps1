###############################################################################
# Create symbolic link to config my dotfiles
###############################################################################


###############################################################################
# Handle Windows's $HOME\.config
###############################################################################
if ( $IsWindows ) {
	if ( `
	(Test-Path -Path "$HOME\.config\") `
	-and  `
	!(Get-Item -Path "$HOME\.config\" | Select-Object -ExpandProperty LinkType) `
	) {
		Get-ChildItem -Path "$HOME\.config\" | `
			Move-Item -Force -Destination "$HOME\AppData\Local\"
		
		Remove-Item -Force -Recurse -Path "$HOME\.config\"
		
		New-Item -Force -ItemType SymbolicLink `
		-Path "$HOME\.config" `
		-Target "$HOME\AppData\Local\"
	}
	else {
		New-Item -Force -ItemType SymbolicLink `
		-Path "$HOME\.config" `
		-Target "$HOME\AppData\Local\"
	}
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

	$ConfigInRoot = "$PSScriptRoot\$Config"
	
	# 如果未填写名称
	if ( ! $Name ) {
		# 名称设置为配置文件名称
		$Name = (Get-Item -Force -Path $ConfigInRoot).Name
	}
	
	New-Item -Force -ItemType SymbolicLink `
	-Path "$HOME\.config\$Name" `
	-Target "$( (Get-Item -Force -Path $ConfigInRoot).FullName )"
}


###############################################################################
# Configuration
###############################################################################
Set-ConfigurationSymbolicLink -Config alacritty
Set-ConfigurationSymbolicLink -Config wezterm
Set-ConfigurationSymbolicLink -Config rio
Set-ConfigurationSymbolicLink -Config hypr
Set-ConfigurationSymbolicLink -Config waybar
####Set-ConfigurationSymbolicLink -Config xdg-user-dirs

if (! $IsWindows)
{ Set-ConfigurationSymbolicLink -Config neoORvim -Name "..\.vim" }
else
{ Set-ConfigurationSymbolicLink -Config neoORvim -Name "..\vimfiles" }
Set-ConfigurationSymbolicLink -Config neoORvim -Name nvim
Set-ConfigurationSymbolicLink -Config 'neoORvim\epcommon.vimrc' -Name "..\epcommon.vimrc"

Set-ConfigurationSymbolicLink -Config 'bash\.bash_profile' -Name "..\.bash_profile"
Set-ConfigurationSymbolicLink -Config 'bash\.bashrc' -Name "..\.bashrc"
Set-ConfigurationSymbolicLink -Config 'bash\epcommon.bashrc' -Name "..\epcommon.bashrc"
Set-ConfigurationSymbolicLink -Config 'mintty\.minttyrc' -Name "..\.minttyrc"


###############################################################################
# Unset funcrion
###############################################################################
Remove-Item -Path Function:\Set-ConfigurationSymbolicLink
