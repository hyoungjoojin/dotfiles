vim.keymap.set('n', '<leader>q', ':quit<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save' })
vim.keymap.set('n', '<leader>c', ':bd<CR>', { desc = 'Close current buffer' })

vim.keymap.set('n', '<leader>tt', ':terminal<CR>', { desc = 'Open terminal' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<leader>-', ':vsplit<CR>', { desc = 'Split vertically' })
vim.keymap.set('n', '<leader>_', ':split<CR>', { desc = 'Split horizontally' })

vim.keymap.set('n', '<leader>bl', ':bnext<CR>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '<leader>bh', ':bprev<CR>', { desc = 'Go to previous buffer' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move left' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move right' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move down' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move up' })

vim.keymap.set('n', '<leader>ft', 'za', { desc = 'Toggle folding' })
vim.keymap.set('n', '<leader>fO', 'zR', { desc = 'Open all folds' })
vim.keymap.set('n', '<leader>fC', 'zM', { desc = 'Close all folds' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
