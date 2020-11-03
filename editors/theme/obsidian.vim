 
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

" For backwards compatibility
if (g:obsidian_theme_style == 'dark')
  let g:obsidian_theme_style = 'darker'
endif

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

" === Color Definitions ===
let s:bg = { 'gui': '#000000', 'cterm': 'none' }
let s:fg = { 'gui': '#e0e2e4', 'cterm': 231 }
let s:invisibles = { 'gui': '#161e21', 'cterm': 66 }
" let s:comments = { 'gui': '#464b5d', 'cterm': 145 }
let s:comments = { 'gui': '#404040', 'cterm': 145 }
let s:caret = { 'gui': '#ffcc00', 'cterm': 220 }
" the background color selections
" let s:selection = { 'gui': '#1f2233', 'cterm': 239 }
" let s:guides = { 'gui': '#1f2233', 'cterm': 17 }
let s:selection = { 'gui': '#0e1122', 'cterm': 239 }
let s:guides = { 'gui': '#0e1122', 'cterm': 17 }
" let s:selection = { 'gui': '#202020', 'cterm': 239 }
" let s:guides = { 'gui': '#202020', 'cterm': 17 }
let s:line_numbers = { 'gui': '#3b3f51', 'cterm': 145 }
let s:line_highlight = { 'gui': '#0a0c12', 'cterm': 235 }
let s:white = { 'gui': '#ffffff', 'cterm': 231 }
let s:black = { 'gui': '#000000', 'cterm': 232 }
let s:red = { 'gui': '#ff5370', 'cterm': 203 }
let s:orange = { 'gui': '#e97600', 'cterm': 209 }
let s:yellow = { 'gui': '#ffcd22', 'cterm': 11 }
let s:green = { 'gui': '#93c763', 'cterm': 2 } " 186 –– almost perfect match
let s:cyan = { 'gui': '#89ddff', 'cterm': 117 }
let s:blue = { 'gui': '#678cb1', 'cterm': 111 }
let s:paleblue = { 'gui': '#b2ccd6', 'cterm': 152 }
let s:purple = { 'gui': '#a082bd', 'cterm': 176 }
let s:brown = { 'gui': '#c17e70', 'cterm': 137 }
" let s:pink = { 'gui': '#f07178', 'cterm': 204 }
let s:pink = { 'gui': '#f5bcf1', 'cterm': 204 }
let s:violet = { 'gui': '#bb80b3', 'cterm': 139 }
let s:gray = { 'gui': '#808080', 'cterm': 7 }

" let s:violet = { 'gui': '#bb80b3', 'cterm': 139 }


" Defined globally so that the Airline theme has access
let g:obsidian_colorscheme_map = {}
let g:obsidian_colorscheme_map.bg = s:bg
let g:obsidian_colorscheme_map.fg = s:fg
let g:obsidian_colorscheme_map.invisibles = s:invisibles
let g:obsidian_colorscheme_map.comments = s:comments
let g:obsidian_colorscheme_map.caret = s:caret
let g:obsidian_colorscheme_map.selection = s:selection
let g:obsidian_colorscheme_map.guides = s:guides
let g:obsidian_colorscheme_map.line_numbers = s:line_numbers
let g:obsidian_colorscheme_map.line_highlight = s:line_highlight
let g:obsidian_colorscheme_map.white = s:white
let g:obsidian_colorscheme_map.black = s:black
let g:obsidian_colorscheme_map.red = s:red
let g:obsidian_colorscheme_map.orange = s:orange
let g:obsidian_colorscheme_map.yellow = s:yellow
let g:obsidian_colorscheme_map.green = s:green
let g:obsidian_colorscheme_map.cyan = s:cyan
let g:obsidian_colorscheme_map.blue = s:blue
let g:obsidian_colorscheme_map.paleblue = s:paleblue
let g:obsidian_colorscheme_map.purple = s:purple
let g:obsidian_colorscheme_map.brown = s:brown
let g:obsidian_colorscheme_map.pink = s:pink
let g:obsidian_colorscheme_map.violet = s:violet
let g:obsidian_colorscheme_map.gray = s:gray

