let g:startify_bookmarks = [
            \ { 'b': '~/.bashrc' },
            \ { 'c': '~/.config/i3/config' },
            \ { 'd': '~/dotfiles' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'm': '~/dotfiles/editors/theme/meeahmi.vim' },
            \ { 'o': '~/dotfiles/editors/nvim/coc-settings.json' },
            \ { 'p': '~/.config/nvim/plugins/plugins.vim' },
            \ { 'x': '~/.Xresources' },
            \ { 'z': '~/.zshrc' },
            \ ]


" start startify and nerdtree on open
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

let g:startify_change_to_dir = 0
