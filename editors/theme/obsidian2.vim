 
" Name: obsidian.vim
" Maintainer: andrew stefanich
" === Configuration ===

" Clear any other set colors
highlight clear

if exists('syntax_on')
  syntax reset
endif

if has("termguicolors")
  set termguicolors
endif

let g:colors_name = 'obsidian'
let g:obsidian_theme_style = get(g:, 'obsidian_theme_style', 'default')
let g:obsidian_terminal_italics = get(g:, 'obsidian_terminal_italics', 0)

" " For backwards compatibility
" if (g:obsidian_theme_style == 'dark')
"   let g:obsidian_theme_style = 'darker'
" endif

" === Functions ===

function! s:SetHighlight(group, fg, bg, attr)
  let l:attr = a:attr

  if !g:obsidian_terminal_italics && l:attr == 'italic'
    let l:attr = ''
  endif

  if empty(l:attr)
    let l:attr = 'none'
  endif

  if !empty(a:fg)
    exec 'hi ' . a:group . ' guifg=' . a:fg.gui . ' ctermfg=' . a:fg.cterm
  endif

  if !empty(a:bg)
    exec 'hi ' . a:group . ' guibg=' . a:bg.gui . ' ctermbg=' . a:bg.cterm
  endif

  if !empty(l:attr)
    exec 'hi ' . a:group . ' gui=' . l:attr . ' cterm=' . l:attr
  endif
endfun

" === Color Definitions ===  cterms not correct FYI.
let s:white = { 'gui': '#ffffff', 'cterm': 231 }
let s:offwhite = { 'gui': '#e0e2e4', 'cterm': 231 }
let s:black = { 'gui': '#000000', 'cterm': 232 }
let s:offblack = { 'gui': '#161e21', 'cterm': 66 }
let s:red = { 'gui': '#ff5370', 'cterm': 203 }
let s:orange = { 'gui': '#e97600', 'cterm': 209 }
let s:yellow = { 'gui': '#ffcd22', 'cterm': 11 }
let s:green = { 'gui': '#93c763', 'cterm': 2 } " 186 –– almost perfect match
let s:cyan = { 'gui': '#89ddff', 'cterm': 117 }
let s:blue = { 'gui': '#678cb1', 'cterm': 111 }
let s:paleblue = { 'gui': '#b2ccd6', 'cterm': 152 }
let s:purple = { 'gui': '#a082bd', 'cterm': 176 }
let s:brown = { 'gui': '#c17e70', 'cterm': 137 }
let s:pink = { 'gui': '#f5bcf1', 'cterm': 204 }
let s:violet = { 'gui': '#bb80b3', 'cterm': 139 }
let s:lightgray = { 'gui': '#808080', 'cterm': 7 }
let s:darkgray = { 'gui': '#808080', 'cterm': 7 }
let s:tan = { 'gui': "#d2a679", 'cterm': 1 }


" === Highlights ===

" Vim Editor colors
call s:SetHighlight('ColorColumn', '', s:black, '')
call s:SetHighlight('Cursor', s:black, s:red, '')
call s:SetHighlight('CursorColumn', '', s:offblack, '')
call s:SetHighlight('CursorLine', '', s:offblack, '')
call s:SetHighlight('CursorLineNr', s:lightgray, '', '')
call s:SetHighlight('DiffAdd', s:black, s:orange, '')
call s:SetHighlight('DiffDelete', s:black, s:red, '')
call s:SetHighlight('DiffChange', s:black, s:red, '')
call s:SetHighlight('ErrorMsg', s:offwhite, s:red, 'bold')
call s:SetHighlight('FoldColumn', s:lightgray, s:black, '')
call s:SetHighlight('Folded', s:brown, s:black, 'bold')
call s:SetHighlight('ModeMsg', s:offwhite, '', '')
call s:SetHighlight('MoreMsg', s:white, '', '')
call s:SetHighlight('NonText', s:lightgray, '', '')
call s:SetHighlight('Normal', s:offwhite, s:black, '')
call s:SetHighlight('Pmenu', s:offwhite, s:darkgray, '')
call s:SetHighlight('PmenuSel', s:black, s:cyan, '')
call s:SetHighlight('PmenuSbar', '', s:darkgray, '')
call s:SetHighlight('PmenuThumb', '', s:lightgray, '')
call s:SetHighlight('Question', s:blue, '', '')
call s:SetHighlight('IncSearch', s:white, s:lightgray, 'none')
call s:SetHighlight('Search', s:white, s:lightgray, 'none')
call s:SetHighlight('SignColumn', '', s:black, '')
call s:SetHighlight('SpecialKey', s:lightgray, '', '')
call s:SetHighlight('SpellCap', s:blue, '', 'undercurl')
call s:SetHighlight('SpellBad', s:red, '', 'undercurl')
call s:SetHighlight('StatusLine', s:offwhite, s:darkgray, '')
call s:SetHighlight('StatusLineNC', s:lightgray, s:darkgray, '')
call s:SetHighlight('StatusLineTerm', s:black, s:offwhite, '')
call s:SetHighlight('StatusLineTermNC', s:black, s:offwhite, '')
call s:SetHighlight('TabLine', s:red, s:black, '')
call s:SetHighlight('TabLineFill', s:pink, s:black, '')
call s:SetHighlight('TabLineSel', s:black, s:darkgray, '')
call s:SetHighlight('Title', s:pink, '', '') " was s:green
call s:SetHighlight('VertSplit', s:lightgray, '', '')
" visual contols the visual select mode colors and the gutter error colors
call s:SetHighlight('Visual', s:red, s:lightgray, '')
call s:SetHighlight('WarningMsg', s:red, '', '')
call s:SetHighlight('WildMenu', s:black, s:cyan, '')
call s:SetHighlight('Todo', s:white, s:darkgray, 'italic')