" === Highlights ===

" Vim Editor
call s:SetHighlight('ColorColumn', '', s:invisibles, '')
call s:SetHighlight('Cursor', s:bg, s:caret, '')
" hi Cursor guifg=#000000 guibg=#506070
call s:SetHighlight('CursorColumn', '', s:line_highlight, '')
call s:SetHighlight('CursorLine', '', s:line_highlight, '')
call s:SetHighlight('CursorLineNr', s:line_numbers, '', '')
" call s:SetHighlight('CursorLineNr', s:line_numbers, '', '')
" hi Directory guifg=#808080
" call s:SetHighlight('Directory', s:pink, '', '')
call s:SetHighlight('DiffAdd', s:bg, s:orange, '')
call s:SetHighlight('DiffDelete', s:bg, s:red, '')
call s:SetHighlight('DiffChange', s:bg, s:red, '')
" call s:SetHighlight('DiffText', s:bg, s:orange, '')
" hi DiffChange guifg=#f5bcf1 guibg=#ff0000
call s:SetHighlight('ErrorMsg', s:fg, s:red, 'bold')
call s:SetHighlight('FoldColumn', s:line_numbers, s:bg, '')
call s:SetHighlight('Folded', s:brown, s:bg, 'bold')
" call s:SetHighlight('LineNr', s:line_numbers, '', '')
" call s:SetHighlight('MatchParen', s:cyan, s:purple, 'bold')
" call s:SetHighlight('MatchParen', s:comments, s:cyan, 'bold')
call s:SetHighlight('ModeMsg', s:fg, '', '')
call s:SetHighlight('MoreMsg', s:white, '', '')
call s:SetHighlight('NonText', s:comments, '', '')
call s:SetHighlight('Normal', s:fg, s:bg, '')
call s:SetHighlight('Pmenu', s:fg, s:selection, '')
call s:SetHighlight('PmenuSel', s:bg, s:cyan, '')
call s:SetHighlight('PmenuSbar', '', s:selection, '')
call s:SetHighlight('PmenuThumb', '', s:comments, '')
call s:SetHighlight('Question', s:blue, '', '')
call s:SetHighlight('IncSearch', s:white, s:comments, 'none')
call s:SetHighlight('Search', s:white, s:comments, 'none')
" call s:SetHighlight('SignColumn', s:fg, s:bg, '')
call s:SetHighlight('SpecialKey', s:comments, '', '')
call s:SetHighlight('SpellCap', s:blue, '', 'undercurl')
call s:SetHighlight('SpellBad', s:red, '', 'undercurl')
call s:SetHighlight('StatusLine', s:fg, s:selection, '')
call s:SetHighlight('StatusLineNC', s:comments, s:selection, '')
call s:SetHighlight('StatusLineTerm', s:bg, s:fg, '')
call s:SetHighlight('StatusLineTermNC', s:bg, s:fg, '')
call s:SetHighlight('TabLine', s:red, s:bg, '')
call s:SetHighlight('TabLineFill', s:pink, s:bg, '')
call s:SetHighlight('TabLineSel', s:bg, s:selection, '')
call s:SetHighlight('Title', s:pink, '', '') " was s:green
call s:SetHighlight('VertSplit', s:comments, '', '')
" visual contols the visual select mode colors and the gutter error colors
call s:SetHighlight('Visual', s:red, s:gray, '')
call s:SetHighlight('WarningMsg', s:red, '', '')
call s:SetHighlight('WildMenu', s:bg, s:cyan, '')


" Syntax
call s:SetHighlight('Comment', s:comments, '', 'italic')
call s:SetHighlight('Conceal', s:brown, s:bg, '')
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
call s:SetHighlight('Error', s:fg, s:red, '')

