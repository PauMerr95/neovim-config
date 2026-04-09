-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')
vim.keymap.set({ 'n' }, '<Leader>nh', ':noh<cr>', {desc = "Remove highlighting"})

-- Mapping for additional navigation
vim.keymap.set({ 'n' }, '<Leader>p', ':Telescope projects<cr>')
vim.keymap.set({ 'n' }, '<C-p>', ':Telescope<cr>')

-- Mapping managment for buffer tabs in normal mode:
vim.keymap.set({ 'n' }, '<]b>', ':bnext<cr>', {desc = "jump to previous buffer"})
vim.keymap.set({ 'n' }, '<[b>', ':bprevious<cr>', {desc = "jump to next buffer"})
vim.keymap.set({ 'n' }, '<Leader>w', ':w<cr>', {desc = "save buffer"})
vim.keymap.set({ 'n' }, '<Leader>q', ':bd<cr>', {desc = "close buffer"})


-- Mapping for Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>ft', ':TodoQuickFix<cr>', { desc = 'Telescope Todos' })

vim.keymap.set('n', '<leader>zf', 'zfi{', { desc = 'Fold inner curly brace' })

