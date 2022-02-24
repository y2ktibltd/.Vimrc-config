syntax on

set nu
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noerrorbells visualbell t_vb=
set nowrap
set smartcase
set noswapfile
set incsearch
set pastetoggle=<F2>
map <F8> :w <CR> :!g++ % -o %< <CR>:vert term ./%<<CR>

call plug#begin()
Plug 'JuliaEditorSupport/julia-vim'
Plug 'davidhalter/jedi-vim'
Plug 'vim-utils/vim-man'
Plug 'bfrg/vim-cpp-modern'
call plug#end()
