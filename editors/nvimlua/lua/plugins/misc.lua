-- Standalone plugins with less than 10 lines of config go here
return {
  { 'tpope/vim-surround' },
  -- file system cmds
  { 'tpope/vim-eunuch' },
  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },
  -- {
  --   -- Tmux & split window navigation
  --   'christoomey/vim-tmux-navigator',
  -- },
  -- {
  --   -- Powerful Git integration for Vim
  --   'tpope/vim-fugitive',
  -- },
  -- {
  --   -- GitHub integration for vim-fugitive
  --   'tpope/vim-rhubarb',
  -- },
  {
    -- Hints keybinds
    'folke/which-key.nvim',
    opts = {
      delay = 1000, -- ms before popup appears
    },
  },
  {
    -- Autoclose parentheses, brackets, quotes, etc.
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  -- TODO colorizer not working?
  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    -- High-performance color highlighter
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'szw/vim-maximizer',
    keys = {
      { '<leader>M', '<cmd>MaximizerToggle<CR>', desc = 'Toggle maximize window' },
    },
  },
  {
    'majutsushi/tagbar',
    keys = {
      { '<A-3>', '<cmd>TagbarToggle<CR>', desc = 'Toggle Tagbar' },
    },
    init = function()
      vim.g.tagbar_show_linenumbers = 1
      vim.g.tagbar_compact = 1
      vim.g.tagbar_foldlevel = 0
    end,
  },
}
