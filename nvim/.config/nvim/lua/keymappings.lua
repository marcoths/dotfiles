local utils = require('utils')
local map = utils.map

map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
map('n', '<BS>', '<C-^>')
map('i', 'jk', '<Esc>')           -- jk to escape
map('n','<leader>cd',':cd %:p:h<CR>:pwd<CR>') -- change pwd to opened file
map('n','<Up>', ':resize +2<CR>')
map('n','<Down>', ':resize -2<CR>')
map('n','<Left>', ':vertical resize +2<CR>')
map('n','<Right>', ':vertical resize -2<CR>')
map('n','gs', '<cmd>Git<CR>', silent)
map('', '<leader>c', '"+y') -- copy to clipboard in normal, visual, select and operator mode

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


map('n', '<leader>ps', ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep for > ')})<CR>")
map('n', '<C-p>', ":lua require('telescope.builtin').git_files()<CR>")
map('n', '<leader>gc', ":lua require('telescope.builtin').git_branches()<CR>")
map('n', '<leader>vrc', ":lua require('config.telescope').search_dotfiles()<CR>")

