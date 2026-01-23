"="="="="="="="="="="="="="="="="="="="="="="="="="="="="="="="=
" Title style 1: 64
"="="="="="="="="="="="="="="="="="="="="="="="="="="="="="="="=

"=============================================================="
" Title style 2: 64
"=============================================================="


"=============================================================="
" Gui settings
" Also can configuration in $HOME/vimfiles/gvimrc
" GUI 设置
" 也可以通过 $HOME/vimfiles/gvimrc 设置
"=============================================================="
"=============================================================="
" Neovide gui settings
"=============================================================="
if exists("g:neovide")
	" Put anything you want to happen only in Neovide here
	" Setting GUI options
	""""set guioptions+=
	""""set guioptions-=
	
	" Setting window postition
	""""winpos 40 40
	" Setting inner content lines and columns
	""""set lines=35 columns=140
	set lines=32 columns=120
	
	" Setting Max window
	""""set lines=999 columns=999
	
	" Setting GUI font and size
	set guifont=IosevkaTerm_NFM:h12
	
	" Padding
	let g:neovide_padding_top = 8
	let g:neovide_padding_bottom = 8
	let g:neovide_padding_right = 8
	let g:neovide_padding_left = 8
	
	" 禁用输入法，此时 Windows 端启动时默认英文状态
	let g:neovide_input_ime = v:true
	
	" 禁用记住窗口
	let g:neovide_remember_window_size = v:true
endif


"=============================================================="
" Source my common config vim script
" 加载我的通用配置 vim script
"=============================================================="
let s:configs_dir = ($HOME . '/.config/vimscript/')
if isdirectory(s:configs_dir)
	for s:file in glob(s:configs_dir . '/*.{vim,vimrc}', 0, 1)
		execute 'source'.' '.fnameescape(s:file)
	endfor
endif
if filereadable(stdpath("config")."/lua/init.lua")
	lua require("init")
endif
