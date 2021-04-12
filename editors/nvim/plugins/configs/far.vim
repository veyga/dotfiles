set lazyredraw            " improve scrolling performance when navigating through large results
set regexpengine=1        " use old regexp engine
set ignorecase smartcase  " ignore case only when the pattern contains no capital letters

let g:far#enable_undo=1
let g:far#highlight_match=0
let g:far#preview_window_height=20
" search recursive from current directory
let g:far#default_file_mask='**/*'
let g:far#window_layout='current'

" shortcut for far.vim find
nnoremap <leader>s :Farf<cr>
vnoremap <leader>s :Farf<cr>

" shortcut for far.vim replace
nnoremap <leader>R  :Farr<cr>
vnoremap <leader>R  :Farr<cr>

" yo
