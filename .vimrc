call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

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
set relativenumber
set nonumber

colorscheme sitruuna

" C 
autocmd FileType c setlocal expandtab shiftwidth=8 tabstop=8

" Zig
autocmd FileType zig setlocal expandtab shiftwidth=4 tabstop=4

let mapleader = " "

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" File finder
nmap <Leader>t :FZF<CR>
