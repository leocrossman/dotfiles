"let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" Activation based on file type
augroup rainbowGroup
  autocmd!
  autocmd FileType ts,js,typescript,javascript RainbowParentheses
augroup END

"augroup RainbowGroup
"au BufEnter * hi TS
"augroup END
