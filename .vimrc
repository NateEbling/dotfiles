call plug#begin()
Plug 'NateEbling/hmh-retro.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

"Settings
set guicursor=n-v-i-c:block
filetype on
syntax on
set expandtab
set bs=2
set tabstop=4
set shiftwidth=4
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
set cursorline
set laststatus=2
set fillchars+=vert:â”‚

colorscheme hmh-retro
hi statusline term=bold cterm=bold
hi statuslinenc term=bold cterm=bold

let mapleader = " "
nmap <silent> <Leader>pv :Ex<CR>

"(R)eplace all
nnoremap <leader>rn yiw:%s/\<<C-r>"\>//g<left><left>

"(R)eplace all (with confirm)
nnoremap <leader>r yiw:%s/\<<C-r>"\>//gc<left><left><left>

" Auto commands
" C
autocmd BufRead,BufNewFile *.c,*.h setlocal shiftwidth=8 tabstop=8

" Odin
autocmd BufRead,BufnewFile *.odin setlocal shiftwidth=8 tabstop=8

function! SynStack()
    if !exists("*synstack")
          return
            endif
              echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nnoremap <leader>k :call SynStack()<CR>

function! StatusLine()
    let l:modified = &modified ? '**' : '--'
    let l:line = line('.')

    if expand('%') !=# ''
        let l:name = fnamemodify(expand('%'), ':t')
    else
        let l:name = fnamemodify(getcwd(), ':t')
    endif

    let l:git = FugitiveHead()

    let l:status = printf(
        \ ' --\%s-   %s   %%P   L%s   {%s} ',
        \ l:modified,
        \ l:name,
        \ l:line,
        \ l:git
        \ )
    return l:status
endfunction

set fillchars=stl:-
set statusline=%!StatusLine()
