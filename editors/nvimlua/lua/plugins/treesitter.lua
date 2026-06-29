return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = {
      'bash',
      'cmake',
      'cpp',
      'css',
      'csv',
      'dockerfile',
      'git_config',
      'git_rebase',
      'gitcommit',
      'gitignore',
      'go',
      'gomod',
      'gosum',
      'graphql',
      'groovy',
      'haskell',
      'helm',
      'html',
      'java',
      'javascript',
      'jinja',
      'json',
      'kconfig',
      'lua',
      'make',
      'markdown',
      'markdown_inline',
      'promql',
      'python',
      'purescript',
      'regex',
      'rust',
      'scala',
      'sql',
      'terraform',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
      'yaml',
      'zig',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
-- Workaround: in Neovim 0.12, treesitter match captures return lists of nodes
-- instead of single nodes. nvim-treesitter directives (set-lang-from-info-string! etc.)
-- don't handle this, causing a crash. Unwrap single-element lists transparently.
-- allows for treesitter to handle language blocks inside markdown files like so:
-- ```lang
-- val x = 4
-- ```
  config = function(_, opts)
    local _orig_get_node_text = vim.treesitter.get_node_text
    vim.treesitter.get_node_text = function(node, source, node_opts)
      if type(node) == "table" then node = node[1] end
      if not node then return "" end
      return _orig_get_node_text(node, source, node_opts)
    end
    require('nvim-treesitter.configs').setup(opts)
  end,
  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  --
  --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
