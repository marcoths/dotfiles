vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')
vim.wo.relativenumber = true
vim.wo.wrap = false
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.wildmenu = true
vim.o.cmdheight = 2
vim.b.tabstop = 4
vim.b.softtabstop = 4
vim.o.mouse = 'a'
vim.b.expandtab = true
vim.o.termguicolors = true
vim.o.clipboard = 'unnamedplus'
vim.o.background = 'dark'
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.shortmess = 'c'
vim.o.ignorecase = true
vim.wo.cursorline = true

require'lsp_config'
