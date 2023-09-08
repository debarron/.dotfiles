-- Install packer
-- Enable telescope fzf native, if installed
--
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Keymaps
-- Explorer
vim.g.netrw_winsize = 25
vim.keymap.set('n', '<leader>eo', ':Ex<CR>', { desc = '[E]xplorer [O]pen' })
vim.keymap.set('n', '<leader>ec', ':Rex<CR>', {desc = '[E]xplorer [C]lose'})
vim.keymap.set('n', '<leader>`', ':Lexplore<CR>', {desc = 'Explorer quick look'})

-- Windows
vim.keymap.set('n', '<leader>w[', ':wincmd h<CR>')
vim.keymap.set('n', '<leader>w]', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>wj', ':wincmd j<CR>')
vim.keymap.set('n', '<leader>wk', ':wincmd k<CR>')
vim.keymap.set('n', '<leader>ws', ':wincmd s<CR>')
vim.keymap.set('n', '<leader>ww', ':vsplit<CR>')
vim.keymap.set('n', '<leader>wq', ':wincmd q<CR>')
vim.keymap.set('n', '<leader>w`', ':wincmd x<CR>')
vim.keymap.set('n', '<leader>wt', ':wincmd T<CR>')


--TABS
vim.keymap.set('n', '<leader>t[', ':tabn -<CR>')
vim.keymap.set('n', '<leader>t]', ':tabn +<CR>')
vim.keymap.set('n', '<leader>tt', ':tabnew<CR>')
vim.keymap.set('n', '<leader>tq', ':tabc<CR>')
-- Keymaps for telescope
--> Find in current buffer
--> Find in old files
--> Find in paths?
--> Find in tracked files (harpoon)


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
