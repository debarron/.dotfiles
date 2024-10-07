require("debarron.remap")
require("debarron.style")
require("debarron.packer")



---- Install packer
--local local_packer = '/site/pack/packer/start/packer.nvim'
--local install_path = vim.fn.stdpath 'data' .. local_packer
--local is_bootstrap = false
--
--if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
--	is_bootstrap = true
--	vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
--	vim.cmd [[packadd packer.nvim]]
--end
--
--require('packer').startup(function(use)
--	-- Package manager
--	use 'wbthomason/packer.nvim'
--
--  use 'nvim-tree/nvim-web-devicons'
--
--  -- LSP Configuration & Plugins
--	use {'neovim/nvim-lspconfig',
--    requires = {
--      -- Automatically install LSPs to stdpath for neovim
--      'williamboman/mason.nvim',
--      'williamboman/mason-lspconfig.nvim',
--
--      -- Useful status updates for LSP
--      'j-hui/fidget.nvim',
--
--      -- Additional lua configuration, makes nvim stuff amazing
--      'folke/neodev.nvim',
--    },
--  }
--
--  -- Autocompletion
--  use {'hrsh7th/nvim-cmp',
--    requires = {
--      'hrsh7th/cmp-nvim-lsp',
--      'L3MON4D3/LuaSnip',
--      'saadparwaiz1/cmp_luasnip'
--    },
--  }
--
--  -- Highlight, edit, and navigate code
----  use {'nvim-treesitter/nvim-treesitter',
----    run = function()
----      pcall(require('nvim-treesitter.install').update { with_sync = true })
----    end,
----  }
--
--  -- Additional text objects via treesitter
----  use {'nvim-treesitter/nvim-treesitter-textobjects',
----    after = 'nvim-treesitter',
----  }
--
--  -- Git related plugins
--  use 'tpope/vim-fugitive'
--  use 'tpope/vim-rhubarb'
--  use 'lewis6991/gitsigns.nvim'
--
--  use 'navarasu/onedark.nvim' -- Theme inspired by Atom
--  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
--  --use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
--  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
--  --use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
--
--  -- Fuzzy Finder (files, lsp, etc)
--  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
--
--  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
--  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
--
--  use 'theprimeagen/harpoon'
--
--  -- Scala effort in vim
--  use { 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" } }
--
--  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
--  local has_plugins, plugins = pcall(require, 'custom.plugins')
--  if has_plugins then
--    plugins(use)
--  end
--
--  if is_bootstrap then
--    require('packer').sync()
--  end
--end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
	print '=================================='
	print '    Plugins are being installed'
	print '    Wait until Packer completes,'
	print '       then restart nvim'
	print '=================================='
	return
end


-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
	group = packer_group,
	pattern = vim.fn.expand '$MYVIMRC',
})

-- [[ Setting options ]]
-- See `:help vim.o`
-- Commands


vim.g.maplocalleader = ' '
vim.o.hlsearch = false
vim.wo.number = true
vim.o.breakindent = true
vim.o.undofile = false
vim.o.ignorecase = true
vim.o.smartcase = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme onedark]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
	options = {
		icons_enabled = false,
		theme = 'onedark',
		component_separators = '|',
		section_separators = '',
	},
}

