" Transitioning from Vim
" 从 vim 迁移到 neovim
""""set runtimepath^=~\.vim
""""set runtimepath+=~\.vim\after
""""let &packpath = &runtimepath
""""source ~\_vimrc

" Setting neovim shell to PowerShell
" 设置 neovim 的 shell 为 pwsh
""""set shell=C:\\Users\\PengChenxiang\\AppData\\Local\\Microsoft\\WindowsApps\\pwsh.exe
""""set shellcmdflag=\ -c
""""set shellquote=\"
""""set shellxquote=
"
""""set shell=pwsh
""""set shellcmdflag=\ -NoProfile\ -c

" Backup file's extent
" 备份文件后缀名
set backupext=.bak

" Setting input mode views
" 设置输入模式显示
""""set showmode

" Setting line number to relative
" 显示行号
set number relativenumber

" Setting always show ruler
" 总是显示光标位置
set ruler

" Setting search options
" 高亮搜索结果
set hlsearch
" 即时搜索
set incsearch
" 搜索忽略大小写
set ignorecase
" 搜索大写覆盖
set smartcase

" Setting split windows to same sizes
" 设置新建和删除窗口时，所有窗口总是保持相同大小
set equalalways
" 新分割窗口出现在下边
set nosplitbelow
" 新分割窗口出现在右侧
set splitright

" 设置空格、制表符等隐藏字符样式
""""set listchars=tab:\|->,trail:-,nbsp:+,eol:↵,multispace:\|···
set listchars=tab:\|->,multispace:\|···,trail:-,nbsp:+
" 空格与制表符，隐藏字符显示
set list

" packadd plugin
"
" 启用 matchit 插件
" 该插件使 % 命令可跳转到匹配的 HTML 标签、Vim 脚本中的 if/else/endif 等。
packadd! matchit

" Vim-Plug
"
" Plugins will be downloaded under the specified directory.
" vim-plug 插件设置
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Declare the list of plugins.
	" neovim 官方 lsp 插件
	""""Plug 'neovim/nvim-lspconfig'

	""""Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" 一些 vim 默认值配置插件
	Plug 'tpope/vim-sensible'
	" seoul256 色彩
	Plug 'junegunn/seoul256.vim'

	" PlugInstall ZFVimIM ZFVimIM_pinyin_base ZFVimIM_pinyin_huge ZFVimIM_english_base ZFVimJob
	" vim 内置输入法插件
	""""Plug 'ZSaberLv0/ZFVimIM'
	""""Plug 'ZSaberLv0/ZFVimJob'
	""""Plug 'ZSaberLv0/ZFVimIM_pinyin_base'
	""""Plug 'ZSaberLv0/ZFVimIM_pinyin_huge'
	""""Plug 'ZSaberLv0/ZFVimIM_english_base'
	""""Plug 'ZSaberLv0/ZFVimIM_japanese_base'

	" PowerShell 脚本着色插件
	""""Plug 'pprovost/vim-ps1'
	" Markdown 着色插件
	""""Plug 'preservim/vim-markdown'

	" 文本对齐
	""""Plug 'godlygeek/tabular'

	" 文件树插件
	Plug 'preservim/nerdtree'

	" neoterm 终端插件
	""""Plug 'kassio/neoterm'

	" terminal 终端插件
	Plug 'rebelot/terminal.nvim'

	" 代码对齐线插件
	""""Plug 'lukas-reineke/indent-blankline.nvim'
	" 代码对齐线插件
	""""Plug 'shellRaining/hlchunk.nvim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" junegunn/seoul256.vim
"
" Unified color scheme (default: dark)
let g:seoul256_background = 235
colo seoul256
" Light color scheme
""""colo seoul256-light
" Switch
""""set background=dark
""""set background=light

" vim-ps1 config
""""let g:ps1_nofold_blocks = 1
""""let g:ps1_nofold_sig = 1
""""set nofoldenable


" Set language to chinese
""""language chinese_china
""""set langmenu=zh_cn.utf-8


" Coursour No Style
set guicursor=


" Scrolloffset Lines
set scrolloff=999
