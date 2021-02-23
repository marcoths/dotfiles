local lsp = require'lspconfig'
local map = function(type, key, value)
        vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

local custom_attach = function(client)
	print("LSP started.");
	vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	require'completion'.on_attach(client)
	map('n','ga','<cmd>lua vim.lsp.buf.code_action()<CR>')
	map('n','g[','<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
	map('n','g]','<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
	map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
	map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
	map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
	map('n','<c-k>','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
	map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
	map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
	map('n','<leader>cr','<cmd>lua vim.lsp.buf.rename()<CR>')
	map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
	map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end

function goimports(timeoutms)
	local context = { source = { organizeImports = true } }
	vim.validate { context = { context, "t", true } }

	local params = vim.lsp.util.make_range_params()
	params.context = context

	local method = "textDocument/codeAction"
	local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
	if resp and resp[1] then
		local result = resp[1].result
		if result and result[1] then
			local edit = result[1].edit
			vim.lsp.util.apply_workspace_edit(edit)
		end
	end

	vim.lsp.buf.formatting()
end
lsp.sumneko_lua.setup{
	on_attach=custom_attach,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT", path = vim.split(package.path, ';'), },
			completion = { keywordSnippet = "Disable", },
			diagnostics = { enable = true, globals = {
				"vim", "describe", "it", "before_each", "after_each" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				}
			}
		}
	}
}
lsp.rust_analyzer.setup{
        on_attach=custom_attach,
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				disabled = {"unresolved-import"},
			}
		}
	}
}
lsp.gopls.setup{
	on_attach=custom_attach,
	cmd = {"gopls", "serve"},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				fillreturns = true,
			},
			staticcheck = true,
		},
	},
}

lsp.tsserver.setup{
	on_attach=custom_attach,
}
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = false,
        update_in_insert = false,
}
)
vim.cmd('autocmd BufWritePre *.go lua vim.lsp.buf.formatting()')
vim.cmd('autocmd BufWritePre *.rs lua vim.lsp.buf.formatting()')
vim.cmd('autocmd BufWritePre *.go lua goimports(1000)')
vim.api.nvim_command('autocmd BufEnter * lua require\'completion\'.on_attach()')
