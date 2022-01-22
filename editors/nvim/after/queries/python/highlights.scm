; being captured as annotation -> TSAnnotation
; but highlight not working? TSVariable overrides it?
(decorator) @annotation

; sup has no -> TSXxx mapping (being captured, but no matching highlight group)
; (function_definition 
;   name: (identifier) @sup)
(function_definition 
  name: (identifier) @method)

; docstring
(expression_statement (string) @comment)


; (self) @text.title
; ("self") @text.title
