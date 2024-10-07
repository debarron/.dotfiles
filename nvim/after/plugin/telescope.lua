local package = require("telescope")
local builtin = require("telescope.builtin")

package.setup {
	defaults = {
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
		},
	},
}
pcall(package.load_extension, 'fzf')


-- Project related search
vim.keymap.set("n", "<leader>pf", builtin.find_files, {desc = "[p]roject [f]iles"})
vim.keymap.set("n", "<C-p>", builtin.git_files, {desc = "Find files in git list"})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")})
end, {desc = "[p]roject [s]earch"})


-- Editor experience
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer]' })

