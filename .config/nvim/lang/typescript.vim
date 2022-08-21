"augroup SyntaxSettings
"autocmd!
"autocmd BufNewFile,BufRead *.ts set filetype=typescript
"augroup END

augroup TypescriptHighlight
  autocmd!
  autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
augroup END
