let g:mapleader = "\<Space>"

nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

"navigation (alt)
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
"resizing
nnoremap <C-j> :resize +2<CR>
nnoremap <C-k> :resize -2<CR>
nnoremap <C-h> :vertical resize -2<CR>
nnoremap <C-l> :vertical resize +2<CR>

"close buffer without closing window
nnoremap <M-w> :bp<cr>:bd #<cr>


nnoremap <M-2> :source ~/.config/nvim/init.vim<CR>
nnoremap <M-3> :ColorToggle<CR>

nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
