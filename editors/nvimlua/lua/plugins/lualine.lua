return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local c = require 'core.colors'

    local theme = {
      normal = {
        a = { fg = c.black, bg = c.brightpink, gui = 'bold' },
        b = { fg = c.offwhite, bg = c.darkpurple },
        c = { fg = c.lightgray, bg = c.darkpurple },
      },
      inactive = {
        a = { fg = c.midgray, bg = c.darkpurple },
        b = { fg = c.midgray, bg = c.darkpurple },
        c = { fg = c.midgray, bg = c.darkpurple },
      },
    }

    local buffers = {
      'buffers',
      show_filename_only = true,
      show_modified_status = true,
      buffers_color = {
        active = { fg = c.yellow, bg = c.darkpurple, gui = 'bold' },
        inactive = { fg = c.midgray, bg = c.darkpurple },
      },
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = theme,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'neo-tree' },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { buffers },
        lualine_x = { 'filetype', 'progress', 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { buffers },
        lualine_x = { 'filetype', 'progress', 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive' },
    }
  end,
}
