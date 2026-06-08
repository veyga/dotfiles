vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local opts = { noremap = true, silent = true }

-- delete single character without copying into register
-- vim.keymap.set('n', 'x', '"_x', opts)

-- Buffer navigation
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)

-- Window navigation
vim.keymap.set('n', '<A-h>', '<C-w>h', opts)
vim.keymap.set('n', '<A-j>', '<C-w>j', opts)
vim.keymap.set('n', '<A-k>', '<C-w>k', opts)
vim.keymap.set('n', '<A-l>', '<C-w>l', opts)
vim.keymap.set('t', '<A-k>', '<C-\\><C-N><C-w>k', opts)
vim.keymap.set('t', '<A-l>', '<C-\\><C-N><C-w>l', opts)

-- Move lines up/down in visual mode
vim.keymap.set('v', '<M-j>', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', '<M-k>', ":m '<-2<CR>gv=gv", opts)

-- Resize windows
vim.keymap.set('n', '<A-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<A-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<A-Right>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<A-Left>', ':vertical resize -2<CR>', opts)

-- Close buffer without closing window
vim.keymap.set('n', '<M-w>', ':bp<cr>:bd #<cr>', opts)
-- Close window
vim.keymap.set('n', '<M-W>', ':close<cr>', opts)

-- Column widths
vim.keymap.set('n', '<leader>1', ':set columns=91<cr>', opts)
vim.keymap.set('n', '<leader>2', ':set columns=180<cr>', opts)

-- Yank cwd to clipboard
vim.keymap.set('n', '<M-y>', ':let @+=getcwd()<cr>', opts)

-- -- Show syntax stack under cursor
-- vim.keymap.set('n', '<leader>so', function()
--   local stack = vim.fn.synstack(vim.fn.line '.', vim.fn.col '.')
--   print(vim.inspect(vim.fn.map(stack, 'synIDattr(v:val, "name")')))
-- end, opts)
-- Show the highlight stack under the cursor (treesitter captures, syntax
-- groups, and LSP semantic tokens) — Same as running :Inspect.
vim.keymap.set('n', '<leader>so', vim.show_pos, { desc = 'Show highlight groups under cursor' })

-- Comment toggle
vim.keymap.set('n', '<leader>/', '<Plug>(comment_toggle_linewise_current)', opts)
vim.keymap.set('v', '<leader>/', '<Plug>(comment_toggle_linewise_visual)', opts)

-- Format using none-ls (ruff for Python, prettier for html/json/yaml, etc.)
-- Falls back to any available LSP formatter (e.g. metals for Scala)
vim.keymap.set('n', '<leader>F', function()
  vim.lsp.buf.format {
    async = true,
    filter = function(client)
      return client.name == 'null-ls' or client.name == 'metals'
    end,
  }
end, opts)

-- Diagnostics
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Prev diagnostic' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Next diagnostic' })

vim.keymap.set(
  'n',
  '<leader>l',
  vim.diagnostic.open_float,
  { desc = 'Open floating diagnostic' }
)

vim.keymap.set('n', '<leader>q', function()
  -- If a location list window is already open, close it; otherwise populate
  -- it with diagnostics and open it.
  local loclist = vim.fn.getloclist(0, { winid = 0 })
  if loclist.winid ~= 0 then
    vim.cmd.lclose()
  else
    vim.diagnostic.setloclist()
  end
end, { desc = 'Toggle diagnostics list' })
