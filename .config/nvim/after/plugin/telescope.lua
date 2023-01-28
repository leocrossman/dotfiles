local builtin = require('telescope.builtin')

-- project find
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- GFiles
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- project search
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.cmd([[
" Find files using Telescope command-line sugar
"nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fd <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fr <cmd>Telescope find_files hidden=true cwd=~<cr>
]])
