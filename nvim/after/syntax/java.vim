syn match javaBrackR /{/
syn match javaBrackL /}/
syn match javaParenR /(/
syn match javaParenL /)/
syn match javaTernary "\v\?"
syn match javaColon "\v\:"
syn match javaSemicolon /;/
syn match javaPlus /+/
syn match javaMinus /-/
syn match javaFnArrow "->"
syn match javaAnd /&/
syn match javaOr /|/
syn match javaCapitalWord /\<[A-Z][A-Za-z0-9$]*\>/
syn keyword javaKeyword try catch finally throws static void volatile new final private protected for while if else null
syn keyword javaPrimitive int short byte float double boolean char long

