au BufRead,BufNewFile *.sbt set filetype=scala
autocmd FileType json syntax match Comment +\/\/.\+$+

" TODO make these applicable only to scala files

"" Display the tree view
"nnoremap <A-2> :CocCommand metals.tvp<CR>

""Toggle panel with Tree Views
"nnoremap <silent> <space>T :<C-u>ocCommand metals.tvp<CR>

"" Toggle Tree View 'metalsBuild'
"nnoremap <silent> <space>Tb :<C-u>CocCommand metals.tvp metalsBuild<CR>

"" Toggle Tree View 'metalsCompile'
"nnoremap <silent> <space>Tc :<C-u>CocCommand metals.tvp metalsCompile<CR>

"" Reveal current current class (trait or object) in Tree View 'metalsBuild'
"nnoremap <silent> <space>Tf :<C-u>CocCommand metals.revealInTreeView metalsBuild<CR>C