hi MatchParen guifg=#89ddff guibg=#de1fcf gui=bold
" hi MatchParen guifg=#f5bcf1 guibg=#4d0454 gui=bold
" hi Error guifg=#FF0000 guibg=#ff0000
hi Error guifg=#000000 guibg=#ff0000
" call s:SetHighlight('Todo', s:yellow, s:yellow, 'italic')
hi Todo guifg=#ffffff guibg=#555555 gui=italic
hi CursorLineNr guifg=#606060 guibg=#000000 gui=bold
hi LineNr guifg=#606060 guibg=#000000
hi SignColumn guibg=#000000


"#f5bcf1 #93c763
hi scalaKeyWord guifg=#93c763
hi scala3Keyword guifg=#93c763
hi scalaKeywordModifier guifg=#93c763
hi scalaEquals guifg=#89ddff
hi scalaAnnotation guifg=#a082bd gui=bold
hi scalaNameDefinition guifg=#678cb1
hi scalaExternal guifg=#93c763
hi scalaCapitalWord guifg=#678cb1
hi scalaPlus guifg=#89ddff
hi scalaEqual guifg=#89ddff
hi scalaMinus guifg=#89ddff
hi scalaModulus guifg=#89ddff
hi scalaDivide guifg=#89ddff
hi scalaMultiply guifg=#89ddff
hi scalaOperator guifg=#89ddff 
hi scalaNegation guifg=#89ddff 
hi scalaColon guifg=#d2a679
hi scalaPostNameDefinition guifg=#d2a679
hi scalaSemicolon guifg=#d2a679
hi scalaComma guifg=#d2a679
hi scalaUnderscore guifg=#d2a679
hi scalaPeriod guifg=#d2a679
hi scalaTodo guifg=#89ddff
"#e8e2b7
hi scalaSpecial guifg=#93c763
hi scalaTypeDeclaration guifg=#678cb1
" hi scalaNameDefinition guifg=#e8e2b7
hi scalaNameDefinition guifg=#e0e2e4
hi scalaTypeTypePostDeclaration guifg=#678cb1
hi scalaTypeTypeDeclaration guifg=#678cb1
hi scalaTypeAnnotation guifg=#e0e2e4
hi scalaTypeOperator guifg=#e0e2e4
hi scalaTypeExtension guifg=#e0e2e4
hi scalaTypeStatement guifg=#e0e2e4
" hi scalaSquareBrackets guifg=#e8e2b7
" hi scalaSquareBracketsBrackets guifg=#e8e2b7
" hi scalaTypeDeclaration guifg=#e8e2b7
" hi scalaTypeTypeDeclaration guifg=#e8e2b7
" hi scalaTypeAnnotation guifg=#e8e2b7
" hi scalaTypeOperator guifg=#e8e2b7
" hi scalaTypeExtension guifg=#e8e2b7
" hi scalaTypeStatement guifg=#93c763
hi scalaInstanceDeclaration guifg=#678cb1
hi scalaMultilineComment guifg=#404040 gui=italic
hi scalaCommentCodeBlock guifg=#606060 gui=italic
hi scalaParamAnnotationValue guifg=#404040 gui=bold
hi scalaTrailingComment guifg=#606060
hi scalaFInterpolation guifg=#89ddff
" hi scalaMultilineComment guifg=#464b5d
" hi scalaTrailingComment guifg=#464b5d
hi scalaIter guifg=#89ddff
hi scalaMapArrow guifg=#89ddff
hi scalaArrow guifg=#89ddff
hi scalaCaretL guifg=#89ddff
hi scalaCaretR guifg=#89ddff
hi scalaUnimplemented guifg=#ffffff guibg=#555555
hi scalaParameterAnnotation guifg=#808080
hi scalaCommentAnnotation guifg=#808080
hi scalaDocLinks guifg=#808080
hi scalaCaseFollowing guifg=#e0e2e4
hi scalaBrackR guifg=#d2a679
hi scalaBrackL guifg=#d2a679
hi scalaParenR guifg=#d2a679
hi scalaParenL guifg=#d2a679
hi scalaSquareBrackets guifg=#d2a679
hi scalaRoundBrackets guifg=#d2a679
hi scalaSquareBracketsBrackets guifg=#d2a679
hi scalaInterpolationBrackets guifg=#e97600
hi scalaInterpolation guifg=#89ddff
hi scalaMethodCall guifg=#678cb1
hi scalaOPP guifg=#678cb1
hi scalaDollar guifg=#89ddff
hi scalaInterpolationBoundary guifg=#89ddff
hi scalaEscapedChar guifg=#f5bcf1
hi scalaAt guifg=#a082bd gui=bold
" hi scalaMethod guifg=#e0e2e4
hi scalatestShouldDSLB guifg=#e0e2e4

