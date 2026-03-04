" Backup file's extent
" 备份文件后缀名
set backupext=.bak

" Set Undo File
" 设置重做缓存
set undofile
let &undodir = (has('nvim') ? stdpath('config').'/undodir' : fnamemodify($MYVIMDIR,':h').'/undodir')
