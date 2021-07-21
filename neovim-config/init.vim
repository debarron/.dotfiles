syntax on

set noerrorbells
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase

set noswapfile
set nobackup
set undodir=~/.config/nvim-undodir
set undofile
set incsearch

set colorcolumn=90
highlight ColorColumn ctermbg=0 guibg=lightgrey


set nocompatible              " be iMproved, required
filetype off                  " required

source ~/.config/nvim/plugins.vim
"source ~/.config/nvim/looks.vim


nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<CR>
"<bar> :vertical resize 30<CR>


let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

set guicursor=

