return { 
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = { 
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "dockerfile",
        "go",
        "hcl",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "lua",
        "make",
        "markdown",
        "python",
        "scss",
        "toml",
        "tsx",
        "terraform",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
    })
  end
}
