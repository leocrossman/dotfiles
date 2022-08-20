
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

set wrap
set linebreak
set nolist
set textwidth=0

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set exrc " `vim .` -> sources any .vimrc in the dir -> custom executions for various projects. building/running linting/etc
"set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set expandtab
set smartindent
"set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes
"set guicursor=i:block

" give more space for displaying messages
set cmdheight=2

" having longer update time (default is 4000ms = 4s) leads to noticable delays and poor user experience
set updatetime=50

" dont pass messages to |ins-completion-menu|
set shortmess+=c

