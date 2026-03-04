" Auto switch input method in Windows
" 自动切换 Windows 的输入法
if has("Win32")
	if executable("WeaselServer.exe")
		autocmd VimEnter	*	:call system("WeaselServer.exe /ascii")
		autocmd InsertLeave	*	:call system("WeaselServer.exe /ascii")
	endif
endif
