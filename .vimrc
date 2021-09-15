set nocompatible
set backspace=indent,eol,start
set history=300
set number
set ttyfast

" Automatically read files which are changed outside vim
set autoread

syntax enable

" allwo to navigate away from modified buffers
set hidden

" add to fix 'Scanning tags. E432: Tags file not sorted: tags' error
set ignorecase

set autoread
set ruler
set cursorline
set showmatch
set cmdheight=2
set expandtab

set showcmd

set smarttab
set shiftwidth=2
set tabstop=2
set lbr
set wrap
set breakindent
set autoindent
set smartindent

set laststatus=2
set lazyredraw
set backupdir=~/tmp

set splitright
set splitbelow

set background=dark
set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

set list
set listchars=tab:>~

"set columns=120

" Timeout settings
" Eliminating ESC delays in vim - Metaserv - https://meta-serv.com/article/vim_delay
" Delayed esc from insert mode caused by cursor-shape terminal sequence - Vi and Vim Stack Exchange -
" https://vi.stackexchange.com/questions/15633/delayed-esc-from-insert-mode-caused-by-cursor-shape-terminal-sequence
" Wait forever until I recall mapping
" Don't wait to much for keycodes send by terminal, so there's no delay on <ESC>
set notimeout
set ttimeout
set timeoutlen=2000
set ttimeoutlen=30

" Set <leader> key to <Space>
nnoremap <Space> <Nop>
let mapleader=" "
let maplocalleader=","

" Do not use arrows in Normal mode
noremap <silent> <Up>    <Nop>
noremap <silent> <Down>  <Nop>
noremap <silent> <Left>  <Nop>
noremap <silent> <Right> <Nop>

" Smart way to move between panes
map <up> <C-w><up>
map <down> <C-w><down>
map <left> <C-w><left>
map <right> <C-w><right>

" Use 'H' and 'L' keys to move to start/end of the line
noremap H g^
noremap L g$

" In Insert mode, treat pasting form a buffer as a separate undoable operation
" Which can be undone with '<C-o>u'
inoremap <C-r> <C-g>u<C-r>


autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd filetype crontab setlocal nobackup nowritebackup

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
set pastetoggle=<F12>

if $VIM_NOBACKUP
  set nobackup
  set nowritebackup
