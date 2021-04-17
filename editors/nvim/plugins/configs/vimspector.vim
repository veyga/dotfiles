"F3 vimspector#Stop(
"F4 vimspector#Restart()
"F5 vimspector#Continue()
"F6 vimspector#Pause()
"F8 vimspector#AddFunctionBreakpoint('<cexpr>')   //current line
"<leader>F8 vimspector#RunToCursor()
"F9 vimspector#ToggleBreakpoint()
"<leader>F9 vimspector#ToggleConditionalBreakpoint()
"F10 vimspector#StepOver()
"F11 vimspector#StepInto()
"F12 vimspector#StepOut()
"
let g:vimspector_enable_mappings = 'HUMAN'
"F6 vimspector#Pause()
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>ds :call vimspector#Stop()<CR>
nmap <leader>dl :call vimspector#ListBreakpoints()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" for normal mode - the word under the cursor
" nmap <Leader>di <Plug>VimspectorBalloonEval
" " for visual mode, the visually selected text
" xmap <Leader>di <Plug>VimspectorBalloonEvat
nmap <A-i> <Plug>VimspectorBalloonEval
" nmap <A-l>:call vimspector#ListBreakpoints()<CR>

let g:vimspector_sidebar_width = 10 "default = 50
let g:vimspector_bottombar_height = 5 "default = 10

" nnoremap <A-e> :call vimspector#Evaluate(' "'.input('Evaluate: ').'"')<cr>
nnoremap <A-e> :call vimspector#Evaluate(input('Evaluate: '))<cr>
"nmap <A-e> :call <SID>ExecGDB()<CR>
" function! <SID>ExecGDB()
"   call inpu
"   let curline = getline('.')
"   call inputsave()
"   let cmd = input('Enter cmd: ')
"   call inputrestore()
"   " let gdb_cmd = '-exec ' + cmd
"   call vimspector#Evaluate("-exec '" . cmd . "'")
" endfunc

" nmap <A-p> :call <SID>PrintVariable()<CR>
" function! <SID>PrintVariable()
"   echo 'executing it yo'
" endfunc

"autocmd FileType java nmap <leader>dd :CocCommand java.debug.vimspector.start<CR>
