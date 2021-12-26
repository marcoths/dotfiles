local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}
-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  use {
	'nvim-telescope/telescope.nvim',
	requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}

  }
  use "windwp/nvim-autopairs"

  use { 'nvim-telescope/telescope-fzy-native.nvim' }

  -- LSP and completion
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim"
  use {'hrsh7th/nvim-cmp'}
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-nvim-lsp" -- LSP completions for cmp
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions

  use { 'tpope/vim-fugitive' }
  use { 'junegunn/gv.vim' } -- Git commit browser
  use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup()
        end
    }

  use "sainnhe/gruvbox-material"
  use "folke/tokyonight.nvim"
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-textobjects'


  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  use {'ray-x/lsp_signature.nvim'}
  use {'radenling/vim-dispatch-neovim'}
  use {'tpope/vim-dispatch'}
  use {'hashivim/vim-terraform'}
  use {'onsails/lspkind-nvim'}
  use {'kosayoda/nvim-lightbulb'}
  use {'hoob3rt/lualine.nvim'}
  use {'kyazdani42/nvim-web-devicons'}
  use {'ryanoasis/vim-devicons'}
  use {'folke/lsp-colors.nvim'}
  use {'Yggdroot/indentLine'}
  use {'sudormrfbin/cheatsheet.nvim',
      requires = {
          {'nvim-telescope/telescope.nvim'},
          {'nvim-lua/popup.nvim'},
          {'nvim-lua/plenary.nvim'},
      }
  }
  use {
     'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup {} end
  }
  use {'github/copilot.vim'}
  use "moll/vim-bbye"
  use "jose-elias-alvarez/null-ls.nvim"
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
