
set nocompatible              " be iMproved, required
filetype off                  " required

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/looks.vim

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

autocmd VimLeave * call system('printf "\e[5 q" > $TTY')
