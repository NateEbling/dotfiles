" hmh.vim

" Setup {{{
hi clear
if exists("syntax_on")
  syntax reset
endif
set background=dark
let g:colors_name="hmh"
" }}}
" Colors {{{
let s:col              = {}
let s:col.default      = ['#cdaa7d', 137]
let s:col.bg 	       = ['#161616', 233]
let s:col.lightbg      = ['#262626', 233]
let s:col.neongreen    = ['#40ff40', 83]
let s:col.dyellow      = ['#cd950c', 23]
let s:col.grey         = ['#7f7f7f', 244]
let s:col.blue         = ['#191970', 16]
let s:col.green        = ['#6b8e23', 15]
let s:col.red          = ['#ff0000', 196]
let s:col.white        = ['#ffffff', 16]
let s:col.none         = ['NONE', 'NONE']
let s:underline        = 'underline'

" }}}

" Highlighting Function from https://github.com/sjl/badwolf {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:col, a:fg)
            let histring .= 'guifg=' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:col, a:1)
            let histring .= 'guibg=' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:col, a:3)
        let histring .= 'guisp=' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction
" }}}

" Highlights {{{
call s:HL('Normal', 'default', 'none')
call s:HL('Special', 'default', 'none')
call s:HL('Directory', 'default', 'none')
call s:HL('String', 'green', 'none')
call s:HL('Visual', 'default', 'blue')
call s:HL('ErrorMsg', 'red', 'none')
call s:HL('Cursor', 'none', 'neongreen')
call s:HL('CursorLine', 'none', 'blue')
call s:HL('Comment', 'grey', 'none')
call s:HL('Keyword', 'dyellow', 'none')
call s:HL('Statement', 'default', 'none')
call s:HL('StatusLine', 'default', 'lightbg')
call s:HL('LineNr', 'default', 'none')
call s:HL('NonText', 'grey', 'none')
call s:HL('MatchParen', 'default', 'grey')
call s:HL('Todo', 'white', 'dyellow')
call s:HL('Keyword', 'dyellow', 'none')

if has('nvim')
    call s:HL('@punctuation', 'default', 'none')
    call s:HL('@variable', 'default', 'none')
endif

hi! link Statement Normal
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Exception Statement
hi! link Operator Normal
hi! link Function Statement
hi! link Identifier Normal

hi! link PreProc Normal
hi! link Include PreProc
hi! link Macro PreProc
hi! link PreCondit PreProc

hi! link Constant Normal
hi! link Character Normal
hi! link Boolean Normal
hi! link Number Normal
hi! link Float Normal

hi! link Type Statement
hi! link StorageClass Statement
hi! link Structure Statement
hi! link Typedef Statement

if has('nvim')
  let g:terminal_color_0 = s:col.bg[0]
  let g:terminal_color_8 = s:col.default[0]

  let g:terminal_color_1 = s:col.red[0]
  let g:terminal_color_9 = s:col.red[0]

  let g:terminal_color_2 = s:col.default[0]
  let g:terminal_color_10 = s:col.default[0]

  let g:terminal_color_3 = s:col.neongreen[0]
  let g:terminal_color_11 = s:col.neongreen[0]

  let g:terminal_color_4 = s:col.default[0]
  let g:terminal_color_12 = s:col.default[0]

  let g:terminal_color_5 = s:col.default[0]
  let g:terminal_color_13 = s:col.default[0]

  let g:terminal_color_6 = s:col.default[0]
  let g:terminal_color_14 = s:col.default[0]

  let g:terminal_color_7 = s:col.default[0]
  let g:terminal_color_15 = s:col.default[0]
endif
" }}}
