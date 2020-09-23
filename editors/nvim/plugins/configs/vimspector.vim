"F5 vimspector#Continue()
"F3 vimspector#Stop(
"F4 vimspector#Restart()
"F6 vimspector#Pause()
"F9 vimspector#ToggleBreakpoint()
"F8 vimspector#AddFunctionBreakpoint('<cexpr>')   //current line
"F10 vimspector#StepOver()
"F11 vimspector#StepInto()
"F12 vimspector#StepOut()
"
let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput

let g:vimspector_sidebar_width = 40 "default = 50
let g:vimspector_bottombar_height = 25 "default = 10

" nnoremap <A-e> :execute vimspector#Evaluate('"-exec " + input("Enter cmd: ")')
" nnoremap <A-e> :call vimspector#Evaluate('-exec "'.input('Enter cmd: ').'"')<cr>
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
