" **************************************************
" ******************** Config **********************
" **************************************************
highlight clear

if exists('syntax_on')
  syntax reset
endif

if has("termguicolors")
  set termguicolors
endif

let g:colors_name = 'obsidian'

let s:white =  '#ffffff'
let s:offwhite =  '#e0e2e4'
let s:black = '#000000'
let s:offblack = '#111111'
let s:red = '#ff5370'
" let s:darkred = '#400000'
let s:darkred = '#380015'
let s:orange = '#e97600'
let s:yellow = '#ffcd22'
let s:green = '#93c763'
let s:cyan = '#89ddff'
let s:blue = '#678cb1'
let s:paleblue = '#b2ccd6'
let s:purple = '#a082bd'
let s:darkpurple = '#2b0342'
let s:pink = '#f5bcf1'
let s:brightpink = '#de1fcf'
let s:brown = '#c17e70'
let s:lightgray = '#808080'
let s:midgray= '#606060'
let s:darkgray = '#404040'
let s:tan = '#d2a679'
let s:beige = '#ead2a8'

let s:bold = 'bold'
let s:italic = 'italic'
let s:undercurl = 'undercurl'

let g:terminal_color_background = s:black
let g:terminal_color_foreground = s:offwhite

" **************************************************
" ****************** Functions *********************
" **************************************************
function! s:SetHighlight(group, fg, bg, attr)
  let l:attr = a:attr

  if empty(l:attr)
    let l:attr = 'none'
  endif

  if !empty(a:fg)
    exec 'hi ' . a:group . ' guifg=' . a:fg
  endif

  if !empty(a:bg)
    exec 'hi ' . a:group . ' guibg=' . a:bg
  endif

  if !empty(l:attr)
    exec 'hi ' . a:group . ' gui=' . l:attr
  endif
endfun



" **************************************************
" **************** General Editor ******************
" **************************************************
call s:SetHighlight('ColorColumn', '', s:offblack, '')
call s:SetHighlight('Cursor', s:black, s:brightpink, '')
call s:SetHighlight('CursorColumn', '', s:offblack, '')
call s:SetHighlight('CursorLine', '', s:offblack, '')
call s:SetHighlight('CursorLineNr', s:midgray, '' , s:bold)
call s:SetHighlight('ErrorMsg', s:white, s:darkred, s:bold)
call s:SetHighlight('FoldColumn', s:lightgray, s:black, '')
call s:SetHighlight('Folded', s:brown, s:black, s:bold)
call s:SetHighlight('IncSearch', s:white, s:lightgray, '')
call s:SetHighlight('LineNr', s:midgray, '', '')
call s:SetHighlight('ModeMsg', s:yellow, '', '')
call s:SetHighlight('MoreMsg', s:yellow, '', '')
call s:SetHighlight('MsgArea', s:yellow, '', '')
call s:SetHighlight('NonText', s:lightgray, '', '')
call s:SetHighlight('Normal', s:offwhite, s:black, '')
call s:SetHighlight('Pmenu', s:white, s:darkpurple, '')
call s:SetHighlight('PmenuSel', s:black, s:yellow, s:bold)
call s:SetHighlight('PmenuSbar', '', s:darkgray, '')
call s:SetHighlight('PmenuThumb', '', s:lightgray, '')
call s:SetHighlight('Question', s:blue, '', '')
call s:SetHighlight('Search', s:white, s:lightgray, '')
call s:SetHighlight('SignColumn', '', s:black, '')
call s:SetHighlight('SpecialKey', s:lightgray, '', '')
call s:SetHighlight('SpellCap', s:blue, '', s:undercurl)
call s:SetHighlight('SpellBad', s:darkred, '', s:undercurl)
call s:SetHighlight('StatusLine', s:pink, s:darkpurple, '')
call s:SetHighlight('StatusLineNC', s:brightpink, s:darkpurple, '')
call s:SetHighlight('TabLineFill', s:pink, s:black, '')
call s:SetHighlight('TabLineSel', s:black, s:darkgray, '')
call s:SetHighlight('Title', s:pink, '', '') 
call s:SetHighlight('Todo', s:white, s:darkgray, s:italic)
call s:SetHighlight('VertSplit', s:darkpurple, '', '')
call s:SetHighlight('Visual', s:brightpink, s:darkgray, '')
call s:SetHighlight('WarningMsg', s:red, '', '')
call s:SetHighlight('WildMenu', s:black, s:cyan, '')


" **************************************************
" ******************** Syntax *********************
" **************************************************
call s:SetHighlight('Character', s:red, '', '')
call s:SetHighlight('Comment', s:midgray, '', s:italic) 
call s:SetHighlight('Conceal', s:brown, s:black, '')
call s:SetHighlight('Error', '', s:darkred, '')
call s:SetHighlight('Function', '', '', '')
call s:SetHighlight('Identifier', s:offwhite, '', '')
call s:SetHighlight('Include', s:blue, '', '')
call s:SetHighlight('Keyword', s:green, '', '')
call s:SetHighlight('Statement', s:blue, '', '')
call s:SetHighlight('Operator', s:cyan, '', '')
call s:SetHighlight('PreProc', s:cyan, '', '')
call s:SetHighlight('Define', s:purple, '', '')
call s:SetHighlight('Macro', s:purple, '', '')
call s:SetHighlight('Number', s:yellow, '', '')
call s:SetHighlight('String', s:orange, '', '')
call s:SetHighlight('Structure', s:cyan, '', '')
call s:SetHighlight('Special', s:brightpink, '', '')
call s:SetHighlight('Type', s:blue, '', '')
call s:SetHighlight('Underlined', s:blue, '', '')

