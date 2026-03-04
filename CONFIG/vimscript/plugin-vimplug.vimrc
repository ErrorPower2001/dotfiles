" Vim-Plug
" Plugins will be downloaded under the specified directory.
" vim-plug 插件设置

call plug#begin(has('nvim') ? stdpath('data').'/plugged' : '~/.vim/plugged')
" Declare the list of plugins.

	" Vim CN doc
	Plug 'yianwillis/vimcdoc'

	" Vim Lsp needed plugins
	" {{{ ==============================================
	" For auto-complete, need async.vim
	" async.vim
	Plug 'prabirshrestha/async.vim'
	" asyncomplete.vim
	Plug 'prabirshrestha/asyncomplete.vim'
	" asyncomplete-lsp.vim
	Plug 'prabirshrestha/asyncomplete-lsp.vim'

	" vim-lsp
	Plug 'prabirshrestha/vim-lsp'
	" vim-lsp-settings
	Plug 'mattn/vim-lsp-settings'

	" For snippets, HTML and CSS completion needed
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/vim-vsnip-integ'
	" }}} ==============================================

	" 一些 vim 默认设置配置插件
	Plug 'tpope/vim-sensible'

	" seoul256 色彩
	Plug 'junegunn/seoul256.vim'

	" Vim 内置输入法插件
	" {{{ ==============================================
	" PlugInstall ZFVimIM ZFVimIM_pinyin_base ZFVimIM_pinyin_huge ZFVimIM_english_base ZFVimJob
	"...Plug 'ZSaberLv0/ZFVimIM'
	"...Plug 'ZSaberLv0/ZFVimJob'
	"...Plug 'ZSaberLv0/ZFVimIM_pinyin_base'
	"...Plug 'ZSaberLv0/ZFVimIM_pinyin_huge'
	"...Plug 'ZSaberLv0/ZFVimIM_english_base'
	"...Plug 'ZSaberLv0/ZFVimIM_japanese_base'
	" }}} ==============================================

	" PowerShell 脚本着色插件
	"...Plug 'pprovost/vim-ps1'
	" Markdown 着色插件
	"...Plug 'preservim/vim-markdown'

	" 文本对齐
	"...Plug 'godlygeek/tabular'

	" 文件树插件
	Plug 'preservim/nerdtree'

	" neoterm 终端插件
	"...Plug 'kassio/neoterm'

	" vim-floaterm 终端插件
	Plug 'voldikss/vim-floaterm'

	" NeoVim Plugins
	" {{{ ==============================================
	" neovim 官方 lsp 插件
	"...Plug 'neovim/nvim-lspconfig'

	" neoclide lsp 插件管理器 coc.nvim
	"...Plug 'neoclide/coc.nvim', {'branch': 'release'}


	" 代码对齐线插件
	"...Plug 'lukas-reineke/indent-blankline.nvim'
	" 代码对齐线插件
	"...Plug 'shellRaining/hlchunk.nvim'


	" terminal 终端插件
	"...Plug 'rebelot/terminal.nvim'


	" autozimu LSP 客户端插件
	"
	"...Plug 'autozimu/LanguageClient-neovim', {
	"...	\ 'branch': 'next',
	"...	\ 'do': 'powershell -executionpolicy bypass -File install.ps1',
	"...	\ }
	" }}} ==============================================

" List ends here. Plugins become visible to Vim after this call.
call plug#end()



" Plug configuration
" 插件配置

" junegunn/seoul256.vim
" {{{
	" Unified color scheme (default: dark)
	let g:seoul256_background = 235

	" Setting color scheme
	" {{{
		" Switch
		"...set background=dark
		"...set background=light

		" Dark color scheme
		"...colo seoul256
		" Light color scheme
		"...colo seoul256-light

		colorscheme seoul256
	" }}}

	" Configure the NeoVim statusline highlight to match Vim
	highlight StatusLine   gui=reverse,bold
	highlight StatusLineNC gui=reverse
" }}}


" vim:foldmethod=marker:
