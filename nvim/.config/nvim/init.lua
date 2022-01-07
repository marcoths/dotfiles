require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.colorscheme")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.gitsigns")
require("user.nvim-tree")
require("user.null-ls")
require("user.whichkey")
require("user.bufferline")
require("user.project")

--vim.g.indentLine_char = '⦙'
--execute('autocmd BufWritePre *.go lua vim.lsp.buf.formatting()')
--execute('autocmd BufWritePre *.go lua goimports(1000)')

-- Format on save
--execute("autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()")
-- Import on save
--execute("autocmd BufWritePre *.go :silent! lua require('go.format').goimport()")
