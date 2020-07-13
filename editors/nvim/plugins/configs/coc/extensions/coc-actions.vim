" displays available CocActions in a small buffer (like import, snippets, etc)
nmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
