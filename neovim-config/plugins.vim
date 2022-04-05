
" set the runtime path to include Vundle and initialize
call plug#begin('~/.config/nvim/plugged')

" They stay
Plug 'tpope/vim-fugitive'			                  " Manage GIT commands 	*
Plug 'vim-airline/vim-airline'			            " Status bar pluggin
Plug 'vim-utils/vim-man'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'lyuts/vim-rtags'
Plug 'ctrlpvim/ctrlp.vim'			                  " Fuzzy search		*

"Plug 'git@github.com:Vallaroic/YouCompleteMe.git'
Plug 'neoclide/coc.nvim', {'branch': 'release'}	" Leave this but try to install coc-metals later

" Color-schemes
Plug 'junegunn/limelight.vim'			              " Select current line
Plug 'vim-airline/vim-airline-themes'
Plug 'ajmwagar/vim-deus'

" Tools
Plug 'tomtom/tcomment_vim'			                " Plug to comment code 	*
Plug '907th/vim-auto-save'			                " Based on filetype    	*--
Plug 'vim-scripts/utl.vim'                      " --
Plug 'majutsushi/tagbar'			                  " Tagbar for elements	*
Plug 'junegunn/goyo.vim'			                  " Writing in focus mode	*
Plug 'neovim-remote/nvr'

" Syntax
Plug 'octol/vim-cpp-enhanced-highlight'		      " C++ syntax-highlight 
Plug 'nathanaelkane/vim-indent-guides'		      " Indent lines cleverly
Plug 'Raimondi/delimitMate'			                " Add closing brackets
Plug 'derekwyatt/vim-scala'			                " Scala and Play Framework
Plug 'gre/play2vim'
Plug 'lervag/vimtex'			                      " Plug for latex

" Documentations
Plug 'rizzatti/dash.vim'
Plug 'jceb/vim-orgmode' 
" Plug 'chrisbra/NrrwRgn'

call plug#end()            " required

" Try a new background
colorscheme gruvbox
set background=dark

" airline-config
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" C++-config
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let c_no_curly_error = 1
" if above is slow run: let g:cpp_experimental_template_highlight = 1

" Indent lines enabled
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" Closing brackets and parethesis
let delimitMate_expand_cr = 1

" Tagbar map
"nmap <F8> :TagbarToggle<CR>

" Goyo and limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'


" " Autosave for latex
" let g:auto_save = 0
" augroup ft_tex
"   au!
"   au FileType tex let b:auto_save = 1
"   au FileType bib let b:auto_save = 1
"   au FileType plaintex let b:auto_save = 1
" augroup END
" 
