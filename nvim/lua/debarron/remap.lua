vim.g.mapleader = ' '
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


vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
