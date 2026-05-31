-- ┌────────────┬────────────────────────┐
-- │    Key     │         Action         │
-- ├────────────┼────────────────────────┤
-- │ F5         │ Continue / start       │
-- ├────────────┼────────────────────────┤
-- │ F9         │ Toggle breakpoint      │
-- ├────────────┼────────────────────────┤
-- │ F10        │ Step over              │
-- ├────────────┼────────────────────────┤
-- │ F11        │ Step into              │
-- ├────────────┼────────────────────────┤
-- │ F12        │ Step out               │
-- ├────────────┼────────────────────────┤
-- │ <leader>db │ Toggle breakpoint      │
-- ├────────────┼────────────────────────┤
-- │ <leader>dB │ Conditional breakpoint │
-- ├────────────┼────────────────────────┤
-- │ <leader>du │ Toggle DAP UI          │
-- ├────────────┼────────────────────────┤
-- │ <leader>dr │ Open REPL              │
-- ├────────────┼────────────────────────┤
-- │ <leader>dx │ Terminate              │
-- └────────────┴────────────────────────┘
return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'rcarriga/nvim-dap-ui',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    dapui.setup()

    -- Open/close dapui automatically when debugging starts/stops
    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Python (debugpy installed via Mason)
    dap.adapters.python = {
      type = 'executable',
      command = vim.fn.stdpath 'data' .. '/mason/packages/debugpy/venv/bin/python',
      args = { '-m', 'debugpy.adapter' },
    }
    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        pythonPath = function()
          local venv = vim.fn.getcwd() .. '/.venv/bin/python'
          if vim.fn.executable(venv) == 1 then
            return venv
          end
          return vim.fn.exepath 'python3' or vim.fn.exepath 'python'
        end,
      },
    }

    -- Keymaps
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'DAP: Continue' })
    vim.keymap.set(
      'n',
      '<F9>',
      dap.toggle_breakpoint,
      { desc = 'DAP: Toggle breakpoint' }
    )
    vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'DAP: Step over' })
    vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'DAP: Step into' })
    vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'DAP: Step out' })
    vim.keymap.set(
      'n',
      '<leader>db',
      dap.toggle_breakpoint,
      { desc = 'DAP: Toggle breakpoint' }
    )
    vim.keymap.set('n', '<leader>dB', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'DAP: Conditional breakpoint' })
    vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = 'DAP: Open REPL' })
    vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'DAP: Toggle UI' })
    vim.keymap.set('n', '<leader>dx', dap.terminate, { desc = 'DAP: Terminate' })
  end,
}
