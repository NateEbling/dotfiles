syntax on
filetype on 

set bs=2
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set nojoinspaces
set shiftround
set encoding=utf-8
set t_Co=256
set termguicolors
set nohlsearch
set nonumber
set noswapfile
set nocursorline
set laststatus=0
set nolbr

colorscheme sitruuna

let g:loaded_matchparen=1

hi EndOfBuffer guifg=#ffffff

" C 
autocmd FileType c setlocal expandtab shiftwidth=8 tabstop=8

" Zig
autocmd FileType zig setlocal expandtab shiftwidth=4 tabstop=4
