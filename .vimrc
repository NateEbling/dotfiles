call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'NateEbling/2col.vim'
call plug#end()

set guicursor=n-v-c-i:block
filetype on
syntax on
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
set nohlsearch
set history=10000
set t_Co=256
set termguicolors
set background=dark
set tabpagemax=1000
set ruler
set nojoinspaces
set shiftround
set nolbr
set tw=0
set noswapfile
set laststatus=0
set fillchars=vert:â”‚

colorscheme 2c

let mapleader = " "
nmap <silent> <Leader>fv :FZF<CR>
nmap <silent> <Leader>pv :Ex<CR>

" C/C++
autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.hpp setlocal shiftwidth=8 tabstop=8

" Zig
autocmd BufRead,BufNewFile *zig setlocal shiftwidth=4 tabstop=4

" Matlab
autocmd BufRead,BufNewFile *.m setlocal shiftwidth=4 tabstop=4

" Rust
autocmd BufRead,BufNewFile *.rs,*.toml setlocal shiftwidth=4 tabstop=4

" Odin
autocmd BufRead,BufnewFile *.odin setlocal shiftwidth=8 tabstop=8

function! Statusline()
  let l:modified = (&modified ? '*' : '-')
  let l:version = v:version
  let l:major = l:version / 100
  let l:minor = l:version % 100
  let l:enc = (&fenc != '' ? &fenc : &enc)
  let l:relpath = fnamemodify(expand('%'), ':.')

  return join([
    \ '-' . l:modified,
    \ 'Vim ' . l:major . '.' . l:minor . ':',
    \ '%t',
    \ '(' . l:enc . ')',
    \ l:relpath,
    \ '%=',
    \ '%P',
    \ '--'
    \ ], ' ')
endfunction

set fillchars+=stl:-
set statusline=%!Statusline()