hi javaExternal guifg=#93c763
hi javaScopeDecl guifg=#93c763
hi javaClassDecl guifg=#93c763
hi javaStatement guifg=#93c763
hi javaOperator guifg=#93c763
hi javaParen guifg=#d2a679
hi javaParen1 guifg=#d2a679
hi javaAnnotation guifg=#a082bd  gui=bold
hi javaBrackR guifg=#d2a679
hi javaBrackL guifg=#d2a679
hi javaParenR guifg=#d2a679
hi javaParenL guifg=#d2a679
hi javaMapArrow guifg=#89ddff
hi javaDollar guifg=#89ddff
hi javaMethodDecl guifg=#678cb1
hi javaType guifg=#678cb1
hi javaRepeater guifg=#93c763
hi javaKeyword guifg=#93c763
hi javaThrows guifg=#93c763
hi javaTypedef guifg=#93c763
hi javaDocTags guifg=#808080
hi javaDocParam guifg=#606060
hi javaCommentTitle guifg=#404040
hi javaDocComment guifg=#404040
hi javaTernary guifg=#d2a679
hi javaColon guifg=#d2a679
hi javaSemicolon guifg=#d2a679
hi javaBoolean guifg=#93c763
hi javaCapitalWord guifg=#678cb1
hi javaPrimitive guifg=#93c763
hi javaPlus guifg=#89ddff
hi javaMinus guifg=#89ddff
hi javaAnd guifg=#d2a679
hi javaOr guifg=#d2a679
hi javaFnArrow guifg=#89ddff

hi typescriptStatementKeyword guifg=#93c763
hi typescriptNull guifg=#93c763
hi typescriptCastKeyword guifg=#93c763
hi typescriptBoolean guifg=#93c763
hi typescriptBraces guifg=#d2a679
hi typescriptParens guifg=#d2a679
hi typescriptVariable guifg=#93c763
hi typescriptTemplateSB guifg=#89ddff
hi typescriptGlobal guifg=#e0e2e4 gui=italic
hi typescriptGlobal guifg=#e0e2e4 gui=italic
hi typescriptConditional guifg=#93c763
hi typescriptConditionalElse guifg=#93c763
hi typescriptBinaryOp guifg=#89ddff
" hi typescriptConditionalParen guifg=#d2a679
hi typescriptOperator guifg=#93c763
hi typescriptFuncComma guifg=#d2a679
hi typescriptUnion guifg=#d2a679
hi typescriptCall guifg=#e0e2e4
hi typescriptProp guifg=#e0e2e4
hi typescriptAliasDeclaration guifg=#678cb1
hi typescriptTypeReference guifg=#678cb1
hi typescriptBOMLocationMethod guifg=#e0e2e4
hi typescriptBOMNavigatorProp guifg=#e0e2e4
hi typescriptObjectLabel guifg=#e0e2e4
" hi typescriptObjectLiteral guifg=#e0e2e4
hi typescriptMember guifg=#e0e2e4
hi typescriptTypeBracket guifg=#d2a679
hi typescriptRepeat guifg=#93c763
hi typescriptForOperator guifg=#93c763
hi typescriptExceptions guifg=#93c763
hi typescriptAssign guifg=#89ddff
hi typescriptArrowFunc guifg=#89ddff
hi typescriptFuncTypeArrow guifg=#89ddff
hi typescriptFuncName guifg=#d7d1a6
hi typescriptMember guifg=#d7d1a6
hi typescriptFuncCallArg guifg=#e0e2e4
hi typescriptHeadersMethod guifg=#e0e2e4
hi typescriptImport guifg=#a082bd
hi typescriptExport guifg=#a082bd
hi typescriptDefault guifg=#a082bd
hi typescriptClassName guifg=#678cb1
hi typescriptClassHeritage guifg=#678cb1
hi typescriptCacheMethod guifg=#e0e2e4
hi typescriptES6MapProp guifg=#e0e2e4
hi typescriptES6MapMethod guifg=#e0e2e4
hi typescriptES6SetMethod guifg=#e0e2e4
hi typescriptES6SetProp guifg=#e0e2e4
hi typescriptProp guifg=#e0e2e4
hi typescriptBOM guifg=#678cb1
hi typescriptBOMWindowMethod guifg=#e0e2e4
hi typescriptBOMWindowProp guifg=#e0e2e4
hi typescriptDOMFormProp guifg=#e0e2e4
hi typescriptDOMDocMethod guifg=#e0e2e4
hi typescriptArrayMethod guifg=#e0e2e4
" hi typescriptLoopParen guifg=#d2a679
hi typescriptEndColons guifg=#d2a679
hi typescriptBinaryOp guifg=#89ddff
hi typescriptUnaryOp guifg=#89ddff
hi tsThis guifg=#93c763
hi tsCast guifg=#93c763
hi typescriptCastKeyword guifg=#93c763
hi tsCapitalWord guifg=#678cb1
hi tsAnd guifg=#d2a679
hi tsOr guifg=#d2a679
hi tsSemicolon guifg=#d2a679
hi tsPeriod guifg=#d2a679
hi tsQuestion guifg=#d2a679
hi tsEquals guifg=#d2a679


