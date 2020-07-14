syn match pyClassName /[A-Z][A-Za-z0-9]*/
syn match pyDocString /""".*"""/
syn match pyDocString /'''.*'''/
syn match pyDocString /"""\_.\{-}"""/
syn match pyDocString /'''\_.\{-}'''/
syn match pyBraceL /{/
syn match pyBraceR /}/
syn match pyBracketL /\[/
syn match pyBracketR /]/
syn match pyParenR /(/
syn match pyParenL /)/
syn match pyColon /:/
syn match pyComma /,/
syn match pyEqual /=/
syn match pyNotEqual /!=/
syn match pyEqual /+/
syn match pyMinus /-/
syn match pyModulus /%/
syn match pyDivide /\//
syn match pyMultiply "*"
syn match pyLeftAngleBracket "<"
syn match pyRightAngleBracket ">"
syn match pyLogicalAnd "&"
syn match pyLogicalOr "|"
syn match pyXor /\^/ 


" **All this so the class name can be highlighted?
" Clear default
syn clear pythonStatement

" Set it to what's in the Python file, minus the class.
syn keyword pythonStatement    False None True
syn keyword pythonStatement    as assert break continue del exec global
syn keyword pythonStatement    lambda nonlocal pass return with yield
syn keyword pythonStatement    def nextgroup=pythonFunction skipwhite

" Now make seperate syntax groups for the class.
syn keyword pythonClassStmt class nextgroup=pythonClass skipwhite
syn match   pythonClass "\h\w*" display contained

" Highlight the class statement and the class name.
hi def link pythonClassStmt Statement
