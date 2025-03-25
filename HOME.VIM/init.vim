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
	set lines=30 columns=96
	
	" Setting Max window
	""""set lines=999 columns=999
	
	" Setting GUI font and size
	set guifont=Maple_Mono_SC_NF:h12
	
	" Padding
	let g:neovide_padding_top = 8
	let g:neovide_padding_bottom = 0
	let g:neovide_padding_right = 4
	let g:neovide_padding_left = 8
	
	" 禁用输入法，此时 Windows 端启动时默认英文状态
	let g:neovide_input_ime = v:false
	
	" 禁用记住窗口
	let g:neovide_remember_window_size = v:false
endif


"=============================================================="
" Source my common config vim script
" 加载我的通用配置 vim script
"=============================================================="
source $HOME/.config/vimscript/000.vimrc
