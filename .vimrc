call plug#begin()
call plug#end()

"Settings
set guicursor=n-v-i-c:block
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
set tabpagemax=1000
set ruler
set nojoinspaces
set shiftround
set nolbr
set tw=0
set noswapfile
set laststatus=2
set fillchars+=vert:│

colorscheme evening
hi Cursor guibg=#ffffff guifg=NONE
hi EndOfBuffer guibg=NONE guifg=#0000ff

let mapleader = " "
nmap <silent> <Leader>pv :Ex<CR>

"(R)eplace all
nnoremap <leader>rn yiw:%s/\<<C-r>"\>//g<left><left>

"(R)eplace all (with confirm)
nnoremap <leader>r yiw:%s/\<<C-r>"\>//gc<left><left><left>

" Auto commands
" C
autocmd BufRead,BufNewFile *.c,*.h setlocal shiftwidth=8 tabstop=8

" Matlab
autocmd BufRead,BufNewFile *.m setlocal shiftwidth=4 tabstop=4

" Rust
autocmd BufRead,BufnewFile *.rs,*.toml setlocal shiftwidth=4 tabstop=4

" Odin
autocmd BufRead,BufnewFile *.odin setlocal shiftwidth=8 tabstop=8
