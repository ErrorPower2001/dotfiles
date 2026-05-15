" vim:shiftwidth=8:noexpandtab:

" Auto switch input method in Windows
" 自动切换 Windows 的输入法
if has("Win32")
	if executable("WeaselServer.exe")
		autocmd VimEnter	*	:call system("WeaselServer.exe /ascii")
		autocmd InsertLeave	*	:call system("WeaselServer.exe /ascii")
	endif
elseif has("linux")
	autocmd VimEnter	*	:call system("busctl call --user org.fcitx.Fcitx5 /rime org.fcitx.Fcitx.Rime1 SetAsciiMode b 1")
	autocmd InsertLeave	*	:call system("busctl call --user org.fcitx.Fcitx5 /rime org.fcitx.Fcitx.Rime1 SetAsciiMode b 1")
endif
