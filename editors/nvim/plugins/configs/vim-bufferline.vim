" TODO command to toggle this on/off
let g:bufferline_echo = 0

" nmap <leader>B :call <SID>ToggleBufferline()<CR>
" nmap <leader>Y :call <SID>MyBufferlineRefresh()<CR>

" function! <SID>ToggleBufferline()
" 	if g:bufferline_echo == 1
" 		let g:bufferline_echo = 0
" 	else
" 		let g:bufferline_echo = 1
" 	endif
" 	echo g:bufferline_echo
" endfunc

" function! <SID>MyBufferlineRefresh()
" 	call bufferline#refresh_status()
" endfunction
"command! Bufferline :exec('source $NVIM_HOME/init.vim')
