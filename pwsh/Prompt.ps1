function prompt {
	function trim_char ($color, $char, [switch]$reverse) {
		$output = ""
		$color -= 10
		if ($reverse) {
			$output = "`e[7m"
		}
		$output += "`e[${color}m"
		$output += $char
		$output += "`e[0m"
		return $output
	}

	$prompt = ""


	$character = "`u{e0b0}"
	$foreground = 37
	$background = 44
	$prompt += (trim_char -color $background -char $character -reverse)
	$prompt += "`e[${foreground};${background}m"
	$prompt += " "
	$prompt += "pwsh"
	$prompt += " "
	$prompt += "`e[0m"
	$prompt += (trim_char -color $background -char $character)


	#...$prompt += " "


	$prompt += (trim_char -color 49 -char $character -reverse)
	$prompt += "`e[7m"
	$prompt += " "
	$prompt += "$($ExecutionContext.SessionState.Path.CurrentLocation)"
	$prompt += " "
	$prompt += "`e[0m"
	$prompt += (trim_char -color 49 -char $character)


	if( Test-Path -Path "${PWD}\.git") {
		if( -not (Get-Module posh-git) ) {
			Import-Module -Verbose "$((Get-Module -ListAvailable -Name posh-git).Path)"
		}
		else {
			$prompt += Write-VcsStatus
		}
	}


	$prompt += "`n"
	$prompt += "$('>' * ($NestedPromptLevel + 1))"
	$prompt += " "

	return $prompt
}

Set-PSReadLineOption -PromptText "> ", "! "
