call plug#begin('~/.config/vim-plug-plugins-sources')

"filesystem navigation
Plug 'preservim/nerdtree'

"surround terms
Plug 'tpope/vim-surround', {'autoload': {'filetypes': ['rust','typescript','scala','text']}}

"regex helper
Plug 'markonm/traces.vim'

"status bar
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

"side bar class view
Plug 'majutsushi/tagbar'

" dont want custom material theme to be overrriden on update
" theme
"Plug 'kaicataldo/material.vim'

"conquerer of completion
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}

"comment with space-/
Plug 'tpope/vim-commentary'

"edit filesytem from vim commands
Plug 'tpope/vim-eunuch'

"search a line with 2 characters
Plug 'justinmk/vim-sneak'

"fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"automatch parens
Plug 'jiangmiao/auto-pairs'

" git marks
Plug 'airblade/vim-gitgutter'

"show marks labels in the gutter
Plug 'kshenoy/vim-signature'

"enhanced register view
Plug 'junegunn/vim-peekaboo'
let g:peekaboo_window = "botright 30new"

"icons
Plug 'ryanoasis/vim-devicons'

"color to icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"language support
"Plug 'sheerun/vim-polyglot'

"enhanced start screen
Plug 'mhinz/vim-startify'

"absolute line num for current line, relative for rest
Plug 'jeffkreeftmeijer/vim-numbertoggle'

"color scheme
Plug 'flazz/vim-colorschemes'

"highlights color values
Plug 'chrisbra/colorizer'


" easier movement of line blocks in visual mode (alt + arrows)
" Plug 'matze/vim-move'

" highlight yanked text
" Plug 'machakann/vim-highlightedyank'

Plug 'puremourning/vimspector'

"text indent guide
Plug 'Yggdroot/indentLine'

" typescript syntaxt highlighting
Plug 'herringtondarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
Plug 'rust-lang/rust.vim' 
Plug 'arzg/vim-rust-syntax-ext'
"react thing
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }


call plug#end()
