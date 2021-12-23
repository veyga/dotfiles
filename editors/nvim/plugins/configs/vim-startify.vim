let g:startify_bookmarks = [
            \ { 'd': '~/dotfiles' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'p': '~/.config/nvim/plugins/plugins.vim' },
            \ { 'o': '~/dotfiles/editors/theme/obsidian2.vim' },
            \ { 'z': '~/.zshrc' },
            \ { 'b': '~/.bashrc' },
            \ { 'x': '~/.Xresources' },
            \ { 'c': '~/.config/i3/config' },
            \ ]


" start startify and nerdtree on open
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

let g:startify_change_to_dir = 0
