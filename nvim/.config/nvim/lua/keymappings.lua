local utils = require('utils')

utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>')           -- jk to escape
utils.map('n','<leader>cd',':cd %:p:h<CR>:pwd<CR>') -- change pwd to opened file
