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
let s:col.back         = ['#232323', 0]
let s:col.margin       = ['#262626', 0]
let s:col.margin_hover = ['#333333', 0]
let s:col.hi_cursor_line = ['#121E12', 0]
let s:col.highlight    = ['#703419', 0]
let s:col.mark         = ['#808080', 0]
let s:col.text_default = ['#b3b3b3', 0]
let s:col.at_highlight = ['#ACD7DD', 0]
let s:col.comment      = ['#7D7D7D', 0]
let s:col.keyword      = ['#DBB316', 0]
let s:col.str_constant = ['#6b8e23', 0]
let s:col.include      = ['#627e28', 0]
let s:col.preproc      = ['#DAB98F', 0]
let s:col.spec_char    = ['#FF0000', 0]
let s:col.ghost_char   = ['#4D5B3C', 0]
let s:col.paste        = ['#FFBB00', 0]
let s:col.undo         = ['#80005D', 0]
let s:col.hi_junk      = ['#A18430', 0]
let s:col.hi_white     = ['#003A3A', 0]
let s:col.bar          = ['#262329', 0]
let s:col.bar_active   = ['#A8A8A8', 0]
let s:col.base         = ['#C09F54', 0]
let s:col.pop1         = ['#262329', 0]
let s:col.pop2         = ['#A18439', 0]
let s:col.ln_num_back  = ['#202020', 0]
let s:col.ln_num_text  = ['#484848', 0]
let s:col.type         = ['#A18439', 0]
let s:col.functionh    = ['#d86c48', 0]
let s:col.macro        = ['#a2c278', 0]
let s:col.coder_cmd    = ['#FFFFFF', 0]
let s:col.operator     = ['#C8964B', 0]
let s:col.op_alt       = ['#ff5555', 0]
let s:col.blue         = ['#8196aa', 0]
let s:col.diff_add     = ['#26332c', 0]
let s:col.diff_change  = ['#273842', 0]
let s:col.diff_del     = ['#572E33', 0]
let s:col.diff_text    = ['#314753', 0]
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
call s:HL('Normal', 'text_default', 'back')
call s:HL('Comment', 'comment', 'back')
call s:HL('Constant', 'blue', 'none')
call s:HL('String', 'str_constant', 'none')
call s:HL('Character', 'str_constant', 'none')
call s:HL('Number', 'str_constant', 'none')
call s:HL('Boolean', 'undo', 'none')
call s:HL('Float', 'str_constant', 'none')
call s:HL('Identifier', 'str_constant', 'none')
call s:HL('Function', 'str_constant', 'none')
call s:HL('Statement', 'keyword', 'none')
call s:HL('Conditional', 'text_default', 'none')
call s:HL('Repeat', 'macro', 'none')
call s:HL('Label', 'type', 'none')
call s:HL('Operator', 'text_default', 'none')
call s:HL('Keyword', 'keyword', 'none')
call s:HL('Exception', 'macro', 'none')
call s:HL('PreProc', 'str_constant', 'none')
call s:HL('Include', 'keyword', 'none')
call s:HL('Define', 'macro', 'none')
call s:HL('Title', 'text_default', 'none')
call s:HL('Macro', 'macro', 'none')
call s:HL('PreCondit', 'macro', 'none')
call s:HL('Type', 'str_constant', 'none')
call s:HL('StorageClass', 'str_constant', 'none')
call s:HL('Structure', 'str_constant', 'none')
call s:HL('Typedef', 'str_constant', 'none')
call s:HL('Special', 'type', 'none')
call s:HL('SpecialComment', 'comment', 'none')
call s:HL('MoreMsg', 'text_default', 'none')
call s:HL('Error', 'keyword', 'none')
call s:HL('Todo', 'macro', 'none', 'bold')
call s:HL('CursorLineNr', 'comment', 'none', 'bold')
call s:HL('debugPc', 'op_alt', 'none')
call s:HL('Conceal', 'comment', 'none')
call s:HL('Directory', 'type', 'none')
call s:HL('TabLine', 'hi_cursor_line', 'comment')
call s:HL('TabLineFill', 'margin', 'none')
call s:HL('TabLineSel', 'text_default', 'hi_cursor_line')
call s:HL('DiffAdd', 'diff_add', 'none')
call s:HL('DiffChange', 'diff_change', 'none')
call s:HL('DiffDelete', 'diff_del', 'none')
call s:HL('DiffText', 'diff_text', 'none')
call s:HL('ErrorMsg', 'keyword', 'none')
call s:HL('VertSplit', 'margin_hover', 'none')
call s:HL('Folded', 'comment', 'none')
call s:HL('IncSearch', 'margin_active', 'none')
call s:HL('LineNr', 'highlight', 'none')
call s:HL('MatchParen', 'base', 'none')
call s:HL('NonText', 'comment', 'none')
call s:HL('Pmenu', 'text_default', 'margin_hover')
call s:HL('PmenuSel', 'back', 'base')
call s:HL('Question', 'macro', 'none')
call s:HL('QuickFixLine', 'back', 'str_constant')
call s:HL('Search', 'back', 'text_default')
call s:HL('SpecialKey', 'comment', 'none')
call s:HL('SpellBad', 'keyword', 'none', 'underline')
call s:HL('SpellCap', 'base', 'none')
call s:HL('SpellLocal', 'base', 'none')
call s:HL('SpellRare', 'base', 'none')
call s:HL('StatusLine', 'text_default', 'highlight')
call s:HL('StatusLineNC', 'comment', 'none')
call s:HL('StatusLineTerm', 'text_default', 'highlight')
call s:HL('StatusLineTermNC', 'highlight', 'none')
call s:HL('Terminal', 'text_default', 'back')
call s:HL('VisualNOS', 'highlight', 'none')
call s:HL('WarningMsg', 'str_constant', 'none')
call s:HL('WildMenu', 'back', 'base')
call s:HL('EndOfBuffer', 'back', 'none')

" Treesitter
if has('nvim')
    
endif
" }}}
