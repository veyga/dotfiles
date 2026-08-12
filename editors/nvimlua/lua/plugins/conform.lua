return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      python = function(bufnr)
        local path = vim.api.nvim_buf_get_name(bufnr)
        if path:find(vim.fn.expand('~') .. '/dev/jf/jellyfish/', 1, true) then
          return { 'black' }
        end
        return { 'ruff_format' }
      end,
      rust = { 'rustfmt', lsp_format = 'fallback' },
      -- prettier for web-ish filetypes (stop after first available)
      javascript = { 'prettier', stop_after_first = true },
      javascriptreact = { 'prettier', stop_after_first = true },
      typescript = { 'prettier', stop_after_first = true },
      typescriptreact = { 'prettier', stop_after_first = true },
      html = { 'prettier', stop_after_first = true },
      json = { 'prettier', stop_after_first = true },
      yaml = { 'prettier', stop_after_first = true },
      markdown = { 'prettier', stop_after_first = true },
      -- shell / infra / go
      sh = { 'shfmt' },
      bash = { 'shfmt' },
      terraform = { 'terraform_fmt' },
      tf = { 'terraform_fmt' },
      go = { 'gofumpt' },
    },
    formatters = {
      black = {
        command = '/Users/andrewstefanich/.pyenv/shims/black',
      },
      shfmt = {
        prepend_args = { '-i', '4' },
      },
    },
  },
}
