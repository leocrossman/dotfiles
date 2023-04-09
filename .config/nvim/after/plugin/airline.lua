-- vim.cmd([[
-- let g:airline_powerline_fonts=1
-- " Automatically displays all buffers when there's only one tab open.
-- let g:airline#extensions#tabline#enabled = 1
-- let g:airline#extensions#tabline#show_close_button = 0

-- let g:airline#extensions#tabline#formatter = 'jsformatter'

-- let g:airline_statusline_ontop=0


-- "let g:airline_theme='base16'
-- let g:airline_theme='molokai'

-- " bind Shift + h to hide status bar
-- let s:hidden_all = 0
-- function! ToggleHiddenAll()
    -- if s:hidden_all  == 0
        -- let s:hidden_all = 1
        -- set noshowmode
        -- set noruler
        -- set laststatus=0
        -- set noshowcmd
    -- else
        -- let s:hidden_all = 0
        -- set showmode
        -- set ruler
        -- set laststatus=2
        -- set showcmd
    -- endif
-- endfunction

-- nnoremap <S-h> :call ToggleHiddenAll()<CR>

-- "uncomment to hide status bar if wanted...
-- "augroup ToggleStatusLine
  -- "autocmd!
  -- "autocmd BufReadPost * call ToggleHiddenAll()
-- "augroup END
-- ]])
