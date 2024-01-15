-- THEME
vim.cmd("source $HOME/dotfiles/editors/theme/meeahmi.vim")

vim.g.mapleader = ' '

-- vim.opt used for vim.o vim.wo vim.bo namespaces
vim.opt.splitbelow = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "89"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
 {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        layout_strategy = "vertical",
      }
    }
 },
 { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
}
local opts = {}

require("lazy").setup(plugins, opts)

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>r", builtin.live_grep, {})


local config = require("nvim-treesitter.configs")
config.setup({
  highlight = { enable = true },
  indent = { enable = true },
  ensure_installed = { 
    "lua", 
    "javascript",
  },
})
