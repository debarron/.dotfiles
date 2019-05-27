set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line

" ##########################################
" This is for VIM's look
Plugin 'vim-airline/vim-airline'


" This is for JAVASCRIPT
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'

" Plugin to comment code
Plugin 'tomtom/tcomment_vim'

" Scala and Play Framework
Plugin 'derekwyatt/vim-scala'
Plugin 'gre/play2vim'

" Plugin for latex
Plugin 'lervag/vimtex'

" ########################
" Bring ORG-MODE Here!
Plugin 'vim-scripts/utl.vim'
Plugin 'tpope/vim-repeat'
Plugin 'file:///Users/daniel/.vim/local-plugins/taglist/plugin'
Plugin 'majutsushi/tagbar'
Plugin 'pope/vim-speeddating'
Plugin 'chrisbra/NrrwRgn'
Plugin 'tpope/vim-pathogen'
Plugin 'mattn/calendar-vim'
Plugin 'inkarkat/vim-SyntaxRange'
" >>> ORG
Plugin 'jceb/vim-orgmode' 
" ########################


call vundle#end()            " required
filetype plugin indent on    " required

" Daniel configuration
set number
set t_Co=256
syntax on
set background=dark
colorscheme distinguished
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
set expandtab shiftwidth=2 softtabstop=2 smarttab
" Cursor style
"highlight Cursor guifg=white guibg=black
"highlight iCursor guifg=white guibg=steelblue
"set guicursor=n-v-c:block-Cursor
"set guicursor+=i:ver100-iCursor
"set guicursor+=n-v-c:blinkon0
"set guicursor+=i:blinkwait10
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" JAVASCRIPT
imap <C-c> <CR><Esc>O

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
