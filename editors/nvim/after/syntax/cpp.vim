syn match cppBraceL /{/
syn match cppBraceR /}/
syn match cppParenL /(/
syn match cppParenR /)/
syn match cppBracket /\[\]/
syn match cppColon ":"
syn match cppSemicolon /;/
syn match cppEq /=/
syn match cppPlus /+/
syn match cppMinus /-/
syn match cppDivide /\/{1}/
syn match cppTernary /?/
syn match cppStar /*/
syn match cppAnd /&/
syn match cppPipe /|/
syn match cppPipeL /</
syn match cppPipeR />/
syn match cppPreprocessorLine '\#.*\n'
syn match cppCapitalWord /\s\u[A-Za-z0-9]*\s/
" syn match cppConstantValue /\u[A-Z_]*/
syn match cppMainFunc /main/

"syn match cppFunctionDeclaration /\w\+\s\w*\(.*\)\s*[;{]\n/
"syn match cppPointerType /\w*\*\s/
"syn match cppReferenceType /\w*&\s/

 " syn match cppOp /[+-\*&=]/
