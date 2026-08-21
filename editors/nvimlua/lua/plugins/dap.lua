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
-- │ <leader>dx  │ Disconnect             │
-- ├─────────────┼────────────────────────┤
-- │ <leader>db  │ Toggle breakpoint      │
-- ├─────────────┼────────────────────────┤
-- │ <leader>dB  │ Conditional breakpoint │
-- ├─────────────┼────────────────────────┤
-- │ <leader>dl  │ Clear all breakpoints  │
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
    dap.listeners.after.disconnect['dapui_config'] = dapui.close

    -- Python (debugpy installed via Mason)
    dap.adapters.python_remote_5680 = {
      type = 'server',
      host = '127.0.0.1',
      port = 5680,
    }
    dap.adapters.python_remote_5681 = {
      type = 'server',
      host = '127.0.0.1',
      port = 5681,
    }
    dap.adapters.python_remote_5682 = {
      type = 'server',
      host = '127.0.0.1',
      port = 5682,
    }
    dap.adapters.python_remote_5683 = {
      type = 'server',
      host = '127.0.0.1',
      port = 5683,
    }
    dap.adapters.python_remote_5699 = {
      type = 'server',
      host = '127.0.0.1',
      port = 5699,
    }
    dap.adapters.python_remote_5684 = {
      type = 'server',
      host = '127.0.0.1',
      port = 5684,
    }
    dap.adapters.python_remote_5687 = {
      type = 'server',
      host = '127.0.0.1',
      port = 5687,
    }
    dap.adapters.python_remote_5688 = {
      type = 'server',
      host = '127.0.0.1',
      port = 5688,
    }
    dap.adapters.python_remote_5681_local = {
      type = 'server',
      host = '127.0.0.1',
      port = 5681,
    }
    dap.adapters.python_remote_5686_local = {
      type = 'server',
      host = '127.0.0.1',
      port = 5686,
    }
    dap.adapters.python_remote_6000 = {
      type = 'server',
      host = '127.0.0.1',
      port = 5688,
    }
    dap.configurations.python = {
      {
        type = 'python_remote_5680',
        request = 'attach',
        name = 'Attach to debugpy (5680) - wrapper api',
        justMyCode = true,
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = '/app',
          },
        },
      },
      {
        type = 'python_remote_5681',
        request = 'attach',
        name = 'Attach to debugpy (5681) - wrapper script',
        justMyCode = true,
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = '/app',
          },
        },
      },
      {
        type = 'python_remote_5682',
        request = 'attach',
        name = 'Attach to debugpy (5682) - wrapper test',
        justMyCode = true,
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = '/app',
          },
        },
      },
      {
        type = 'python_remote_5683',
        request = 'attach',
        name = 'Attach to debugpy (5683) - django server',
        justMyCode = true,
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = '/app',
          },
        },
      },
      {
        type = 'python_remote_5683',
        request = 'attach',
        name = 'Attach to debugpy (5683) - django server local',
        justMyCode = true,
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = vim.fn.getcwd(),
          },
        },
      },
      {
        type = 'python_remote_5699',
        request = 'attach',
        name = 'Attach to debugpy (5699) - django server local',
        justMyCode = true,
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = vim.fn.getcwd(),
          },
        },
      },
      {
        type = 'python_remote_6000',
        request = 'attach',
        name = 'Attach to debugpy (6000) - mcp server',
        justMyCode = true,
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = "/app",
          },
        },
      },
      {
        type = 'python_remote_5699',
        request = 'attach',
        name = 'Attach to debugpy (5699) - django server other worker',
        justMyCode = true,
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = '/app',
          },
        },
      },
      {
        type = 'python_remote_5684',
        request = 'attach',
        name = 'Attach to debugpy (5684)',
        justMyCode = true,
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = '/app',
          },
        },
      },
      {
        type = 'python_remote_5687',
        request = 'attach',
        name = 'Attach to debugpy (5687) - svca server',
        justMyCode = true,
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = '/app',
          },
        },
      },
      {
        type = 'python_remote_5688',
        request = 'attach',
        name = 'Attach to debugpy (5688) - svcb server',
        justMyCode = true,
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = '/app',
          },
        },
      },
      {
        type = 'python_remote_5681_local',
        request = 'attach',
        name = 'Attach to debugpy cwd (5681)',
        justMyCode = true,
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = vim.fn.getcwd(),
          },
        },
      },
      {
        type = 'python_remote_5686_local',
        request = 'attach',
        name = 'Attach to debugpy cwd (5686) - e2e tests',
        justMyCode = true,
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = vim.fn.getcwd(),
          },
        },
      },
    }

    -- Kotlin (kotlin-debug-adapter installed via Mason)
    dap.adapters.kotlin = {
      type = 'executable',
      command = vim.fn.stdpath('data') .. '/mason/bin/kotlin-debug-adapter',
    }
    dap.configurations.kotlin = {
      {
        type = 'kotlin',
        request = 'attach',
        name = 'Attach to Kotlin JVM (port 5005)',
        hostName = 'localhost',
        port = 5005,
        timeout = 10000,
        projectRoot = vim.fn.getcwd(),
        sourcePaths = { vim.fn.getcwd() .. '/src' },
      },
      {
        type = 'kotlin',
        request = 'launch',
        name = 'Launch Kotlin (main class)',
        projectRoot = vim.fn.getcwd(),
        mainClass = function()
          return vim.fn.input('Main class: ')
        end,
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
    vim.keymap.set('n', '<leader>dd', dap.continue, { desc = 'DAP: Launch / continue' })
    vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = 'DAP: Open REPL' })
    vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'DAP: Toggle UI' })
    vim.keymap.set('n', '<leader>dc', dap.clear_breakpoints, { desc = 'DAP: Clear all breakpoints' })
    vim.keymap.set('n', '<leader>dx', function()
      dap.disconnect({ terminateDebuggee = false })
      for _, s in pairs(dap.sessions()) do
        s:close()
      end
      dapui.close()
      vim.notify('DAP session closed', vim.log.levels.INFO)
    end, { desc = 'DAP: Disconnect (keep process)' })
  end,
}