hi MatchParen guifg=#89ddff guibg=#de1fcf gui=bold
hi Error guifg=#000000 guibg=#ff0000
" hi Todo guifg=#ffffff guibg=#555555 gui=italic
hi CursorLineNr guifg=#606060 guibg=#000000 gui=bold
hi LineNr guifg=#606060 guibg=#000000

"" Plugins
" vim-gitgutter
call s:SetHighlight('GitGutterAdd', s:green, '', '')
call s:SetHighlight('GitGutterChange', s:yellow, '', '')
call s:SetHighlight('GitGutterChangeDelete', s:orange, '', '')
call s:SetHighlight('GitGutterDelete', s:red, '', '')

" vim-signify
hi link SignifySignAdd GitGutterAdd
hi link SignifySignChange GitGutterChange
hi link SignifySignDelete GitGutterDelete

" vim-better-whitespace
call s:SetHighlight('ExtraWhitespace', '', s:red, '')

hi NerdTreeCWD guifg=#ffffff
hi Directory guifg=#f5bcf1
hi NerdTreeFile guifg=#9082bd
hi NERDTree guibg=#000000

let g:terminal_color_background = '#000000'
" let g:terminal_color_background = '#000000'
let g:terminal_color_foreground = '#e0e2e4'
" let g:terminal_color_foreground = s:offwhite


" Syntax
call s:SetHighlight('Comment', s:lightgray, '', 'italic')
call s:SetHighlight('Conceal', s:brown, s:black, '')
call s:SetHighlight('Constant', s:orange, '', '')
call s:SetHighlight('String', s:orange, '', '')
call s:SetHighlight('Character', s:red, '', '')
call s:SetHighlight('Identifier', s:white, '', '')
call s:SetHighlight('Function', s:blue, '', '')
call s:SetHighlight('Keyword', s:green, '', '')
call s:SetHighlight('Statement', s:blue, '', '')
call s:SetHighlight('Operator', s:cyan, '', '')
call s:SetHighlight('PreProc', s:cyan, '', '')
call s:SetHighlight('Include', s:blue, '', '')
call s:SetHighlight('Define', s:purple, '', '')
call s:SetHighlight('Macro', s:purple, '', '')
call s:SetHighlight('Number', s:yellow, '', '')
call s:SetHighlight('Type', s:blue, '', '')
" call s:SetHighlight('Type', s:yellow, '', '')
call s:SetHighlight('Structure', s:cyan, '', '')
call s:SetHighlight('Special', s:violet, '', '')
call s:SetHighlight('Underlined', s:blue, '', '')
call s:SetHighlight('Error', s:offwhite, s:red, '')

" Treesitter
call s:SetHighlight('TSComment', s:lightgray, '', '')
call s:SetHighlight('TSInclude', s:purple, '', '')
call s:SetHighlight('TSKeyword', s:green, '', '')
call s:SetHighlight('TSKeywordOperator', s:green, '', '')
call s:SetHighlight('TSRepeat', s:green, '', '')
call s:SetHighlight('TSMethod', s:white, '', '')
call s:SetHighlight('TSType', s:blue, '', '')
call s:SetHighlight('TSPunctBracket', s:tan, '', '')
" call s:SetHighlight('TSPunctSpecial', s:tan, '', '')
call s:SetHighlight('TSVariable', s:white, '', '')
call s:SetHighlight('TSString', s:orange, '', '')


" Syntax (lang specific overrides)

