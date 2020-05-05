"change directory of current window to the directory of the current buffer
command! CD :exec('lcd %:p:h')
command! SynId :exec('echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")')
command! Src :exec('source ~/.config/nvim/init.vim')
command! CT :exec('ColorToggle')
