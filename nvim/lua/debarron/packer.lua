local local_packer = '/site/pack/packer/start/packer.nvim'
local install_path = vim.fn.stdpath 'data' .. local_packer
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
	vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
	-- Package manager
	use 'wbthomason/packer.nvim'

	-- Fuzzy Finder (files, lsp, etc)
	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

	-- Cool colors
	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	})

  --use 'nvim-tree/nvim-web-devicons'

  -- LSP Configuration & Plugins
	--use {'neovim/nvim-lspconfig',
  --  requires = {
  --    -- Automatically install LSPs to stdpath for neovim
  --    'williamboman/mason.nvim',
  --    'williamboman/mason-lspconfig.nvim',

  --    -- Useful status updates for LSP
  --    'j-hui/fidget.nvim',

  --    -- Additional lua configuration, makes nvim stuff amazing
  --    'folke/neodev.nvim',
  --  },
  --}

  ---- Autocompletion
  --use {'hrsh7th/nvim-cmp',
  --  requires = {
  --    'hrsh7th/cmp-nvim-lsp',
  --    'L3MON4D3/LuaSnip',
  --    'saadparwaiz1/cmp_luasnip'
  --  },
  --}

  ---- Highlight, edit, and navigate code
----  use {'nvim-treesitter/nvim-treesitter',
----    run = function()
----      pcall(require('nvim-treesitter.install').update { with_sync = true })
----    end,
----  }

  ---- Additional text objects via treesitter
----  use {'nvim-treesitter/nvim-treesitter-textobjects',
----    after = 'nvim-treesitter',
----  }

  ---- Git related plugins
  --use 'tpope/vim-fugitive'
  --use 'tpope/vim-rhubarb'
  --use 'lewis6991/gitsigns.nvim'

  --use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  --use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  ----use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  --use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  ----use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  --  use 'theprimeagen/harpoon'

  ---- Scala effort in vim
  --use { 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" } }

  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)


