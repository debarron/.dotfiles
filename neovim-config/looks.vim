set number
set t_Co=256
syntax on
set background=dark
colorscheme distinguished
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
set expandtab shiftwidth=2 softtabstop=2 smarttab

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

