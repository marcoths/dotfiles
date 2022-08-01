local util = require("lspconfig/util")
local lastRootPath = nil
local gopath = os.getenv("GOPATH")
if gopath == nil then
	gopath = ""
end

local gopathmod = gopath .. "/pkg/mod"
return {
	root_dir = function(fname)
		local fullpath = vim.fn.expand(fname, ":p")
		if string.find(fullpath, gopathmod) and lastRootPath ~= nil then
			return lastRootPath
		end
		lastRootPath = util.root_pattern("go.mod", ".git")(fname)
		return lastRootPath
	end
}
