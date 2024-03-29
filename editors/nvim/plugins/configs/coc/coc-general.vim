" Configuration for coc.nvim

" If hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files
set nobackup
set nowritebackup

" You will have a bad experience with diagnostic messages with the default 4000.
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Used in the tab autocompletion for coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Used to expand decorations in worksheets
" nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

nnoremap <silent> <leader>ce      :<c-u>CocEnable<CR>
nnoremap <silent> <leader>cd      :<c-u>CocDisable<CR>
" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" OVERIDDEN: <leader>f mapped to FZF's :Files command
" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
vmap <leader>t  <Plug>(coc-format-selected)
nmap <leader>t  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format)


" OVERIDDEN: <leader>a mapped to coc-actions
" Remap for do codeAction of selected region  (coc-actions)
" function! s:cocActionsOpenFromSelected(type) abort
"   execute 'CocCommand actions.open ' . a:type
" endfunction
" xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
" nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"<leader>a then..
    " <leader>a for the current selected range
    " <leader>aw for the current word
    " <leader>aas for the current sentence
    " <leader>aap for the current paragraph
"
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
" nmap <leader>a  <Plug>(coc-codeaction)
" nmap <leader>ca  <Plug>(coc-codeaction)
" nmap <leader> ca <Plug>(coc-codeaction-line)
" xmap <leader> ca <Plug>(coc-codeaction-selected)
" nmap <leader> cA <Plug>(coc-codeaction)

nmap <silent> ga <Plug>(coc-codeaction-line)
xmap <silent> ga <Plug>(coc-codeaction-selected)
nmap <silent> gA <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>

" Show all diagnostics
nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType scala setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

nnoremap <A-4> :CocOutline<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#pum#next(1):
\ <SID>check_back_space() ? "\<Tab>" :
\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" Not all of these have custom configs, but config changes should be made to these files
source $NVIM_HOME/plugins/configs/coc/extensions/coc-actions.vim
" source $NVIM_HOME/plugins/configs/coc/extensions/coc-clangd.vim
source $NVIM_HOME/plugins/configs/coc/extensions/coc-css.vim
" source $NVIM_HOME/plugins/configs/coc/extensions/coc-go.vim
source $NVIM_HOME/plugins/configs/coc/extensions/coc-html.vim
source $NVIM_HOME/plugins/configs/coc/extensions/coc-json.vim
" source $NVIM_HOME/plugins/configs/coc/extensions/coc-marketplace.vim
" source $NVIM_HOME/plugins/configs/coc/extensions/coc-metals.vim
" source $NVIM_HOME/plugins/configs/coc/extensions/coc-rust-analyzer.vim
" source $NVIM_HOME/plugins/configs/coc/extensions/coc-snippets.vim
" source $NVIM_HOME/plugins/configs/coc/extensions/coc-terminal.vim
source $NVIM_HOME/plugins/configs/coc/extensions/coc-tslint-plugin.vim
source $NVIM_HOME/plugins/configs/coc/extensions/coc-tsserver.vim
source $NVIM_HOME/plugins/configs/coc/extensions/coc-xml.vim
source $NVIM_HOME/plugins/configs/coc/extensions/coc-pyright.vim
" source $NVIM_HOME/plugins/configs/coc/extensions/coc-yank.vim
