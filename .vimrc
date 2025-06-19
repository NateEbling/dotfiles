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

colorscheme 2c

hi statusline gui=NONE cterm=NONE
hi cursorline gui=NONE cterm=NONE

let mapleader = " "
nmap <silent> <Leader>fv :FZF<CR>
nmap <silent> <Leader>pv :Ex<CR>

" C
autocmd BufRead,BufNewFile *.c,*.h setlocal shiftwidth=8 tabstop=8

" Matlab
autocmd BufRead,BufNewFile *.m setlocal shiftwidth=4 tabstop=4

" Rust
autocmd BufRead,BufNewFile *.rs,*.toml setlocal shiftwidth=4 tabstop=4

function! Statusline()
  let bufnr = bufnr('')
  let full_name = bufname(bufnr)
  let name = fnamemodify(full_name, ':t')

  if name == ''
    let name = fnamemodify(getcwd(), ':t')
  endif

  if &modified
    let status = '**'
  elseif &readonly
    let status = '%%%%'
  else
    let status = '--'
  endif

  let line = line('.')

  function! s:GetGitBranch(full_name)
      let dir = fnamemodify(a:full_name, ':h')
      let cmd = 'git -C ' . shellescape(dir) . ' rev-parse --abbrev-ref HEAD 2>/dev/null'
      let branch = system(cmd)
      let branch = substitute(branch, '\n', '', 'g')

      if branch != '' && branch != 'HEAD'
        return 'Git-' . branch
      else
        return ''
      endif
  endfunction

  let git_branch = s:GetGitBranch(full_name)
  let time = strftime('%H:%M')

  let filetype = &filetype
  if filetype ==# 'cpp' || filetype ==# 'c'
    let filetype_disp = 'C/C++'
  elseif filetype ==# 'zig'
    let filetype_disp = 'Zig'
  elseif filetype ==# 'rust'
    let filetype_disp = "Rust"
  else
    let filetype_disp = toupper(filetype)
  endif

  let statusline = printf(
    \ ' --%s-   %s          %%P   L%d   %s   (%s)--%s',
    \ status,
    \ name,
    \ line,
    \ git_branch,
    \ filetype_disp,
    \ time
    \)

  return statusline
endfunction

set fillchars=vert:│
set fillchars+=stl:-
set statusline=%!Statusline()
