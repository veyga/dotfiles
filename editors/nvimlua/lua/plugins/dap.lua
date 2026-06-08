-- ┌─────────────┬────────────────────────┐
-- │     Key     │         Action         │
-- ├─────────────┼────────────────────────┤
-- │ F5          │ Continue / start       │
-- ├─────────────┼────────────────────────┤
-- │ F3          │ Stop                   │
-- ├─────────────┼────────────────────────┤
-- │ F6          │ Pause                  │
-- ├─────────────┼────────────────────────┤
-- │ F9          │ Toggle breakpoint      │
-- ├─────────────┼────────────────────────┤
-- │ F10         │ Step over              │
-- ├─────────────┼────────────────────────┤
-- │ F11         │ Step into              │
-- ├─────────────┼────────────────────────┤
-- │ F12         │ Step out               │
-- ├─────────────┼────────────────────────┤
-- │ <leader>dd  │ Launch / continue      │
-- ├─────────────┼────────────────────────┤
-- │ <leader>ds  │ Stop                   │
-- ├─────────────┼────────────────────────┤
-- │ <leader>dx  │ Terminate / reset      │
-- ├─────────────┼────────────────────────┤
-- │ <leader>db  │ Toggle breakpoint      │
-- ├─────────────┼────────────────────────┤
-- │ <leader>dB  │ Conditional breakpoint │
-- ├─────────────┼────────────────────────┤
-- │ <leader>dC  │ Clear all breakpoints  │
-- ├─────────────┼────────────────────────┤
-- │ <leader>dl  │ List breakpoints       │
-- ├─────────────┼────────────────────────┤
-- │ <leader>de  │ Evaluate expression    │
-- ├─────────────┼────────────────────────┤
-- │ <leader>dw  │ Watch word under cursor│
-- ├─────────────┼────────────────────────┤
-- │ <A-e>       │ Eval with prompt       │
-- ├─────────────┼────────────────────────┤
-- │ <A-i>       │ Hover eval             │
-- ├─────────────┼────────────────────────┤
-- │ <leader>du  │ Toggle DAP UI          │
-- ├─────────────┼────────────────────────┤
-- │ <leader>dr  │ Open REPL              │
-- └─────────────┴────────────────────────┘
return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'rcarriga/nvim-dap-ui',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    local colors = require 'core.colors'

    dapui.setup {
      icons = { expanded = '', collapsed = '', current_frame = '' },
      controls = {
        icons = {
          pause = '',
          play = '',
          step_into = '',
          step_over = '',
          step_out = '',
          step_back = '',
          run_last = '',
          terminate = '',
          disconnect = '',
        },
      },
      layouts = {
        {
          elements = {
            { id = 'scopes',      size = 0.50 },
            -- { id = 'watches',     size = 0.25 },
            { id = 'breakpoints', size = 0.15 },
            { id = 'stacks',      size = 0.10 },
          },
          position = 'top',
          size = 12,
        },
        {
          elements = {
            { id = 'repl', size = 1.0 },
          },
          position = 'bottom',
          size = 10,
        },
      },
    }

    vim.api.nvim_set_hl(0, 'DapBreakpointSign', { fg = colors.redred })
    vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpointSign' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DiagnosticWarn' })
    vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = colors.brown })
    vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DiagnosticInfo', linehl = 'DapStoppedLine' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DiagnosticHint' })

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
    dap.adapters.python_remote = {
      type = 'server',
      host = '127.0.0.1',
      port = 5680,
    }
    dap.configurations.python = {
      -- {
      --   type = 'python',
      --   request = 'launch',
      --   name = 'Launch file',
      --   program = '${file}',
      --   pythonPath = function()
      --     local venv = vim.fn.getcwd() .. '/.venv/bin/python'
      --     if vim.fn.executable(venv) == 1 then
      --       return venv
      --     end
      --     return vim.fn.exepath 'python3' or vim.fn.exepath 'python'
      --   end,
      -- },
      {
        type = 'python_remote',
        request = 'attach',
        name = 'Attach to debugpy (5680)',
        justMyCode = true,
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = vim.fn.getcwd(),
          },
        },
      },
    }

    -- Scala (adapter registered by nvim-metals via setup_dap())
    dap.configurations.scala = {
      {
        type = 'scala',
        request = 'launch',
        name = 'Run or Test File',
        metals = { runType = 'runOrTestFile' },
      },
      {
        type = 'scala',
        request = 'launch',
        name = 'Test Target',
        metals = { runType = 'testTarget' },
      },
      {
        type = 'scala',
        request = 'attach',
        name = 'Attach to JVM (port 5005)',
        hostName = 'localhost',
        port = 5005,
        buildTarget = 'root',
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
    vim.keymap.set('n', '<leader>de', function()
      dapui.eval(vim.fn.input 'Evaluate: ')
    end, { desc = 'DAP: Evaluate with prompt' })
    vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = 'DAP: Open REPL' })
    vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'DAP: Toggle UI' })
    vim.keymap.set('n', '<leader>dx', dap.terminate, { desc = 'DAP: Terminate' })
  end,
}
