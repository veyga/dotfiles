return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      python = function(bufnr)
        local path = vim.api.nvim_buf_get_name(bufnr)
        local jf_root = vim.fn.expand('~') .. '/dev/jf/jellyfish/'
        if path:find(jf_root, 1, true)
          and not path:find(jf_root .. 'authstack/', 1, true)
          and not path:find(jf_root .. 'jf_authstack/', 1, true)
        then
          return { 'black' }
        end
        return { 'ruff_format' }
      end,
      kotlin = { 'ktlint' },
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
        cwd = function(self, ctx)
          return vim.fs.root(ctx.filename, 'pyproject.toml')
        end,
      },
      shfmt = {
        prepend_args = { '-i', '4' },
      },
    },
  },
}
