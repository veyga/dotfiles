-- the "config" is run by 'lazy' after plugin loads
return  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "vertical",
          file_ignore_patterns = {
            "node_modules/.*",
            "yarn.lock",
            "package%-lock.json",
            "lazy%-lock.json",
            ".git/.*",
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>f", builtin.find_files, {})
      vim.keymap.set("n", "<leader>r", builtin.live_grep, {})
    end,
  }
