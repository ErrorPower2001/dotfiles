" Setting line number to relative
" 显示行号和相对行号
set number relativenumber

" Setting nowrap
" 设置不自动换行
set nowrap

" Setting cursor's column and line highlight
" 设置光标所在行、列高亮
set cursorcolumn cursorline

" Setting always show ruler
" 总是显示光标位置
set ruler

" Setting search options
" 高亮搜索结果
set hlsearch
" 即时搜索
set incsearch
" 搜索忽略大小写 且大写覆盖
set ignorecase smartcase

" Setting split windows to same sizes
" 设置新建和删除窗口时，所有窗口总是保持相同大小
set equalalways
" 新分割窗口出现在下边
set nosplitbelow
" 新分割窗口出现在右侧
set splitright

" 设置空格、制表符等隐藏字符样式
set listchars=eol:󰌑,tab:\|->,multispace:\|···,trail:-,nbsp:+
"...set listchars=tab:\|->,multispace:\|···,trail:-,nbsp:+
" 空格与制表符，隐藏字符显示
set list

" 设置 Tab 样式
" 制表符显示的长度（缺省值：8）
" set tabstop&
" 设置 Tab 键进行是缩进长度（缺省值：0），设置 -1 使其与 shiftwidth 同步
set softtabstop=-1
" 设置缩进/自动缩进长度
set shiftwidth=4
" 设置不使用制表符而只使用空格进行缩进
" set expandtab

" 单词列表，改变 cmdline-completion 的行为
" A list of words that change how cmdline-completion is done.
set wildoptions=pum,tagfile

" Set language to chinese
" 设置 vim 语言
"...language chinese_china
language C

" Cursor No Style
" 光标无样式（跟随 Terminal）
"...set guicursor=
