""define the colors in the color scheme
"syn keyword sml3Keyword using given inline export opaque extension on then end derived deriving enum
syn match smlBrackL /{/
syn match smlBrackL /}/
syn match smlBraceL /\[/
syn match smlBraceR /\]/
syn match smlParenL /(/
syn match smlParenR /)/

syn match smlComment /(\*.*)/
" syn match smlComment /(\*\_.*)/
"syn match smlAt /@/
"syn match smlArrow "=>"
syn match smlMapArrow "->"
"syn match smlIter "<-"
syn match smlCaretL "<"
syn match smlCaretR ">"
syn match smlDollar "$"
syn match smlPlus /+/
syn match smlEqual /=/
syn match smlMinus /-/
syn match smlModulus /%/
"syn match smlDivide /\/{1}/
"syn match smlMultiply "*"
"syn match smlNegation /!/
"syn match smlColon /:/
syn match smlSemicolon /\;/
syn match smlComma /,/
syn match smlPeriod /\./
"syn match smlUnderscore /_/
"syn match smlTodo /???/
