local utils = require('utils')
local map = utils.map

map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
map('i', 'jk', '<Esc>')           -- jk to escape
map('n','<leader>cd',':cd %:p:h<CR>:pwd<CR>') -- change pwd to opened file
map('n','<Up>', ':resize +2<CR>')
map('n','<Down>', ':resize -2<CR>')
map('n','<Left>', ':vertical resize +2<CR>')
map('n','<Right>', ':vertical resize -2<CR>')
map('n','gs', '<cmd>Git<CR>', silent)

-- Window movement
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-k>', '<C-w>k')

-- Builtin terminal
map('t', '<Esc>', '<C-\\><C-n><CR>')
map('t', '<M-[>', '<Esc>')
map('t', '<C-v><Esc>', '<Esc>')
map('n', '<leader>t', ':bo 20sp +te<CR>')
