vim.cmd([[
" neoformat/prettier
let g:neoformat_try_node_exe = 1

" Enable basic formatting when a filetype is not found. Disabled by default.
" Enable alignment
" let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" Have Neoformat only msg when there is an error
let g:neoformat_only_msg_on_error = 1

augroup fmt
  autocmd!
  " autocmd BufWritePre *\.\(js\|jsx\|ts\|tsx\|json\|prettierrc\|vim\|yml\) undojoin | Neoformat
  " autocmd BufWritePre * undojoin | Neoformat " this line errors
"removing Neoformat in favor of lsp foramtter: autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END

" source ~/.config/nvim/plugins/neoformat/json.vim

]])
