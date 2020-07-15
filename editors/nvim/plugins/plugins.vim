call plug#begin('$HOME/.config/vim-plug-plugins-sources')

"filesystem navigation
Plug 'preservim/nerdtree'

"surround terms
Plug 'tpope/vim-surround', {'autoload': {'filetypes': ['text','rust','typescript','scala','java','python']}}

"regex helper: highlights regions as you type in regex searches
Plug 'markonm/traces.vim'

" display buffers under statusline
Plug 'bling/vim-bufferline'

" show ctags in side bar
Plug 'majutsushi/tagbar'

" conquer of completion (LSP client)
" build from source
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" release branch (use this for remote comps)
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"comment shortcuts
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

" show marks labels in the gutter
Plug 'kshenoy/vim-signature'

" enhanced register view
Plug 'junegunn/vim-peekaboo'
let g:peekaboo_window = "botright 30new"

" filetype icons
Plug 'ryanoasis/vim-devicons'

" color to icons (this must come AFTER vim-devicons)
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" enhanced start screen
Plug 'mhinz/vim-startify'

" absolute line num for current line, relative for rest
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" highlights color values 
Plug 'chrisbra/colorizer'

"cpp syntax highligthing
Plug 'octol/vim-cpp-enhanced-highlight'

" highlight yanked text
Plug 'machakann/vim-highlightedyank'

" enhanced syntax for python
Plug 'vim-python/python-syntax'

" dotted-line indent guide
Plug 'Yggdroot/indentLine'

" rainbow parens
Plug 'luochen1990/rainbow'
Plug 'wlangstroth/vim-racket'

" typescript syntax highlighting
Plug 'herringtondarkholme/yats.vim'
Plug 'pangloss/vim-javascript'

" yats is better?
" Plug 'leafgarland/typescript-vim'

" rust lang support
Plug 'rust-lang/rust.vim' 
Plug 'arzg/vim-rust-syntax-ext'

call plug#end()

source $NVIM_HOME/plugins/configs/colorizer.vim
source $NVIM_HOME/plugins/configs/fzf.vim
source $NVIM_HOME/plugins/configs/indentline.vim
source $NVIM_HOME/plugins/configs/nerdtree.vim
source $NVIM_HOME/plugins/configs/rainbow.vim
source $NVIM_HOME/plugins/configs/tagbar.vim
source $NVIM_HOME/plugins/configs/vim-bufferline.vim
source $NVIM_HOME/plugins/configs/vim-commentary.vim
source $NVIM_HOME/plugins/configs/vim-highlightedyank.vim
source $NVIM_HOME/plugins/configs/coc/coc-general.vim
source $NVIM_HOME/plugins/configs/vim-startify.vim
