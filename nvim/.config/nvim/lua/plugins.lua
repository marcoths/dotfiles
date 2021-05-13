return require('packer').startup(function()

  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use {
	'nvim-telescope/telescope.nvim',
	requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}

  }

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }

  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-vinegar' }
  use { 'tpope/vim-unimpaired' }
  use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function() 
            require('gitsigns').setup() 
        end
    }

  use {'sainnhe/gruvbox-material'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  end)
