vim.g.mapleader = " "

vim.opt.guicursor = ""

vim.opt.nu = true -- line numbers
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.encoding = 'utf8'

vim.opt.path = '**'

-- get pyenv venv provider path e.g. py3nvim
-- local handle = io.popen('pyenv which python')
-- local result = handle:read('*a')
-- handle:close()
-- vim.g.python3_host_prog = result
vim.g.python3_host_prog = '/Users/l/.pyenv/versions/3.11.2/bin/python'

-- vim.o.wildmode = 'longest,list,full'
-- vim.o.wildmode = {'longest', 'list', 'full'}
-- vim.o.wildmenu = true
-- vim.o.wildignore = '*.pyc,*_build/*,**/coverage/*,**/node_modules/*,**/android/*,**/ios/*,**/.git/*'

-- old vim config
vim.cmd([[

set path+=**
" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu

set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set clipboard+=unnamedplus

if executable('rg')
  let g:rg_derive_root='true'
endif


if has ('autocmd')
  augroup zshrc
    autocmd!
    autocmd bufwritepost .zshrc execute ":!source .zshrc" | redraw!
  augroup END

  augroup tmuxconf
    autocmd!
    " source tmux conf every time .tmux.conf is saved.
    autocmd bufwritepost .tmux.conf execute ":!tmux source-file %" | redraw!
    autocmd bufwritepost .tmux.local.conf execute ":!tmux source-file %" | redraw!
  augroup END

"  augroup prettier
"    autocmd!
"    autocmd BufWritePre *\.\(js\|jsx\|ts\|tsx\|json\|prettierrc\|vim\|yml\) Neoformat
"  augroup END

  augroup runByFileType
    autocmd!
    autocmd FileType ts nmap <Leader>r :execute '!ts-node ' . shellescape(expand("%"))

    autocmd FileType js nmap <Leader>r :execute '!node ' . shellescape(expand("%"))<CR>
  augroup END

  augroup yanker
    autocmd!
    autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' |  clip.exe')
  augroup END

  augroup nerdytree
    autocmd!
    " Exit Vim if NERDTree is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  augroup END

"  augroup cocGroup
"    " Highlight the symbol and its references when holding the cursor.
"    autocmd CursorHold * silent call CocActionAsync('highlight')
"  auroup END

  augroup PatchDiffHighlightGroup
    autocmd!
    autocmd FileType diff syntax enable
  augroup END

  augroup NoSimultaneousEdits
    autocmd!
    autocmd SwapExists * let v:swapchoice = 'o'
    autocmd SwapExists * echomsg ErrorMsg
    autocmd SwapExists * echo 'Duplicate edit session (readonly)'
    autocmd SwapExists * echohl None
  augroup END
endif

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd!
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

if has("termguicolors")
  set termguicolors
endif

set exrc " `vim .` -> sources any .vimrc in the dir -> custom executions for various projects. building/running linting/etc
"set guicursor=
"set relativenumber
set nu
"set nohlsearch
set hidden
set noerrorbells
set expandtab
set smartindent
"set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
"set incsearch
"set scrolloff=8
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

" NERDCommenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" PLUGIN-CONFIGS
"source ~/.config/nvim/plugins/coc.vim
"source ~/.config/nvim/plugins/telescope.vim
"source ~/.config/nvim/plugins/airline.vim
"source ~/.config/nvim/plugins/lightline.vim
" source ~/.config/nvim/plugins/tmuxline.vim
"source ~/.config/nvim/plugins/neoformat/neoformat.vim
"source ~/.config/nvim/plugins/markdown.vim
"source ~/.config/nvim/plugins/markdown-preview.vim
"source ~/.config/nvim/plugins/nerdcommenter.vim
" source ~/.config/nvim/plugins/yats.vim
"source ~/.config/nvim/plugins/rainbow.vim
"source ~/.config/nvim/plugins/rust-tools.vim



]])
-- require("telescope")
-- require("airline")
-- require("lightline")
-- require("tmuxline") -- was commented
-- require("neoformat")
-- require("markdown")
-- require("markdown-preview")
-- require("nerdcommenter")
-- require("rust-tools")
