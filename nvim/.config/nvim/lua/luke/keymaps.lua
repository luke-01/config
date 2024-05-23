vim.keymap.set('n', '<space>', '<nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to window below' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to window above' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

vim.keymap.set('n', '<leader><leader>', '<cmd>nohl<CR>', { desc = 'Unhighlight search results' })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Switch from terminal mode to normal mode' })

vim.keymap.set('n', '}d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '{d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })

