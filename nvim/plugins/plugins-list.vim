call plug#begin('~/.config/vim-plug-plugins-sources')

"filesystem navigation
Plug 'preservim/nerdtree'

"status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"conquerer of completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

"show marks in the gutter
Plug 'kshenoy/vim-signature'

"enhanced register view
Plug 'junegunn/vim-peekaboo'
let g:peekaboo_window = "botright 30new"

"language support
Plug 'sheerun/vim-polyglot'

"enhanced start screen
Plug 'mhinz/vim-startify'

"color scheme
Plug 'flazz/vim-colorschemes'

"highlights color values
Plug 'chrisbra/colorizer'

"icons
Plug 'ryanoasis/vim-devicons'

" color to icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()
