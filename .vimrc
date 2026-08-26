call plug#begin()
Plug 'https://codeberg.org/Ebz/clean'
call plug#end()

"Settings
set guicursor=n-v-i-c:block
filetype on
syntax on
set termguicolors
set background=dark
set expandtab
set backspace=2
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smartcase
set ignorecase
set modeline
set nocompatible
set encoding=utf-8
set history=700
set t_Co=256
set nohlsearch
set nojoinspaces
set ruler
set shiftround
set nolbr
set noswapfile
set nonumber
set tw=0
set laststatus=2
set cc=80

colorscheme clean

" Keybinds
let mapleader = " "
nmap <silent> <Leader>pv :Ex<CR>

"(R)eplace all
nnoremap <leader>rn yiw:%s/\<<C-r>"\>//g<left><left>

"(R)eplace all (with confirm)
nnoremap <leader>r yiw:%s/\<<C-r>"\>//gc<left><left><left>

" Auto commands
" C/C++
autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.hpp setlocal shiftwidth=8 tabstop=8


nmap <Leader>k :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! StatuslineEmacs()
    let name = expand('%:t')
    if name == ''
        let name = fnamemodify(getcwd(), ':t')
    endif

    let status = &modified ? '**' : (&readonly ? '%%' : '--')

    let line = line('.')

    let filetype = &filetype
    let filetype_disp = ''
    if filetype == 'c' || filetype == 'cpp' || filetype == 'h' || filetype == 'hpp'
        let filetype_disp = 'C/C++'
    elseif filetype == 'zig'
        let filetype_disp = 'Zig'
    else
        let filetype_disp = toupper(filetype)
    endif

    return printf(
        \ ' --\%s-   %s          %s   L%s   (%s)--',
        \ status,
        \ name,
        \ '%P',
        \ line,
        \ filetype_disp
        \ )
endfunction

set statusline=%!StatuslineEmacs()
