local utils = require('utils')

local cmd = vim.cmd
local indent = 4
local opt = vim.opt

cmd 'syntax enable'
cmd 'filetype plugin indent on'
cmd 'colorscheme gruvbox-material'

opt.hlsearch = false
opt.guicursor = ""
opt.expandtab = true
opt.shiftwidth = indent
opt.smartindent = true
opt.tabstop = indent
opt.hidden = true
opt.ignorecase = true
opt.scrolloff = 4
opt.shiftround = true
opt.smartcase = true
opt.mouse = 'a'
opt.swapfile = false
opt.splitbelow = true
opt.splitright = true
opt.wildmode = {'list', 'full'}
opt.relativenumber = true
opt.number = true
opt.clipboard = 'unnamedplus'

vim.env.RTP=vim.env.XDG_CONFIG_HOME.."/nvim"

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

