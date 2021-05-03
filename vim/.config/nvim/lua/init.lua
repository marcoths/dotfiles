local vim = vim
local api = vim.api

--- This function is taken from https://github.com/norcalli/nvim_utils
function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup '..group_name)
    api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      api.nvim_command(command)
    end
    api.nvim_command('augroup END')
  end
end


vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')
vim.cmd('set t_Co=16')
vim.cmd([[set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175]])
vim.wo.relativenumber = true
vim.wo.wrap = false
vim.wo.signcolumn = 'yes'
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.wildmenu = true
vim.o.cmdheight = 2
vim.b.tabstop = 4
vim.bo.tabstop = 4
vim.b.softtabstop = 4
vim.bo.softtabstop = 4
vim.b.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.mouse = 'a'
vim.b.expandtab = true
vim.o.termguicolors = true
vim.o.clipboard = 'unnamedplus'
vim.o.background = 'dark'
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.backspace = 'indent,eol,start'
vim.o.shortmess = 'c'
vim.o.ignorecase = true
vim.o.updatetime = 300
vim.wo.cursorline = true
vim.o.autowrite = true

vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.g.terraform_align = 1
vim.g.terraform_fmt_on_save = 1
vim.g.go_def_mapping_enabled = 0


local remap = vim.api.nvim_set_keymap

remap('t', '<Esc>', "<C-\\><C-n>", { noremap = true })
remap("n", "<Up>", ":resize +2<CR>", { noremap = true })
remap("n", "<Down>", ":resize -2<CR>", { noremap = true })
remap("n", "<Left>", ":vertical resize +2<CR>", { noremap = true })
remap("n", "<Right>", ":vertical resize -2<CR>", { noremap = true })
remap("n", "<Leader>n", ":NERDTreeToggle<CR>", { noremap = true })
local autocmds = {
	diagnostics = {
		{ "CursorHold", "*", "lua vim.lsp.diagnostic.show_line_diagnostics()" };
	};
	inlay_hints = {
		{ "CursorMoved", "*", "lua require\'lsp_extensions\'.inlay_hints{ prefix = \'»\', highlight = \"Comment\", enabled = {\"TypeHint\", \"ChainingHint\", \"ParameterHint\" }}"};
	};
};
nvim_create_augroups(autocmds)
require'lsp_config'
require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
	},
}
