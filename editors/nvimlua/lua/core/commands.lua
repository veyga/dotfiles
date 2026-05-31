vim.api.nvim_create_user_command('CD', function()
  vim.cmd 'lcd %:p:h'
  vim.cmd('Neotree dir=' .. vim.fn.expand '%:p:h')
end, {})
vim.api.nvim_create_user_command('LSP', function(opts)
  local ok, mappings = pcall(require, 'mason-lspconfig.mappings')
  if not ok then
    print('mason-lspconfig not available')
    return
  end
  local result = mappings.get_mason_map().package_to_lspconfig[opts.args]
  print(result or ('No lspconfig mapping found for: ' .. opts.args))
end, { nargs = 1 })

vim.api.nvim_create_user_command('CPDIR', '!bash cpdir', {})
vim.api.nvim_create_user_command('CPD', 'lcd %:p:h | !bash cpdir', {})
vim.api.nvim_create_user_command('CPF', 'lcd %:p:h | !bash cpdir "%:p"', {})
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank { timeout = 500 }
  end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "neo-tree" then
      vim.schedule(function()
        vim.wo.relativenumber = true
        vim.wo.number = true
      end)
    end
  end,
})