endif
set backupskip=/tmp/*,/private/tmp/*

" Trailing whitespaces {{{

" "bronson/vim-trailing-whitespaces" plugin is used for highlighting
" Use :FixWhitespace to remove trailing whitespaces manually
" Or "w0rp/ale" is used to automatically remove trailing whitespaces, extra empty lines at EOF, and more
let g:extra_whitespace_ignored_filetypes = ['fugitive', 'markdown', 'diff', 'qf', 'help', 'ctrlsf']

augroup aug_trailing_whitespaces
  au!

  " Highlight space characters that appear before or in-between tabs
  au BufRead,BufNew * 2match ExtraWhitespace / \+\ze\t/

  " Disable Airline whitespace detection for ignored filetypes
  for wifile in g:extra_whitespace_ignored_filetypes
    exe "au FileType " . wifile . " let b:airline_whitespace_disabled = 1"
  endfor
augroup END



call plug#begin('~/.vim/plugged')
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'altercation/vim-colors-solarized'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'dominikduda/vim_current_word'
  Plug 'terryma/vim-smooth-scroll'
  Plug 'svermeulen/vim-cutlass'
  Plug 'svermeulen/vim-yoink'
  Plug 'airblade/vim-gitgutter'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'tpope/vim-rails'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-session'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'itmammoth/run-rspec.vim'
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

colorscheme solarized

set statusline=\ %M
set statusline+=\ %{HasPaste()}
set statusline+=\ %r
set statusline+=\ %F
set statusline+=\ %h
set statusline+=\ %{FugitiveStatusline()}
set statusline+=%=
set statusline+=%#StatusLineTerm#
set statusline+=\ %c:%l/%L
set statusline+=\ %t

" Settings PLUGIN: fzf.vim{{{

let g:fzf_layout = { 'down': '~40%' }

" Populate quickfix list with selected files
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  botright copen
  cc
endfunction

" Ctrl-q allows to select multiple elements an open them in quick list
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Add namespace for fzf.vim exported commands
let g:fzf_command_prefix = 'Fzf'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" File path completion in Insert mode using fzf
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-buffer-line)

" Use preview when FzfFiles runs in fullscreen
command! -nargs=? -bang -complete=dir FzfFiles
      \ call fzf#vim#files(<q-args>, <bang>0 ? fzf#vim#with_preview('up:60%') : {}, <bang>0)

" Mappings
nnoremap <silent> <leader>f :FzfAg<CR>
nnoremap <silent> <leader>o :FzfFiles<CR>
nnoremap <silent> <leader>O :FzfFiles!<CR>
nnoremap <silent> <leader>l  :FzfBuffers<CR>
nnoremap <silent> <leader>b :FzfBLines<CR>
nnoremap <silent> <leader>`  :FzfMarks<CR>
nnoremap <silent> <leader>p :FzfCommands<CR>
nnoremap <silent> <leader>t :FzfFiletypes<CR>
nnoremap <silent> <F1> :FzfHelptags<CR>
inoremap <silent> <F1> <ESC>:FzfHelptags<CR>
cnoremap <silent> <expr> <C-p> getcmdtype() == ":" ? "<C-u>:FzfHistory:\<CR>" : "\<ESC>:FzfHistory/\<CR>"
cnoremap <silent> <C-_> <C-u>:FzfCommands<CR>
nnoremap <silent> <leader>g :Gblame<CR>

" fzf.Tags uses existing 'tags' file or generates it otherwise
nnoremap <silent> <leader>] :FzfTags<CR>
xnoremap <silent> <leader>] "zy:FzfTags <C-r>z<CR>

" fzf.BTags generate tags on-fly for current file
nnoremap <silent> <leader>} :FzfBTags<CR>
xnoremap <silent> <leader>} "zy:FzfBTags <C-r>z<CR>

" Show list of change in fzf
" Some code is borrowed from ctrlp.vim and tweaked to work with fzf
command FzfChanges call s:fzf_changes()
nnoremap <silent> <leader>; :FzfChanges<CR>

function! s:fzf_changelist()
  redir => result
  silent! changes
  redir END

  return map(split(result, "\n")[1:], 'tr(v:val, "	", " ")')
endf

function! s:fzf_changeaccept(line)
  let info = matchlist(a:line, '\s\+\(\d\+\)\s\+\(\d\+\)\s\+\(\d\+\).\+$')
  call cursor(get(info, 2), get(info, 3))
  silent! norm! zvzz
endfunction

function! s:fzf_changes()
  return fzf#run(fzf#wrap({
        \ 'source':  reverse(s:fzf_changelist()),
        \ 'sink': function('s:fzf_changeaccept'),
        \ 'options': '+m +s --nth=3..'
        \ }))
endfunction

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" }}}

" PLUGIN: vim-smooth-scroll {{{
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 3, 5)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 3, 5)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 7)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 7)<CR>
" }}}

" PLUGIN: vim-commentary {{{
augroup aug_commentary
  au!

  " Tell how comment is marked depending on file type
  au FileType vim setlocal commentstring=\"\ %s
augroup end

" Comment line and move 1 line down
nmap <silent> <leader>c <Plug>CommentaryLine :normal j<CR>
xmap <leader>c <Plug>Commentary
" }}}

let g:yoinkIncludeDeleteOperations=1

" Current Word Highlight Settings
let g:vim_current_word#highlight_delay = 1000
let g:vim_current_word#highlight_only_in_focused_window = 0
hi CurrentWordTwins ctermbg=250 cterm=bold,underline

" Do not use arrows in Normal mode
noremap <silent> <Up>    <Nop>
noremap <silent> <Down>  <Nop>
noremap <silent> <Left>  <Nop>
noremap <silent> <Right> <Nop>

" Smart way to move between panes
map <up> <C-w><up>
map <down> <C-w><down>
map <left> <C-w><left>
map <right> <C-w><right>

" Add shortcut to fix whitespace
nnoremap <silent> <leader>w :FixWhitespace<CR>

" Set the title of the Terminal to the currently open file
set t_ts=];
set t_fs=
function! SetTerminalTitle()
    let titleString = expand('%:t')
    if len(titleString) > 0
        let &titlestring = expand('%:t')
        " this is the format iTerm2 expects when setting the window title
        let args = "\033];".&titlestring."\007"
        let cmd = 'silent !echo -e "'.args.'"'
    endif
endfunction
autocmd BufEnter * call SetTerminalTitle()

nnoremap <silent> <Leader>F :FzfAg <C-R><C-W><CR>

let g:run_rspec_bin = 'spring rspec'
" let g:run_rspec_command_option = ''
nnoremap <leader>r :RunSpec<CR>
nnoremap <leader>L :RunSpecLine<CR>
nnoremap <leader>e :RunSpecLastRun<CR>
nnoremap <leader>R :RunSpecCloseResult<CR>
