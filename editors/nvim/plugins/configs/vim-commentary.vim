nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>

autocmd FileType racket setlocal commentstring=;;\ %s
au BufNewFile,BufRead .Xresources setlocal commentstring=!\ %s
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType json setlocal commentstring=//\ %s
autocmd FileType bash setlocal commentstring=#\ %s
autocmd FileType terraform setlocal commentstring=#\ %s
autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType lua setlocal commentstring=--\ %s
autocmd FileType hcl setlocal commentstring=#\ %s
autocmd FileType sml setlocal commentstring=(*\ %s\ *)

