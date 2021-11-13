-- Map leader to comma
vim.g.mapleader = ','

local fn = vim.fn
local execute = vim.api.nvim_command

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)

end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua


-- Install plugins
require('plugins')

require('config')
require('settings')
require('keymappings')
require('lang')
vim.g.indentLine_char = '⦙'
--execute('autocmd BufWritePre *.go lua vim.lsp.buf.formatting()')
--execute('autocmd BufWritePre *.go lua goimports(1000)')
-- Format on save
execute("autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()")
-- Import on save
execute("autocmd BufWritePre *.go :silent! lua require('go.format').goimport()")