" javascript
hi jsNull guifg=#93c763
hi jsParens guifg=#d2a679
hi jsBraces guifg=#d2a679
hi jsObjectBraces guifg=#d2a679
hi jsBrackets guifg=#d2a679
hi jsRepeatBraces guifg=#d2a679
hi jsFuncBraces guifg=#d2a679
hi jsFuncParens guifg=#d2a679
hi jsNoise guifg=#d2a679
hi jsFunction guifg=#93c763
hi jsFuncCall guifg=#e0e2e4
hi jsFuncName guifg=#d7d1a6
hi jsClassProperty guifg=#d7d1a6
hi jsArrowFunction guifg=#89ddff
hi jsOperator guifg=#d2a679
hi jsOperatorKeyword guifg=#93c763
hi jsGlobalObjects guifg=#e0e2e4 gui=italic
hi jsStorageClass guifg=#93c763
hi jsExport guifg=#a082bd
hi jsExportDefault guifg=#a082bd
hi jsImport guifg=#a082bd
hi jsFrom guifg=#a082bd
hi jsModuleAs guifg=#93c763
hi jsClassDefinition guifg=#678cb1
hi jsClassBraces guifg=#d2a679
hi jsCapitalWord guifg=#678cb1
hi jsThis guifg=#93c763
hi jsSuper guifg=#93c763
hi jsRepeat guifg=#93c763
hi jsBooleanTrue guifg=#93c763
hi jsBooleanFalse guifg=#93c763
hi jsReturn guifg=#93c763
hi jsTemplateBraces guifg=#89ddff
hi jsIfElseBraces guifg=#d2a679
hi jsConditional guifg=#93c763
hi jsComment guifg=#404040

