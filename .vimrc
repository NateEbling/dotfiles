call plug#begin()
Plug 'NateEbling/2col.vim'
call plug#end()

syntax on
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
set termguicolors
set t_Co=256
set background=dark
set tabpagemax=1000
set nojoinspaces
set shiftround
set nonumber
set ruler
set tw=80
set fo+=t
set fo-=l
set laststatus=2

colorscheme 2c

" C 
autocmd BufRead,BufNewFile *.c,*.cpp,*.h setlocal shiftwidth=8 tabstop=8

" Zig
autocmd FileType zig setlocal expandtab shiftwidth=4 tabstop=4

nnoremap <C-x> <Nop>
nnoremap <silent> <C-x><C-f> :call FindFile()<CR>
nnoremap <silent> <C-x>e :Ex<CR>
nnoremap <silent> <C-x><C-d> :w<CR>
nnoremap <silent> <C-x>c :q!<CR>

function! FindFile()
    let prompt = "Find file: "
    let file = input(prompt, "", "file")

    if file != ""
        execute "edit " . file
    endif
endfunction
function! StatuslineUEmacs()
  let mod = &modified ? '*' : '-'

  " Get version parts using integer math
  let ver = v:version
  let major = ver / 100
  let minor = (ver % 100) / 10
  let patch = ver % 10

  let name = expand('%') !=# '' ? fnamemodify(expand('%'), ':t') : fnamemodify(getcwd(), ':t')

  let filetype = &filetype
  let filetype_disp = ''
  if filetype ==# 'cpp' || filetype ==# 'c'
    let filetype_disp = 'Cmode '
  endif

  let enc = &fenc !=# '' ? &fenc : &encoding

  let path = expand('%:p')
  if path ==# '' || path ==# '[No Name]'
    let path = ''
  endif

  let status = printf(
        \ "-%s Vim %d.%d.%d: %s (%s%s) %s %%= %%P --",
        \ mod,
        \ major,
        \ minor,
        \ patch,
        \ name,
        \ filetype_disp,
        \ enc,
        \ path
        \)

  return status
endfunction

set fillchars=stl:-,stlnc:-,eob:\ 
set statusline=%!StatuslineUEmacs()
