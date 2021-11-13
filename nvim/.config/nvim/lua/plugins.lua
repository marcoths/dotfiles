return require('packer').startup(function()

  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use {
	'nvim-telescope/telescope.nvim',
	requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}

  }
  use { 'nvim-telescope/telescope-fzy-native.nvim' }

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }

  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-vinegar' }
  use { 'tpope/vim-unimpaired' }
  use { 'tpope/vim-projectionist' }
  use { 'junegunn/gv.vim' }

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
  use {'nvim-treesitter/nvim-treesitter-textobjects'}
  use {'hrsh7th/nvim-compe'}
  use {'hrsh7th/vim-vsnip'}
  use {'hrsh7th/vim-vsnip-integ'}
  use {'ray-x/lsp_signature.nvim'}
  use {'radenling/vim-dispatch-neovim'}
  use {'tpope/vim-dispatch'}
  use {'hashivim/vim-terraform'}
  use {'onsails/lspkind-nvim'}
  use {'kosayoda/nvim-lightbulb'}
  use {'hoob3rt/lualine.nvim'}
  use {'kyazdani42/nvim-web-devicons'}
  use {'ryanoasis/vim-devicons'}
  use {'Yggdroot/indentLine'}
  use {'sudormrfbin/cheatsheet.nvim',
      requires = {
          {'nvim-telescope/telescope.nvim'},
          {'nvim-lua/popup.nvim'},
          {'nvim-lua/plenary.nvim'},
      }
  }
  use {'ray-x/go.nvim',
        requires = {
            {'nvim-treesitter/nvim-treesitter'},
            {'nvim-treesitter-textobjects/nvim-treesitter-textobjects'},
        }
 }
  end)