" RUST
hi rsSelfType guifg=#678cb1
hi rsIf guifg=#93c763
hi rsDyn guifg=#93c763
hi rsElse guifg=#93c763
hi rsFor guifg=#93c763
hi rsTrue guifg=#93c763
hi rsFalse guifg=#93c763
hi rsWhile guifg=#93c763
hi rsLoop guifg=#93c763
hi rustFoldBraces guifg=#d7d1a6
hi rsDelimiter guifg=#d2a679
" hi rsFuncDef guifg=#e8e2b7 gui=bold
hi rsFuncDef guifg=#d7d1a6 gui=bold
hi rsLibraryMacro guifg=#e0e2e4 gui=italic
hi rsUserMacro guifg=#e0e2e4 gui=bold
hi rsMatch guifg=#93c763
hi rsUse guifg=#93c763
hi rsDocComment guifg=#606060
hi rsUserMethod guifg=#e0e2e4
hi rsUserFunc guifg=#e0e2e4
hi rsUserConst guifg=#e0e2e4
hi rsAttributeLine guifg=#a082bd 
hi rsAttributeLineModule guifg=#a082bd 
hi rsLibraryConst guifg=#e0e2e4
hi rsLifetimeDef guifg=#c17e70
hi rsUserLifetime guifg=#f5bcf1
hi rsLifetimeDef guifg=#f5bcf1
hi rsStaticLifetime guifg=#f5bcf1
hi rsLibraryFunc guifg=#e0e2e4
hi rsForeignConst guifg=#e0e2e4
hi rsForeignFunc guifg=#e0e2e4
" hi rsUserLifetime guifg=#c17e70
" hi rsLifetimeDef guifg=#f07178 
" hi rsLifetimeDef guifg=#ff5370
" RUST

" C/C++
hi cStatement guifg=#93c763
hi cType guifg=#93c763
" hi cType guifg=#678cb1
hi cConstant guifg=#93c763
hi cPreprocessorLine guifg=#a082bd
hi cAnsiFunction guifg=#e0e2e4 gui=italic
hi cCustomFunc guifg=#e0e2e4
hi cParen guifg=#d2a679
hi cCustomParen guifg=#d2a679
hi cStorageClass guifg=#93c763
hi cConditional guifg=#93c763
hi cBraceL guifg=#d2a679
hi cBraceR guifg=#d2a679
hi cParenL guifg=#d2a679
hi cParenR guifg=#d2a679
" hi cBracket guifg=#d2a679
hi cBracketL guifg=#d2a679
hi cBracketR guifg=#d2a679
hi cColon guifg=#d2a679
hi cSemicolon guifg=#d2a679
hi cComma guifg=#d2a679
hi cEq guifg=#89ddff
hi cPlus guifg=#89ddff
hi cMinus guifg=#89ddff
hi cDivide guifg=#89ddff
hi cStar guifg=#89ddff
hi cAnd guifg=#89ddff
hi cPipe guifg=#89ddff
hi cPipeL guifg=#89ddff
hi cPipeR guifg=#89ddff
hi cRepeat guifg=#93c763
hi cStructure guifg=#93c763
hi cCustomScope guifg=#d2a679

hi cCustomFunc guifg=#e0e2e4
hi cCustomParen guifg=#d2a679
hi cParen guifg=#d2a679
hi cPeriod guifg=#d2a679
hi cLabel guifg=#93c763
" hi cCustomDot guifg=#d2a679

hi cppPreprocessorLine guifg=#a082bd
hi cppConstant guifg=#93c763
hi cppAccess guifg=#93c763
hi cppStorageClass guifg=#93c763
hi cppExceptions guifg=#93c763
hi cppSTLconstant guifg=#e0e2e4
hi cppSTLnamespace guifg=#678cb1
hi cppSTLfunction guifg=#e0e2e4
hi cppBoolean guifg=#93c763
hi cppBraceL guifg=#d2a679
hi cppBraceR guifg=#d2a679
hi cppParenL guifg=#d2a679
hi cppParenR guifg=#d2a679
hi cppBracket guifg=#d2a679
hi cppColon guifg=#d2a679
hi cppSemicolon guifg=#d2a679
hi cppEq guifg=#89ddff
hi cppPlus guifg=#89ddff
hi cppMinus guifg=#89ddff
hi cppDivide guifg=#89ddff
hi cppTernary guifg=#89ddff
hi cppStar guifg=#89ddff
hi cppAnd guifg=#89ddff
hi cppPipe guifg=#89ddff
hi cppPipeL guifg=#89ddff
hi cppPipeR guifg=#89ddff
hi cppSTLios guifg=#e0e2e4
hi cppStatement guifg=#93c763
hi cppModifier guifg=#93c763
hi cppType guifg=#93c763
" hi cppType guifg=#678cb1
hi cppStructure guifg=#93c763
hi cppCapitalWord guifg=#678cb1
hi cppResolvedTemplate guifg=#678cb1
hi cppConstantValue guifg=#e0e2e4 gui=italic
"hi cppPointerType guifg=#678cb1
"hi cppReferenceType guifg=#678cb1


