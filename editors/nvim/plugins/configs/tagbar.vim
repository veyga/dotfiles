" CTags must be installed on system
"set g:tagbar_ctags_bin
nnoremap <A-3> :TagbarToggle<CR>

let g:tagbar_show_linenumbers = 1
let g:tagbar_compact = 1
let g:tagbar_foldlevel = 0

" autocmd VimEnter * call tagbar#SetFoldLevel(0,0)
" autocmd BufEnter * :TagbarSetFoldLevel 0<CR> 
