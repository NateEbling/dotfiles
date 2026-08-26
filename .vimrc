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

function! UpdateGitBranchCache()
    let b:git_branch_cache = ''

    if &buftype != ''
        return
    endif

    let dir = expand('%:p:h')
    if dir == '' || !isdirectory(dir)
        return
    endif

    let branch = system('git -C ' . shellescape(dir) . ' rev-parse --abbrev-ref HEAD 2>/dev/null')
    let branch = substitute(branch, '\n$', '', '')

    if branch != '' && branch != 'HEAD'
        let b:git_branch_cache = 'Git-' . branch
    endif
endfunction

augroup StatuslineGitCache
    autocmd!
    autocmd BufEnter,BufWritePost * call UpdateGitBranchCache()
augroup END

function! StatuslineEmacs()
    let name = expand('%:t')
    if name == ''
        let name = fnamemodify(getcwd(), ':t')
    endif

    let status = &modified ? '**' : (&readonly ? '%%' : '--')

    let line = line('.')

    let git_branch = get(b:, 'git_branch_cache', '')

    let filetype = &filetype
    let filetype_disp = ''
    if filetype == 'c' || filetype == 'cpp'
        let filetype_disp = 'C/C++'
    elseif filetype == 'zig'
        let filetype_disp = 'Zig'
    elseif filetype == ''
        let filetype_disp = 'NONE'
    else
        let filetype_disp = toupper(filetype)
    endif

    return printf(
        \ ' --\%s-   %s          %s   L%s   %s   (%s)--',
        \ status,
        \ name,
        \ '%P',
        \ line,
        \ git_branch,
        \ filetype_disp
        \ )
endfunction

set statusline=%!StatuslineEmacs()
