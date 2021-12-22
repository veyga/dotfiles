" defaults to .plugged
call plug#begin('~/dotfiles/editors/nvim/plugged')

" display buffers under statusline
Plug 'bling/vim-bufferline'
"Plug 'b4b4r07/vim-buftabs'

"filesystem navigation
Plug 'preservim/nerdtree'

" Plug 'tpope/vim-fugitive'

"surround terms
Plug 'tpope/vim-surround', {'autoload': {'filetypes': ['text','rust','typescript','scala','java','python', 'cpp', 'javascript']}}

"regex helper: highlights regions as you type in regex searches
Plug 'markonm/traces.vim'

" find and replace
Plug 'brooth/far.vim'

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

" git marks
" Plug 'airblade/vim-gitgutter'

Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

" show git status in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" show marks labels in the gutter
Plug 'kshenoy/vim-signature'

" enhanced register view
" Plug 'junegunn/vim-peekaboo'
" let g:peekaboo_window = "botright 30new"

" filetype icons
Plug 'ryanoasis/vim-devicons'

" color to icons (this must come AFTER vim-devicons)
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" enhanced start screen
Plug 'mhinz/vim-startify'

" absolute line num for current line, relative for rest
" Plug 'jeffkreeftmeijer/vim-numbertoggle'

" highlights color values 
Plug 'chrisbra/colorizer'

" highlight yanked text
Plug 'machakann/vim-highlightedyank'

" dotted-line indent guide
Plug 'Yggdroot/indentLine'

"cpp syntax highligthing
"Plug 'octol/vim-cpp-enhanced-highlight'

" enhanced syntax for python
Plug 'vim-python/python-syntax'

" lang highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/playground'

" rainbow parens
"Plug 'luochen1990/rainbow'
"Plug 'wlangstroth/vim-racket'

" typescript syntax highlighting
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'


" rust lang support
"Plug 'rust-lang/rust.vim'
"Plug 'arzg/vim-rust-syntax-ext'

"Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }

Plug 'puremourning/vimspector'
" Plug 'sagi-z/vimspectorpy', { 'do': { -> vimspectorpy#update() } }

Plug 'liuchengxu/vim-which-key'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

Plug 'cespare/vim-toml'

" buffers as tabs. need v0.5+
" Plug 'romgrk/barbar.nvim'
Plug 'szw/vim-maximizer'

Plug 'mxw/vim-jsx'

Plug 'martinda/Jenkinsfile-vim-syntax'

Plug 'vim-test/vim-test'
Plug 'voldikss/vim-floaterm'

" Plug 'tpope/vim-dadbod'

Plug 'alvan/vim-closetag'

Plug 'JamshedVesuna/vim-markdown-preview'

Plug 'xavierchow/vim-swagger-preview'
" Plug 'jparise/vim-graphql'

" coc plugins (install via CocInstall)
Plug 'tjdevries/coc-zsh'
" Plug 'iamcco/coc-vimlsp'
" Plug 'iamcco/coc-actions'
" Plug 'neoclide/coc-prettier'
" Plug 'neoclide/coc-tsserver'
" Plug 'neoclide/coc-jest'
" Plug 'neoclide/coc-yaml'
" Plug 'neoclide/coc-json'
" Plug 'neoclide/coc-html'
" Plug 'neoclide/coc-eslint'
" Plug 'neoclide/coc-tslint-plugin'
" Plug 'neoclide/coc-css'
" Plug 'fannheyward/coc-pyright'
" Plug 'fannheyward/coc-marketplace'
" Plug 'fannheyward/coc-xml'
" Plug 'fannheyward/coc-deno'
" Plug 'fannheyward/coc-rust-analyzer'
" Plug 'clangd/coc-clangd'
" Plug 'voldikss/coc-cmake'
" Plug 'scalameta/coc-metals'
call plug#end()

source $NVIM_HOME/plugins/configs/colorizer.vim
source $NVIM_HOME/plugins/configs/fzf.vim
source $NVIM_HOME/plugins/configs/indentline.vim
source $NVIM_HOME/plugins/configs/nerdtree.vim
" source $NVIM_HOME/plugins/configs/rainbow.vim
" source $NVIM_HOME/plugins/configs/far.vim
source $NVIM_HOME/plugins/configs/tagbar.vim
source $NVIM_HOME/plugins/configs/vim-bufferline.vim
" source $NVIM_HOME/plugins/configs/vim-buftabs.vim
source $NVIM_HOME/plugins/configs/vim-commentary.vim
source $NVIM_HOME/plugins/configs/vim-highlightedyank.vim
source $NVIM_HOME/plugins/configs/coc/coc-general.vim
source $NVIM_HOME/plugins/configs/vim-startify.vim
source $NVIM_HOME/plugins/configs/vim-which-key.vim
" source $NVIM_HOME/plugins/configs/vim-cpp-enhanced-highlight.vim
source $NVIM_HOME/plugins/configs/vim-test.vim
source $NVIM_HOME/plugins/configs/vimspector.vim
source $NVIM_HOME/plugins/configs/vim-maximizer.vim
" source $NVIM_HOME/plugins/configs/vim-gitgutter.vim
source $NVIM_HOME/plugins/configs/vim-floaterm.vim
" source $NVIM_HOME/plugins/configs/vim-dadbod.vim
source $NVIM_HOME/plugins/configs/vim-closetag.vim
source $NVIM_HOME/plugins/configs/vim-markdown-preview.vim
source $NVIM_HOME/plugins/configs/vim-jsx.vim
source $NVIM_HOME/plugins/configs/gitsigns.lua
" source $NVIM_HOME/plugins/configs/treesitter/treesitter.lua

source $NVIM_HOME/plugins/configs/local_config.vim

" lua require('nvim-treesitter.configs').setup({
" highlight = {
"   enable = true
"   }
" })


