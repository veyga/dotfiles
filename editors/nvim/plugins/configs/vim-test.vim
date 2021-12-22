nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tv :TestVisit<CR>
" let test#strategy = "vimspectorpy"
let test#strategy = "floaterm"
let test#neovim#term_position = "vertical"

" https://github.com/David-Kunz/vim/blob/master/init.vim
" nnoremap <leader>dt :TestNearest -strategy=jest<CR>
" function! JestStrategy(cmd)
"   let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
"   " wrap dict keys in quotes
"   call vimspector#LaunchWithSettings( { 'configuration': 'jest', 'TestName': testName } )
" endfunction      
" let g:test#custom_strategies = {'jest': function('JestStrategy')}

let test#python#runner = 'pytest'
