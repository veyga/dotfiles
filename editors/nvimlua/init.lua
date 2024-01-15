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

require("lazy").setup("plugins")
