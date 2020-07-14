nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>

autocmd FileType racket setlocal commentstring=;;\ %s
au BufNewFile,BufRead .Xresources setlocal commentstring=!\ %s
