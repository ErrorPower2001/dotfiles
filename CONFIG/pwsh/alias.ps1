if($IsWindows) {
	Function mpv {
		mpv.com --screenshot-format=png --keep-open=yes $args
	}
	Function mvi {
		mpv.com --config-dir="$HOME\Source\repos\mpv-image-viewer\" $args
	}
	Function mpvimage {
		mvi $args
	}

	Function code {
		code.cmd --disable-workspace-trust $args
	}
}
