return {
  'puremourning/vimspector',
  init = function()
    vim.g.vimspector_enable_mappings = 'HUMAN'
    vim.g.vimspector_sidebar_width = 10
    vim.g.vimspector_bottombar_height = 5
  end,
  config = function()
    local opts = { noremap = true, silent = true }

    vim.keymap.set('n', '<leader>dd', ':call vimspector#Launch()<CR>', opts)
    vim.keymap.set('n', '<leader>dc', ':call vimspector#ClearBreakpoints()<CR>', opts)
    vim.keymap.set('n', '<leader>ds', ':call vimspector#Stop()<CR>', opts)
    vim.keymap.set('n', '<leader>dl', ':call vimspector#ListBreakpoints()<CR>', opts)
    vim.keymap.set('n', '<leader>dx', ':VimspectorReset<CR>', opts)
    vim.keymap.set('n', '<leader>de', ':VimspectorEval', opts)
    vim.keymap.set('n', '<leader>do', ':VimspectorShowOutput', opts)
    vim.keymap.set('n', '<A-i>', '<Plug>VimspectorBalloonEval', opts)
    vim.keymap.set('n', '<A-e>', function()
      vim.cmd "call vimspector#Evaluate(input('Evaluate: '))"
    end, opts)
    vim.keymap.set('n', '<leader>dw', function()
      local word = vim.fn.expand '<cexpr>'
      vim.fn['vimspector#AddWatch'](word)
    end, opts)
  end,
}
