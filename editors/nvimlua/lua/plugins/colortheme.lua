return {
  dir = vim.fn.stdpath 'config' .. '/colors',
  name = 'meeahmi',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'meeahmi'
  end,
}
