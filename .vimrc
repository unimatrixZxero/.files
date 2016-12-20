set nocompatible
set backspace=indent,eol,start 
set history=300
set number
syntax enable
set autoread
set ruler
set cursorline
set showmatch 
set cmdheight=2
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set lbr
set wrap
set laststatus=2
set lazyredraw
set backupdir=/tmp


function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
