syntax off
filetype off
set expandtab
set bs=2
set tabstop=8
set shiftwidth=8
set autoindent
set smartindent
set smartcase
set ignorecase
set modeline
set nocompatible
set encoding=utf-8
set hlsearch
set history=10000
set t_Co=0
set background=dark
set tabpagemax=1000
set ruler
set nojoinspaces
set shiftround
set nonumber
set nolbr
set nowrap
set tw=0
set noswapfile
set nocursorline
set laststatus=2

" Statusline
function! Modified()
	return (&modified ? '*' : '-')
endfunction

function! Version()
	return (v:version)
endfunction

set fillchars+=stl:-
set statusline=
set statusline+=-%{Modified()}
set statusline+=\ Vim
set statusline+=\ %{Version()[0]}
set statusline+=.%{Version()[2]}:
set statusline+=\ %t
set statusline+=\ (%{''.(&fenc!=''?&fenc:&enc).''})
set statusline+=\ %f
set statusline+=\ %=
set statusline+=\ %P
set statusline+=\ --

" This removes all bold text
set t_md=

let mapleader = " "

map <Leader>pv :E<CR>
map <Leader>t :rightb vert term<CR>

nnoremap <Leader>f :find ./**/*

let loaded_matchparen = 1
