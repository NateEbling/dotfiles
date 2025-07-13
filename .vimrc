call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'NateEbling/2col.vim'
Plug 'NateEbling/clean.vim'
call plug#end()

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
set background=light
set tabpagemax=1000
set ruler
set nojoinspaces
set shiftround
set nonumber
set nolbr
set tw=0
set noswapfile
set laststatus=2
set cursorline
set colorcolumn = "80"

colorscheme evening

hi statusline gui=NONE cterm=NONE
hi cursorline gui=NONE cterm=NONE

let mapleader = " "
nmap <silent> <Leader>fv :FZF<CR>
nmap <silent> <Leader>pv :Ex<CR>

" C
autocmd BufRead,BufNewFile *.c,*.h setlocal shiftwidth=8 tabstop=8

" Zig
autocmd BufRead,BufNewFile *zig setlocal shiftwidth=4 tabstop=4

" Matlab
autocmd BufRead,BufNewFile *.m setlocal shiftwidth=4 tabstop=4

" Rust
autocmd BufRead,BufNewFile *.rs,*.toml setlocal shiftwidth=4 tabstop=4

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

set fillchars=vert:│
set fillchars+=stl:-
set statusline=%!Statusline()
