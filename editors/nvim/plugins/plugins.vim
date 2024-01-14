" defaults to .plugged
call plug#begin('~/dotfiles/editors/nvim/plugged')

" display buffers under statusline
" Plug 'bling/vim-bufferline'
Plug 'b4b4r07/vim-buftabs'

"filesystem navigation
Plug 'preservim/nerdtree'

"surround terms
Plug 'tpope/vim-surround', {'autoload': {'filetypes': ['text','rust','typescript','scala','java','python', 'cpp', 'javascript', 'hcl']}}

"regex helper: highlights regions as you type in regex searches
Plug 'markonm/traces.vim'

" find and replace
" Plug 'brooth/far.vim'

" show ctags in side bar (requires ctags to be installed)
Plug 'majutsushi/tagbar'

" conquer of completion (LSP client)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" better git blames
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" show git status in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" show marks labels in the gutter
Plug 'kshenoy/vim-signature'

" filetype icons
Plug 'ryanoasis/vim-devicons'

" color to icons (this must come AFTER vim-devicons)
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" enhanced start screen
Plug 'mhinz/vim-startify'

" highlights color values 
Plug 'chrisbra/colorizer'

" highlight yanked text
Plug 'machakann/vim-highlightedyank'

" dotted-line indent guide
Plug 'Yggdroot/indentLine'

" " enhanced syntax for python
" Plug 'vim-python/python-syntax'

" additional lang support
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" typescript syntax highlighting
" Plug 'leafgarland/typescript-vim'
" Plug 'pangloss/vim-javascript'

" rust lang support
"Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }

Plug 'puremourning/vimspector'

Plug 'liuchengxu/vim-which-key'
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" buffers as tabs. need v0.5+
" Plug 'romgrk/barbar.nvim'
Plug 'szw/vim-maximizer'

" Plug 'mxw/vim-jsx'

" Plug 'vim-test/vim-test'
" Plug 'voldikss/vim-floaterm'

Plug 'alvan/vim-closetag'

" Plug 'JamshedVesuna/vim-markdown-preview'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Plug 'dstein64/nvim-scrollview'
"
Plug 'NoahTheDuke/vim-just'

call plug#end()

source $NVIM_HOME/plugins/configs/colorizer.vim
source $NVIM_HOME/plugins/configs/fzf.vim
source $NVIM_HOME/plugins/configs/indentline.vim
source $NVIM_HOME/plugins/configs/nerdtree.vim
source $NVIM_HOME/plugins/configs/tagbar.vim
source $NVIM_HOME/plugins/configs/vim-bufferline.vim
source $NVIM_HOME/plugins/configs/vim-commentary.vim
source $NVIM_HOME/plugins/configs/vim-highlightedyank.vim
source $NVIM_HOME/plugins/configs/coc/coc-general.vim
source $NVIM_HOME/plugins/configs/vim-startify.vim
source $NVIM_HOME/plugins/configs/vim-which-key.vim
source $NVIM_HOME/plugins/configs/vim-test.vim
source $NVIM_HOME/plugins/configs/vimspector.vim
source $NVIM_HOME/plugins/configs/vim-maximizer.vim
source $NVIM_HOME/plugins/configs/vim-floaterm.vim
source $NVIM_HOME/plugins/configs/vim-markdown-preview.vim
source $NVIM_HOME/plugins/configs/gitsigns.lua
source $NVIM_HOME/plugins/configs/treesitter/playground.vim
source $NVIM_HOME/plugins/configs/local_config.vim
