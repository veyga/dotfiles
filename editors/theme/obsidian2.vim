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
let s:offblack = '#222222'
let s:red = '#ff5370'
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
let s:beige = '#bfb991'

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
call s:SetHighlight('ColorColumn', '', s:black, '')
call s:SetHighlight('Cursor', s:black, s:red, '')
call s:SetHighlight('CursorColumn', '', s:offblack, '')
call s:SetHighlight('CursorLine', '', s:offblack, '')
call s:SetHighlight('CursorLineNr', s:midgray, '' , s:bold)
call s:SetHighlight('LineNr', s:midgray, '', '')
call s:SetHighlight('ErrorMsg', s:white, s:red, s:bold)
call s:SetHighlight('FoldColumn', s:lightgray, s:black, '')
call s:SetHighlight('Folded', s:brown, s:black, s:bold)
call s:SetHighlight('ModeMsg', s:offwhite, '', '')
call s:SetHighlight('MoreMsg', s:white, '', '')
call s:SetHighlight('NonText', s:lightgray, '', '')
call s:SetHighlight('Normal', s:offwhite, s:black, '')
call s:SetHighlight('Pmenu', s:white, s:darkpurple, '')
call s:SetHighlight('PmenuSel', s:black, s:cyan, '')
call s:SetHighlight('PmenuSbar', '', s:darkgray, '')
call s:SetHighlight('PmenuThumb', '', s:lightgray, '')
call s:SetHighlight('Question', s:blue, '', '')
call s:SetHighlight('IncSearch', s:white, s:lightgray, '')
call s:SetHighlight('Search', s:white, s:lightgray, '')
call s:SetHighlight('SignColumn', '', s:black, '')
call s:SetHighlight('SpecialKey', s:lightgray, '', '')
call s:SetHighlight('SpellCap', s:blue, '', s:undercurl)
call s:SetHighlight('SpellBad', s:red, '', s:undercurl)
call s:SetHighlight('StatusLine', s:pink, s:darkpurple, '')
call s:SetHighlight('StatusLineNC', s:brightpink, s:darkpurple, '')
" call s:SetHighlight('TabLine', s:red, s:black, '')
call s:SetHighlight('TabLineFill', s:pink, s:black, '')
call s:SetHighlight('TabLineSel', s:black, s:darkgray, '')
call s:SetHighlight('Title', s:pink, '', '') 
call s:SetHighlight('VertSplit', s:darkpurple, '', '')
" visual contols the visual select mode colors and the gutter error colors
call s:SetHighlight('Visual', s:red, s:darkgray, '')
call s:SetHighlight('WarningMsg', s:red, '', '')
call s:SetHighlight('WildMenu', s:black, s:cyan, '')
call s:SetHighlight('Todo', s:white, s:darkgray, s:italic)


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
" ******************** Syntax *********************
" *Comment	any comment

" *Constant	any constant
"  String		a string constant: "this is a string"
"  Character	a character constant: 'c', '\n'
"  Number		a number constant: 234, 0xff
"  Boolean	a boolean constant: TRUE, false
"  Float		a floating point constant: 2.3e10

" *Identifier	any variable name
"  Function	function name (also: methods for classes)

" *Statement	any statement
"  Conditional	if, then, else, endif, switch, etc.
"  Repeat		for, do, while, etc.
"  Label		case, default, etc.
"  Operator	"sizeof", "+", "*", etc.
"  Keyword	any other keyword
"  Exception	try, catch, throw

" *PreProc	generic Preprocessor
"  Include	preprocessor #include
"  Define		preprocessor #define
"  Macro		same as Define
"  PreCondit	preprocessor #if, #else, #endif, etc.

" *Type		int, long, char, etc.
"  StorageClass	static, register, volatile, etc.
"  Structure	struct, union, enum, etc.
"  Typedef	A typedef

" *Special	any special symbol
"  SpecialChar	special character in a constant
"  Tag		you can use CTRL-] on this
"  Delimiter	character that needs attention
"  SpecialComment	special things inside a comment
"  Debug		debugging statements
" **************************************************
call s:SetHighlight('Comment', s:lightgray, '', 'italic') " -- covered by TSComment
call s:SetHighlight('Conceal', s:brown, s:black, '')
call s:SetHighlight('String', s:orange, '', '')
call s:SetHighlight('Character', s:red, '', '')
call s:SetHighlight('Identifier', s:offwhite, '', '')
" call s:SetHighlight('Function', s:, '', '')
call s:SetHighlight('Keyword', s:green, '', '')
call s:SetHighlight('Statement', s:blue, '', '')
call s:SetHighlight('Operator', s:cyan, '', '')
call s:SetHighlight('PreProc', s:cyan, '', '')
call s:SetHighlight('Include', s:blue, '', '')
call s:SetHighlight('Define', s:purple, '', '')
call s:SetHighlight('Macro', s:purple, '', '')
call s:SetHighlight('Number', s:yellow, '', '')
call s:SetHighlight('Type', s:blue, '', '')
call s:SetHighlight('Structure', s:cyan, '', '')
call s:SetHighlight('Special', s:offwhite, '', '')
call s:SetHighlight('Underlined', s:blue, '', '')
call s:SetHighlight('Error', s:white, s:red, '')
call s:SetHighlight('ModeMsg', s:yellow, '', s:bold)
call s:SetHighlight('MsgArea', s:yellow, '', '')

" **************************************************
" ***************** TreeSitter *********************
" **************************************************
call s:SetHighlight('TSKeyword', s:green, '', '')
call s:SetHighlight('TSBoolean', s:green, '', '')
call s:SetHighlight('TSKeywordOperator', s:green, '', '')
call s:SetHighlight('TSKeywordFunction', s:green, '', '')
call s:SetHighlight('TSConditional', s:green, '', '')
call s:SetHighlight('TSOperator', s:cyan, '', '')
call s:SetHighlight('TSComment', s:midgray, '', '')
call s:SetHighlight('TSInclude', s:purple, '', '')
call s:SetHighlight('TSRepeat', s:green, '', '')
call s:SetHighlight('TSMethod', s:white, '', '')
call s:SetHighlight('TSProperty', s:white, '', '')
call s:SetHighlight('TSType', s:blue, '', '')
call s:SetHighlight('TSPunctBracket', s:tan, '', '')
call s:SetHighlight('TSPunctSpecial', s:cyan, '', '')
call s:SetHighlight('TSPunctDelimiter', s:tan, '', '')
call s:SetHighlight('TSTagDelimiter', s:tan, '', '')
call s:SetHighlight('TSVariableBuiltin', s:yellow, '', '')
call s:SetHighlight('TSFuncBuiltin', s:yellow, '', '')
call s:SetHighlight('TSConstBuiltin', s:yellow, '', '')
call s:SetHighlight('TSString', s:orange, '', '')
call s:SetHighlight('TSFloat', s:yellow, '', '')
call s:SetHighlight('TSTag', s:blue, '', '')
call s:SetHighlight('TSTagAttribute', s:paleblue, '', '')
call s:SetHighlight('TSParameter', s:offwhite, '', '')
call s:SetHighlight('TSVariable', s:offwhite, '', '')
call s:SetHighlight('TSConstant', s:offwhite, '', '')


" **************************************************
" ************** Lang Override *********************
" **************************************************
" hi pythonDecoratorName guifg=#d2a679
" hi pythonDecorator guifg=#ff0000 gui=bold
