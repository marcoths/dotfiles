local lualine = require 'lualine'

local config = {
    options = {
        theme = 'gruvbox'
    },
    extensions = {'fugitive'}
}

lualine.setup(config)
