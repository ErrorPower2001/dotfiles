if($IsWindows) {
	Function mpv {
		mpv.com --screenshot-format=png --keep-open=yes $args;
	}
	Function mvi {
		mpv.com --config-dir="$HOME\Source\repos\mpv-image-viewer\" $args;
	}
	Function mpvimage {
		mvi $args;
	}

	Function code {
		code.cmd --disable-workspace-trust $args;
	}

	if ( Test-Path -Path "$HOME\scoop\apps\uutils-coreutils-lean\current\coreutils.exe" ) {
		Remove-Alias -Name rm;
		Function rm {
			& "$HOME\scoop\apps\uutils-coreutils-lean\current\coreutils.exe" `
				rm $args;
		}
	}
}