" **************************************************
" ******************** Plugins *********************
" **************************************************
call s:SetHighlight('MatchParen', s:cyan, s:brightpink, s:bold) " -- auto-pairs
call s:SetHighlight('GitGutterAdd', s:green, '', '') " -- vim-gitgutter
call s:SetHighlight('GitGutterChange', s:yellow, '', '') " -- vim-gitgutter
call s:SetHighlight('GitGutterChangeDelete', s:orange, '', '') " -- vim-gitgutter
call s:SetHighlight('GitGutterDelete', s:red, '', '') " -- vim-gitgutter"
call s:SetHighlight('NerdTreeCWD', s:white, '', '') " -- nerdtree
call s:SetHighlight('Directory', s:pink, '', '') " -- nerdtree
call s:SetHighlight('NerdTreeFile', s:purple, '', '') " -- nerdtree
call s:SetHighlight('NERDTree', '', s:black, '') " -- nerdtree

" **************************************************
" ***************** TreeSitter *********************
" **************************************************
call s:SetHighlight('TSAnnotation', s:purple, '', s:bold)
call s:SetHighlight('TSBoolean', s:green, '', '')
call s:SetHighlight('TSCharacter', s:orange, '', '')
call s:SetHighlight('TSComment', s:midgray, '', '')
call s:SetHighlight('TSConditional', s:green, '', '')
call s:SetHighlight('TSConstBuiltin', s:green, '', '')
call s:SetHighlight('TSConstMacro', s:purple, '', '')
call s:SetHighlight('TSConstant', s:offwhite, '', '')
call s:SetHighlight('TSConstructor', s:blue, '', '')
call s:SetHighlight('TSException', s:green, '', '')
call s:SetHighlight('TSError', '', '', '')
call s:SetHighlight('TSFloat', s:yellow, '', '')
call s:SetHighlight('TSKeywordFunction', s:green, '', '')
call s:SetHighlight('TSKeywordOperator', s:green, '', '')
call s:SetHighlight('TSInclude', s:purple, '', '')
" call s:SetHighlight('TSLiteral', s:beige, '', s:bold)
" call s:SetHighlight('TSLiteral', s:pink, '', '') -- pydoc string are literals?
call s:SetHighlight('TSKeyword', s:green, '', '')
call s:SetHighlight('TSMethod', s:white, '', '')
call s:SetHighlight('TSFuncBuiltin', s:beige, '', '')
call s:SetHighlight('TSFuncMacro', s:purple, '', '')
call s:SetHighlight('TSOperator', s:cyan, '', '')
call s:SetHighlight('TSParameter', s:offwhite, '', '')
call s:SetHighlight('TSProperty', s:white, '', '')
call s:SetHighlight('TSPunctBracket', s:tan, '', '')
call s:SetHighlight('TSPunctDelimiter', s:tan, '', '')
call s:SetHighlight('TSPunctSpecial', s:cyan, '', '')
call s:SetHighlight('TSRepeat', s:green, '', '')
call s:SetHighlight('TSString', s:orange, '', '')
call s:SetHighlight('TSStringEscape', s:brown, '', '')
call s:SetHighlight('TSTag', s:blue, '', '')
call s:SetHighlight('TSTagAttribute', s:paleblue, '', '')
call s:SetHighlight('TSTagDelimiter', s:tan, '', '')
call s:SetHighlight('TSTextReference', s:yellow, '', '')
call s:SetHighlight('TSTitle', s:pink, '', '')
call s:SetHighlight('TSType', s:blue, '', '')
call s:SetHighlight('TSTypeBuiltin', s:blue, '', '')
call s:SetHighlight('TSURI', s:brown, '', '')
call s:SetHighlight('TSVariable', s:offwhite, '', '')
call s:SetHighlight('TSVariableBuiltin', s:beige, '', '')


" **************************************************
" ************** Lang Override *********************
" **************************************************
" ####### Python ######
" can't override explicitly set things from TreeSitter
hi pythonDecorator guifg=#ff0000 gui=bold
call s:SetHighlight('pyDocString', s:midgray, '', '')
hi pyDocString guifg=#00ff00 guibg=None

" ####### Markdown ######   (no treesitter parser as of 12/22/21)?
call s:SetHighlight('markdownBold', s:yellow, '', 'bold')
call s:SetHighlight('markdownCode', s:cyan, '', '')
call s:SetHighlight('markdownCodeBlock', s:cyan, '', '')
call s:SetHighlight('markdownCodeDelimiter', s:cyan, '', '')
call s:SetHighlight('markdownHeadingDelimiter', s:green, '', '')
call s:SetHighlight('markdownHeadingRule', s:midgray, '', '')
call s:SetHighlight('markdownId', s:purple, '', '')
call s:SetHighlight('markdownItalic', s:blue, '', 'italic')
call s:SetHighlight('markdownListMarker', s:orange, '', '')
call s:SetHighlight('markdownOrderedListMarker', s:orange, '', '')
call s:SetHighlight('markdownRule', s:midgray, '', '')
call s:SetHighlight('markdownUrl', s:purple, '', '')
call s:SetHighlight('markdownUrlTitleDelimiter', s:green, '', '')

call s:SetHighlight('typescriptUnaryOp', s:cyan, '', '')
call s:SetHighlight("jsonFold", '', '', '')
call s:SetHighlight("jsonCommentError", s:darkgray, '', '')
call s:SetHighlight("jsonBoolean", s:green, '', '')
