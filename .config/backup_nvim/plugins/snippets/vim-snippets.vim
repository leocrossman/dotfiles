if has ('autocmd')
  augroup SnippetGroup
    autocmd!
    autocmd FileType js UltiSnipsAddFiletypes javascript-jasmine
  augroup END
endif

source ~/.config/nvim/plugins/snippets/ultisnips.vim
"source ~/.config/nvim/plugins/snippets/javascript/javascript.snippets
