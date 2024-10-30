call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

syntax off
filetype on
set expandtab
set bs=2
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set smartcase
set ignorecase
set modeline
set nocompatible
set encoding=utf-8
set hlsearch
set history=700
set t_Co=0
set background=dark
set tabpagemax=1000
set nojoinspaces
set shiftround
set nonumber
set ruler

set nolbr
set tw=0

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
