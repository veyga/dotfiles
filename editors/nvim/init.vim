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
" set statusline+=%{FugitiveStatusline()}
set statusline+=\ 



let g:netrw_bufsettings = 'nu'

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
set wrap
" set colorcolumn=100
" set textwidth=100
" set columns=110
set colorcolumn=89
set textwidth=89
set columns=95
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

" navigation between windows
" tnoremap <C-h> <C-\><C-N><C-w>h
" tnoremap <C-j> <C-\><C-N><C-w>j
" tnoremap <C-k> <C-\><C-N><C-w>k
" tnoremap <C-l> <C-\><C-N><C-w>l
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" resizing windows
" this doesn't resize, but navigates instead
" nnoremap <C-S-k> :resize -2<CR>
" nnoremap <C-S-j> :resize +2<CR>
" these override the exising nav commands (i.e. Ctrl+k resizes instead of navigating up)
nnoremap <C-K> :resize -2<CR>
nnoremap <C-J> :resize +2<CR>
" ctrl cannnot differential upper and lowercase (use meta/alt)
nnoremap <C-Right> :vertical resize +2<CR>
nnoremap <C-Left> :vertical resize -2<CR>

"
" nnoremap <C-S-k> :echo "ctrl-K"<CR>
" nnoremap <C-S-j> :echo "ctrl-J"<CR>
" " nnoremap <C-h> :vertical resize -2<CR>
" " nnoremap <C-l> :vertical resize +2<CR>
" nmap <C-h> :vertical resize -2<CR>
" nmap <C-l> :vertical resize +2<CR>
" nnoremap <C-K> :resize -2<CR>
" nnoremap <C-J> :resize +2<CR>
" nmap <C-H> :vertical resize -2<CR>
" nmap <C-L> :vertical resize +2<CR>
" map <ESC>[65;5u   :echo "ctrl-shift-a received"<CR>
" map <C-a>         :echo "ctrl-a received"<CR>


" close buffer without closing window (prompt for save)
nnoremap <M-w> :bp<cr>:bd #<cr>
" nnoremap <C-w> :bp<cr>:bd #<cr>
" close buffer without closing window (no prompt - useful for exiting terminal)
"nnoremap <M-W> :bp<cr>:bd! #<cr>
" close window
nnoremap <M-W> :close<cr>
" nnoremap <C-W> :close<cr>

" display syntax group of selected item in bufferline
nmap <leader>so :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


"********************************************************
"***************   INITIALIZE THEME *********************
"********************************************************

lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplcate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}
EOF

source $HOME/dotfiles/editors/theme/obsidian2.vim
" colorscheme obsidian
