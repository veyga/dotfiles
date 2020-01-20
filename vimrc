call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'Valloric/YouCompleteMe', {'do':'./install.py --all --clangd-completer'}
Plug '/usr/bin/fzf'
Plug '/usr/share/fzf'
Plug 'junegunn/fzf'
call plug#end()

"Plug 'preservim/nerdtree'
"set rtp+=/usr/share/fzf
"set rtp+=/usr/bin/fzf
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

filetype plugin on " for nerd commenter 

"autocmd vimenter * NERDTree

set laststatus=2 "needed for lightline

let g:lightline = {
	\ 'colorscheme': 'jellybeans'
	\ }	

inoremap {<CR> {<CR>}<Esc>ko<BS><BS><BS><BS>
" needed for youcompleteme
set encoding=utf-8

set shiftwidth=4
set tabstop=4
set softtabstop=4
"set expandtab
"execute pathogen#infect()
	"syntax on
	"filetype plugin indent on
syntax on
" filetype plugin indent on
" 
" " show existing tab with 4 spaces width
"set tabstop=4
" 
" " On pressing tab, insert 4 spaces
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
" quit current buffer without closing window (needed for nerdtree)
"nnoremap <leader>q :bp<cr>:bd #<cr>
"nnoremap ]q :bp<cr>:bd #<cr>
" moving between windows and resizing
"map <A-w> :w<CR>
"map <A-h> <C-w>h
"map <A-j> <C-w>j
"map <A-k> <C-w>k
"map <A-l> <C-w>l
"map <A-<> <C-w><
"map <A->> <C-w>>
"map <A-=> <C-w>+
"map <A--> <C-w>-
"map <A-1> :NERDTreeToggle<CR>


map <leader>w :w<CR>
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l
map <leader>, <C-w><
map <leader>. <C-w>>
map <leader>= <C-w>+
map <leader>- <C-w>-
"map <leader>1 :NERDTreeToggle<CR>
map <leader>w :bp<cr>:bd #<cr>
map <leader>s :w<CR>
map <leader>n :bn<CR>
map <leader>p :bp<CR>
" 
" " Edit multiple files without saving
set hidden
" 
set splitright
set splitbelow

" syntax enable