" Racket/rkt
hi racketSyntax guifg=#93c763
" hi racketFunc guifg=#d7d1a6
hi racketQuoted guifg=#f5bcf1
hi racketBoolean guifg=#93c763
hi rktLangLine guifg=#a082bd
hi rktArrow guifg=#89ddff


" Python
hi pythonStatement guifg=#93c763
hi pythonException guifg=#93c763
hi pythonClassVar guifg=#93c763
hi pythonExClass guifg=#678cb1
hi pythonConditional guifg=#93c763
hi pythonRepeat guifg=#93c763
hi pythonOperator guifg=#93c763
hi pythonFunction guifg=#d7d1a6
hi pythonBuiltinFunc guifg=#e0e2e4 gui=italic
hi pythonBuiltinType guifg=#678cb1
hi pythonBuiltinObj guifg=#e0e2e4
hi pythonInclude guifg=#a082bd
hi pythonImport guifg=#a082bd
hi pythonBoolean guifg=#93c763
hi pythonFunctionCall guifg=#e0e2e4
hi pythonSingleton guifg=#ffffff guibg=#555555 gui=italic
hi pythonTodo guifg=#ffffff guibg=#555555 gui=italic
" hi pythonStrInterpRegion guifg=#bb80b3
" hi pythonStrFormat guifg=#bb80b3
hi pythonStrInterpRegion guifg=#c17e70
hi pythonStrFormat guifg=#bb80b3
hi pythonUniEscape guifg=#de1fcf
hi pythonBytesEscape guifg=#de1fcf
" hi pythonUniEscape guifg=#f5bcf1
" hi pythonBytesEscape guifg=#f5bcf1
" hi pythonUniEscape guifg=#e97600 gui=bold
" hi pythonBytesEscape guifg=#e97600 gui=bold
hi pythonNone guifg=#678cb1
hi pythonDecorator guifg=#a082bd gui=bold
hi pythonDottedName guifg=#a082bd gui=bold

" hi pyDocStringDoubleQuotes guifg=#606060
" hi pyDocStringSingleQuotes guifg=#606060
" hi pyMultilineDocStringDoubleQuotes guifg=#606060
" hi pyMultilineDocStringSingleQuotes guifg=#606060
hi pythonClassStmt guifg=#93c763
hi pythonClass guifg=#678cb1
hi pyClassName guifg=#678cb1
hi pyDocString guifg=#606060
hi pyBraceL guifg=#d2a679
hi pyBraceR guifg=#d2a679
hi pyBracketL guifg=#d2a679
hi pyBracketR guifg=#d2a679
hi pyParenR guifg=#d2a679
hi pyParenL guifg=#d2a679
hi pyColon guifg=#d2a679
hi pyComma guifg=#d2a679
hi pyEqual guifg=#89ddff
hi pyNotEqual guifg=#89ddff
hi pyPlus guifg=#89ddff
hi pyMinus guifg=#89ddff
hi pyModulus guifg=#89ddff
hi pyDivide guifg=#89ddff
hi pyMultiply guifg=#89ddff
hi pyLeftAngleBracket guifg=#89ddff
hi pyRightAngleBracket guifg=#89ddff
hi pyLogicalAnd guifg=#89ddff
hi pyLogicalOr guifg=#89ddff
hi pyXor guifg=#89ddff


hi xmlTag guifg=#567ba1
hi xmlTagName guifg=#567ba1
hi xmlEndTag guifg=#567ba1
hi xmlAttrib guifg=#89ddff

