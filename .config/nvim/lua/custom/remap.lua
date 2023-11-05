vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
--[[
-- come back here in the future to add tmux-sessionizer support.
-- Relevant links:
-- https://github.com/ThePrimeagen/.dotfiles/blob/master/tmux/.tmux.conf#L27
-- https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--]]

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set('n', ':', ';')
vim.keymap.set('n', ';', ':')

vim.keymap.set('n', '<leader>gf', ':e <cfile><CR>')

vim.cmd([[
nnoremap <Leader><CR> :so ~/.config/nvim/init.lua<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>[ :resize +5<CR>
nnoremap <Leader>' :resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>nf :Neoformat<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
"nnoremap <C-j> :tabprevious<CR>
"nnoremap <C-k> :tabnext<CR>

" NERDTree
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <leader>n :NERDTreeToggle<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap [ [<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

inoremap <M-Down> <esc> :m .+1<CR>==
inoremap <M-Up> <esc> :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" add new line without leaving normal mode
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

map <C-w>q <Nop>

" Vim searchhi
nmap n <Plug>(searchhi-n)
nmap N <Plug>(searchhi-N)
" nmap gd <Plug>(searchhi-gd)" already used by coc
nmap gD <Plug>(searchhi-gD)

map * <Plug>(asterisk-*)<Plug>(searchhi-update)
map # <Plug>(asterisk-#)<Plug>(searchhi-update)
map g* <Plug>(asterisk-g*)<Plug>(searchhi-update)
map g# <Plug>(asterisk-g#)<Plug>(searchhi-update)

map z* <Plug>(asterisk-z*)<Plug>(searchhi-update)
map z# <Plug>(asterisk-z#)<Plug>(searchhi-update)
map gz* <Plug>(asterisk-gz*)<Plug>(searchhi-update)
map gz# <Plug>(asterisk-gz#)<Plug>(searchhi-update)

vmap n <Plug>(searchhi-v-n)
vmap N <Plug>(searchhi-v-N)
" vmap gd <Plug>(searchhi-v-gd) already used by coc
vmap gD <Plug>(searchhi-v-gD)

nmap <silent> <C-L> <Plug>(searchhi-clear-all)
vmap <silent> <C-L> <Plug>(searchhi-v-clear-all)

"nmap / <Plug>(searchhi-/)
"nmap ? <Plug>(searchhi-?)

"vmap / <Plug>(searchhi-v-/)
"vmap ? <Plug>(searchhi-v-?)

nnoremap <silent> n n:call HLNext(0.1)<CR>
" Damian Conway's Die Blinkënmatchen: highlight matches
nnoremap <silent> N N:call HLNext(0.1)<CR>

function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction



]])
