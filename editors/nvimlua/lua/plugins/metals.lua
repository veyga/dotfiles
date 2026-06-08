return {
  'scalameta/nvim-metals',
  ft = { 'scala', 'sbt', 'java' },
  opts = function()
    local metals_config = require('metals').bare_config()

    metals_config.settings = {
      showImplicitArguments = true,
      showImplicitConversionsAndClasses = true,
      showInferredType = true,
      superMethodLensesEnabled = true,
      testUserInterface = 'Test Explorer',
    }

    -- Pass nvim-cmp capabilities so completion works
    metals_config.capabilities = require('cmp_nvim_lsp').default_capabilities()

    metals_config.on_attach = function(client, bufnr)
      require('metals').setup_dap()
      local metals = require 'metals'
      vim.keymap.set('n', '<leader>dt', metals.select_test_suite, { desc = 'Metals: Debug test suite', buffer = bufnr })
      vim.keymap.set('n', '<leader>dc', metals.select_test_case, { desc = 'Metals: Debug test case', buffer = bufnr })
    end

    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group =
      vim.api.nvim_create_augroup('nvim-metals', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = self.ft,
      callback = function()
        require('metals').initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
}