hi cssBraces guifg=#e8e2b7
" hi cssBraces guifg=#d2a679

hi yamlBlockMappingKey guifg=#678cb1
hi yamlPlainScalar guifg=#e97600
hi yamlKeyValueDelimiter guifg=#d2a679
hi yamlBlockCollectionItemStart guifg=#d2a679
hi yamlNodeTag guifg=#a082bd

" hi jsxRegion guifg=#ff0000
" Git Commit Messages
call s:SetHighlight('gitcommitHeader', s:purple, '', '')
call s:SetHighlight('gitcommitUnmerged', s:green, '', '')
call s:SetHighlight('gitcommitSelectedFile', s:green, '', '')
call s:SetHighlight('gitcommitDiscardedFile', s:red, '', '')
call s:SetHighlight('gitcommitUnmergedFile', s:yellow, '', '')
call s:SetHighlight('gitcommitSelectedType', s:green, '', '')
call s:SetHighlight('gitcommitSummary', s:blue, '', '')
call s:SetHighlight('gitcommitDiscardedType', s:red, '', '')
hi link gitcommitNoBranch gitcommitBranch
hi link gitcommitUntracked gitcommitComment
hi link gitcommitDiscarded gitcommitComment
hi link gitcommitSelected gitcommitComment
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow gitcommitSelectedFile
hi link gitcommitUnmergedArrow gitcommitUnmergedFile

" JSON
call s:SetHighlight('jsonBraces', s:fg, '', '')

" XML
" call s:SetHighlight('xmlAttrib', s:purple, '', 'italic')
call s:SetHighlight('xmlAttrib', s:purple, '', '')
call s:SetHighlight('xmlEndTag', s:violet, '', '')
call s:SetHighlight('xmlTag', s:cyan, '', '')
call s:SetHighlight('xmlTagName', s:purple, '', '')
call s:SetHighlight('xmlAttribPunct', s:cyan, '', '')

" TeX
call s:SetHighlight('texBeginEndName', s:blue, '', '')
call s:SetHighlight('texMathMatcher', s:blue, '', '')
call s:SetHighlight('texCite', s:green, '', '')
call s:SetHighlight('texRefZone', s:green, '', '')
call s:SetHighlight('texInputFile', s:green, '', '')
call s:SetHighlight('texMath', s:orange, '', '')
call s:SetHighlight('texMathOper', s:yellow, '', '')

" Markdown
call s:SetHighlight('markdownBold', s:yellow, '', 'bold')
call s:SetHighlight('markdownCode', s:cyan, '', '')
call s:SetHighlight('markdownCodeBlock', s:cyan, '', '')
call s:SetHighlight('markdownCodeDelimiter', s:cyan, '', '')
call s:SetHighlight('markdownHeadingDelimiter', s:green, '', '')
call s:SetHighlight('markdownHeadingRule', s:comments, '', '')
call s:SetHighlight('markdownId', s:purple, '', '')
call s:SetHighlight('markdownItalic', s:blue, '', 'italic')
call s:SetHighlight('markdownListMarker', s:orange, '', '')
call s:SetHighlight('markdownOrderedListMarker', s:orange, '', '')
call s:SetHighlight('markdownRule', s:comments, '', '')
call s:SetHighlight('markdownUrl', s:purple, '', '')
call s:SetHighlight('markdownUrlTitleDelimiter', s:green, '', '')

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

" NERDTree
if has('nvim')
  " call s:SetHighlight('NERDTreeFile', s:purple, '', '')
  hi NerdTreeCWD guifg=#ffffff
  hi Directory guifg=#f5bcf1
  hi NerdTreeFile guifg=#9082bd
  hi NERDTree guibg=#000000
endif

if has('nvim')
  let g:terminal_color_background = '#000000'
  let g:terminal_color_foreground = '#e0e2e4'
endif


hi jsonBraces guifg=#d2a679
hi jsonFold guifg=#d2a679
hi jsonNoise guifg=#d2a679
" something overwrites this red, leave on bottom
" hi Error guifg=#FF0000 guibg=#ff0000
