let g:mapleader = "\<Space>"

"********************************************************
"****************** STATUS LINE *************************
"********************************************************
set statusline=
set statusline+=\ %F
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=%#CursorColumn#
set statusline+=\ 


"********************************************************
"***************   INITIALIZE THEME *********************
"********************************************************
source $HOME/dotfiles/editors/theme/obsidian.vim


"********************************************************
"**************   INITIALIZE PLUGINS ********************
"********************************************************
source $NVIM_HOME/plugins/plugins.vim


"********************************************************
"**************   GENERAL SETTINGS **********************
"********************************************************
set number relativenumber
set nuw=4
set hidden
set autoread
set clipboard+=unnamedplus
"unnamed  = one line deletes/yanks will cycle through registers
set termguicolors
set splitright
set nohlsearch
set splitbelow
set expandtab
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set nobackup
set mouse=nv
set colorcolumn=100
set textwidth=100
set wrap
set columns=100
set noswapfile
set noautochdir
"set list
" set listchars=tab:▸-,eol:↩︎,trail:-↩

"********************************************************
"****************  GENERAL COMMANDS *********************
"***** (see plugins configs for additional commands) ****
"********************************************************

" change directory of current window to the directory of the current buffer
command! CD :exec('lcd %:p:h')
" get the syntax group for selected item
command! SynId :exec('echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")')
command! Src :exec('source $NVIM_HOME/init.vim')
" command! FJ %!python3 -m json.tool


"********************************************************
"**************** GENERAL KEYBINDINGS *******************
"**** (see plugins configs for additional bindings) *****
"********************************************************
nnoremap <M-9> :source $NVIM_HOME/init.vim<CR>

" navigation between buffers
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

" navigation between windows
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" resizing windows
nnoremap <C-k> :resize -2<CR>
nnoremap <C-j> :resize +2<CR>
" nnoremap <C-h> :vertical resize -2<CR>
" nnoremap <C-l> :vertical resize +2<CR>
nmap <C-h> :vertical resize -2<CR>
nmap <C-l> :vertical resize +2<CR>

" close buffer without closing window (prompt for save)
nnoremap <M-w> :bp<cr>:bd #<cr>
" close buffer without closing window (no prompt - useful for exiting terminal)
"nnoremap <M-W> :bp<cr>:bd! #<cr>
" close window
nnoremap <M-W> :close<cr>

" display syntax group of selected item in bufferline
nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
