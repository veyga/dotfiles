execute pathogen#infect()
syntax on
filetype plugin indent on

nmap <S-CR> O<Esc>
nmap <CR> o<Esc>
" Enable line numbering
set nu

" Show cursor position
set ruler

" Show incomplete commands
set showcmd


set wildmenu

set incsearch

" Ignore case when searching
set ignorecase
set smartcase

" Don't line wrap midword
set lbr

" Auto indent/Smart indent
set ai
set si

set bg=dark

" Color scheme (~/.vim/color)

" Quicker writing/saving
map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>qq :q!<CR>
map <leader>wq :wq<CR>
map <leader>wall :wall

" Edit multiple files without saving
set hidden

syntax enable