-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
--require('indent_blankline').setup {
--	char = '┊',
--	show_trailing_blankline_indent = false,
--}

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
	signs = {
		add = { text = '+' },
		change = { text = '~' },
		delete = { text = '_' },
		topdelete = { text = '‾' },
		changedelete = { text = '~' },
	},
}

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
--require('nvim-treesitter.configs').setup {
--	-- Add languages to be installed here that you want installed for treesitter
--	ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'vim', 'scala' },
--
--	highlight = { enable = true },
--	indent = { enable = true, disable = { 'python' } },
--	incremental_selection = {
--		enable = true,
--		keymaps = {
--			init_selection = '<c-space>',
--			node_incremental = '<c-space>',
--			scope_incremental = '<c-s>',
--			node_decremental = '<c-backspace>',
--		},
--	},
--	textobjects = {
--		select = {
--			enable = true,
--			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
--			keymaps = {
--				-- You can use the capture groups defined in textobjects.scm
--				['aa'] = '@parameter.outer',
--				['ia'] = '@parameter.inner',
--				['af'] = '@function.outer',
--				['if'] = '@function.inner',
--				['ac'] = '@class.outer',
--				['ic'] = '@class.inner',
--			},
--		},
--		move = {
--			enable = true,
--			set_jumps = true, -- whether to set jumps in the jumplist
--			goto_next_start = {
--				[']m'] = '@function.outer',
--				[']]'] = '@class.outer',
--			},
--			goto_next_end = {
--				[']M'] = '@function.outer',
--				[']['] = '@class.outer',
--			},
--			goto_previous_start = {
--				['[m'] = '@function.outer',
--				['[['] = '@class.outer',
--			},
--			goto_previous_end = {
--				['[M'] = '@function.outer',
--				['[]'] = '@class.outer',
--			},
--		},
--		swap = {
--			enable = true,
--			swap_next = {
--				['<leader>a'] = '@parameter.inner',
--			},
--			swap_previous = {
--				['<leader>A'] = '@parameter.inner',
--			},
--		},
--	},
--}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
	-- NOTE: Remember that lua is a real programming language, and as such it is possible
	-- to define small helper and utility functions so you don't have to repeat yourself
	-- many times.
	--
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap('<leader>cn', vim.lsp.buf.rename, '[R]e[n]ame')
	nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

	nmap('<leader>cd', vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap('<leaded>cD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap('<leader>cn', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	nmap('<leader>cN', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
	nmap('<leader>ct', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nmap('<leader>cs', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

	-- See `:help K` for why this keymap
	nmap('<leader>ci', vim.lsp.buf.hover, 'Hover Documentation')
	nmap('<leader>ch', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Lesser used LSP functionality
  nmap('<leader>cw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
	nmap('<leader>cA', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nmap('<leader>cr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap('<leader>cl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
	-- clangd = {},
	-- gopls = {},
	-- pyright = {},
	-- rust_analyzer = {},
	-- tsserver = {},

  --ruff_lsp = {},
  --pyright = {},
  jedi_language_server = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

-- Setup neovim lua configuration
require('neodev').setup()
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
	function(server_name)
		require('lspconfig')[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		}
	end,
}

-- Turn on lsp status information
require('fidget').setup()

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
}

require('deconfig')

-- Keymaps
-- Explorer
--vim.g.netrw_winsize = 25
--vim.keymap.set('n', '<leader>eo', ':Ex<CR>', { desc = '[E]xplorer [O]pen' })
--vim.keymap.set('n', '<leader>ec', ':Rex<CR>', {desc = '[E]xplorer [C]lose'})
--vim.keymap.set('n', '<leader>`', ':Lexplore<CR>', {desc = 'Explorer quick look'})
--
---- Windows
--vim.keymap.set('n', '<leader>w[', ':wincmd h<CR>')
--vim.keymap.set('n', '<leader>w]', ':wincmd l<CR>')
--vim.keymap.set('n', '<leader>wj', ':wincmd j<CR>')
--vim.keymap.set('n', '<leader>wk', ':wincmd k<CR>')
--vim.keymap.set('n', '<leader>ws', ':wincmd s<CR>')
--vim.keymap.set('n', '<leader>ww', ':vsplit<CR>')
--vim.keymap.set('n', '<leader>wq', ':wincmd q<CR>')
--vim.keymap.set('n', '<leader>w`', ':wincmd x<CR>')
--vim.keymap.set('n', '<leader>wt', ':wincmd T<CR>')
--
--
----TABS
--vim.keymap.set('n', '<leader>t[', ':tabn -<CR>')
--vim.keymap.set('n', '<leader>t]', ':tabn +<CR>')
--vim.keymap.set('n', '<leader>tt', ':tabnew<CR>')
--vim.keymap.set('n', '<leader>tq', ':tabc<CR>')
-- Keymaps for telescope
--> Find in current buffer
--> Find in old files
--> Find in paths?
--> Find in tracked files (harpoon)


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
