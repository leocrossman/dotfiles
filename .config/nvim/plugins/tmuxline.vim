"let g:airline#extensions#tmuxline#enabled = 1

" Tmuxline vim_statusline_3
"let g:tmuxline_preset='lightline'

augroup TmuxlineGroup
  autocmd!
  autocmd InsertEnter * Tmuxline lightline_insert
  autocmd InsertLeave * call NormalEnter()
  autocmd CursorHold * Tmuxline lightline
augroup END

function! VisualEnter()
  set updatetime=0
  Tmuxline lightline_visual
endfunction

function! NormalEnter()
  set updatetime=0
  Tmuxline lightline
endfunction

vnoremap <silent> <expr> <SID>VisualEnter VisualEnter()
nnoremap <silent> <script> v v<SID>VisualEnter
nnoremap <silent> <script> V V<SID>VisualEnter
nnoremap <silent> <script> <C-v> <C-v><SID>VisualEnter

vnoremap <silent> <expr> <SID>NormalEnter()
vnoremap <silent> <script> <Esc> <Esc><SID>NormalEnter
