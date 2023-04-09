vim.cmd([[
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters={
      \ 'javascript': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
      \ 'javascriptreact': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
      \ 'typescriptreact': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
      \}
]])
