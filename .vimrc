call plug#begin()
Plug 'ziglang/zig.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

syntax on
filetype on
set expandtab
set bs=2
set tabstop=4
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
set t_Co=256
set termguicolors
set background=dark
set tabpagemax=1000
set ruler
set nojoinspaces
set shiftround
set relativenumber
set nonumber
set nolbr
set tw=0
set noswapfile

colorscheme sitruuna

let mapleader = " "

map <Leader>pv :E<CR>
map <Leader>t :rightb vert term<CR>
map <Leader>fv :FZF<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set laststatus=2

