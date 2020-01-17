call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'Valloric/YouCompleteMe', {'do':'./install.py --all --clangd-completer'}
call plug#end()

" for nerd commenter
filetype plugin on 
autocmd vimenter * NERDTree
set laststatus=2 "needed for lightline

let g:lightline = {
	\ 'colorscheme': 'jellybeans'
	\ }	
"set tabstop=4

inoremap {<CR> {<CR>}<Esc>ko<BS><BS><BS><BS>
" needed for youcompleteme
set encoding=utf-8

"execute pathogen#infect()
	"syntax on
	"filetype plugin indent on
" syntax on
" filetype plugin indent on
" 
" " show existing tab with 4 spaces width
set tabstop=4
" 
" " On pressing tab, insert 4 spaces
set expandtab
" 
nmap <S-CR> O<Esc>
nmap <CR> o<Esc>
" " Enable line numbering
set nu
" 
" " Show cursor position
set ruler
" 
" " Show incomplete commands
set showcmd
" 
" 
set wildmenu
" 
set incsearch
" 
" " Ignore case when searching
set ignorecase
set smartcase
" 
" " Don't line wrap midword
set lbr
" 
" " Auto indent/Smart indent
set ai
set si
" 
" set bg=dark
" 
" " Color scheme (~/.vim/color)

:let mapleader = "]"
" " Quicker writing/saving
" map <leader>w :w<CR>
" map <leader>q :q<CR>
" map <leader>qq :q!<CR>
" map <leader>wq :wq<CR>
" map <leader>wall :wall
" 
" " Edit multiple files without saving
set hidden
" 
" syntax enable
