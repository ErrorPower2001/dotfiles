" Transitioning from Vim
""""set runtimepath^=~\.vim
""""set runtimepath+=~\.vim\after
""""let &packpath = &runtimepath
""""source ~\_vimrc


" 设置 PowerShell
""""set shell=C:\\Users\\PengChenxiang\\AppData\\Local\\Microsoft\\WindowsApps\\pwsh.exe
""""set shellcmdflag=\ -c
""""set shellquote=\"
""""set shellxquote=


" 备份文件扩展名
set backupext=.bak


" 设置输入模式显示
""""set showmode


" 显示行号
set number relativenumber

" 总是显示光标位置
set ruler


" 制表符显示大小
""""set tabstop=4
" 每步（自动）缩进所使用的空格数（局部缓冲区）「原文如此」
""""set shiftwidth=4


" 高亮搜索结果
set hlsearch
" 即时搜索
set incsearch
" 搜索忽略大小写
set ignorecase
" 搜索大写覆盖
set smartcase


" 设置新建和删除窗口时，所有窗口总是保持相同大小
set equalalways

" 新分割窗口出现在下边
set nosplitbelow
" 新分割窗口出现在右侧
set splitright


" 设置空格、制表符等隐藏字符样式
set listchars=tab:\|->,trail:-,nbsp:+,eol:↵,multispace:\|···
" 空格与制表符，隐藏字符显示
set list


" 启用 matchit 插件
" 该插件使 % 命令可跳转到匹配的 HTML 标签、Vim 脚本中的 if/else/endif 等。
packadd! matchit

" Vim-Plug
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Declare the list of plugins.
	Plug 'tpope/vim-sensible'
	Plug 'junegunn/seoul256.vim'

	""""PlugInstall ZFVimIM ZFVimIM_pinyin_base ZFVimIM_pinyin_huge ZFVimIM_english_base ZFVimJob
	Plug 'ZSaberLv0/ZFVimIM'
	Plug 'ZSaberLv0/ZFVimJob'
	Plug 'ZSaberLv0/ZFVimIM_pinyin_base'
	Plug 'ZSaberLv0/ZFVimIM_pinyin_huge'
	Plug 'ZSaberLv0/ZFVimIM_english_base'
	Plug 'ZSaberLv0/ZFVimIM_japanese_base'

	Plug 'pprovost/vim-ps1'

	Plug 'godlygeek/tabular'
	Plug 'preservim/vim-markdown'

	Plug 'preservim/nerdtree'

	""""Plug 'kassio/neoterm'

	Plug 'rebelot/terminal.nvim'

	""""Plug 'lukas-reineke/indent-blankline.nvim'

	Plug 'shellRaining/hlchunk.nvim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" Plugin Settings
"#"#"#"#"#"#"#"#"#"#"#"#"#"#"#"#
" junegunn/seoul256.vim
" Unified color scheme (default: dark)
let g:seoul256_background = 235
colo seoul256
" Light color scheme
""""colo seoul256-light
" Switch
""""set background=dark
""""set background=light

let g:ps1_nofold_blocks = 1
let g:ps1_nofold_sig = 1

set nofoldenable


" Set language to chinese
""""language chinese_china
""""set langmenu=zh_cn.utf-8


" Coursour No Style
set guicursor=


" Scrolloffset Lines
set scrolloff=999
