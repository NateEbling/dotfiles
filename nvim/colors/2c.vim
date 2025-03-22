" 2 color theme by Ebz

hi clear

if exists("syntax_on")
  syntax reset
endif

set background=dark

let g:colors_name="bw"
" Colors
let s:col              = {}
let s:col.col1         = ['#000000', 137] " foreground
let s:col.col2         = ['#fafad2', 233] " background
let s:col.lightbg      = ['#262626', 233]
let s:col.lgrey        = ['#7f7f7f', 244]
let s:col.red          = ['#ff0000', 196]
let s:col.blue         = ['#191970', 16]
let s:col.orange       = ['#a35f0b', 16]
let s:col.green        = ['#44850c', 16]
let s:col.none         = ['NONE', 'NONE']
let s:underline        = 'underline'

" Highlighting Function from https://github.com/sjl/badwolf
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

call s:HL('Normal', 'col1', 'col2')
call s:HL('Special', 'col1', 'none')
call s:HL('Directory', 'col1', 'none')
call s:HL('String', 'col1', 'none')
call s:HL('Visual', 'col2', 'col1')
call s:HL('Cursor', 'col2', 'col1')
call s:HL('Comment', 'col1', 'none')
call s:HL('Keyword', 'col1', 'none')
call s:HL('Statement', 'col1', 'none')
call s:HL('StatusLine', 'col2', 'col1')
call s:HL('LineNr', 'lgrey', 'none')
call s:HL('NonText', 'lgrey', 'none')
call s:HL('Todo', 'col1', 'none')
call s:HL('ModeMsg', 'col1', 'col2')
call s:HL('Question', 'col1', 'col2')
call s:HL('Title', 'col1', 'col2')
call s:HL('Delimiter', 'col1', 'col2')
call s:HL('VertSplit', 'col2', 'col1')
call s:HL('MatchParen', 'none', 'none')
call s:HL('Pmenu', 'col1', 'col2')
call s:HL('CursorLine', 'col1', 'none')
call s:HL('WarningMsg', 'none', 'col2')
call s:HL('MoreMsg', 'none', 'col2')
call s:HL('DiagnosticWarn', 'orange', 'none')
call s:HL('DiagnosticError', 'red', 'none')
call s:HL('DiagnosticInfo', 'blue', 'none')
call s:HL('DiagnosticHint', 'green', 'none')
call s:HL('DiagnosticOk', 'lgrey', 'none')

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
    call s:HL('StatusLineTerm', 'col1', 'col2')
    call s:HL('StatusLineTermNC', 'lightbg', 'col1')
    call s:HL('StatusLine', 'col2', 'col1')
    call s:HL('StatusLineNC', 'col1', 'col2')
    call s:HL('@variable', 'col1', 'col2')
    call s:HL('@punctuation.bracket.c', 'col1', 'col2')
else
    call s:HL('StatusLineTerm', 'col2', 'col1')
    call s:HL('StatusLineTermNC', 'lightbg', 'col2')
    call s:HL('StatusLine', 'col1', 'col2')
    call s:HL('StatusLineNC', 'col2', 'col1')
endif
