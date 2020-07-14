nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>

autocmd FileType racket setlocal commentstring=;;\ %s

" au BufRead,BufNewFile .Xresources set filetype=Xresources
" autocmd FileType Xresources setlocal commentstring=!\ %s
