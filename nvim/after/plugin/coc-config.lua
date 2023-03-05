-- vim.g.coc_global_extensions = {
--   'coc-json',
--   'coc-tsserver',
--   'coc-html',
--   'coc-prettier',
--   'coc-eslint',
--   'coc-git',
--   'coc-java'
-- }

-- vim.api.nvim_set_keymap("n", "<leader>.", "<Plug>(coc-codeaction)", {})
-- vim.api.nvim_set_keymap("n", "<leader>l", ":CocCommand eslint.executeAutofix<CR>", {})
-- vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})
-- vim.api.nvim_set_keymap("n", "K", ":call CocActionAsync('doHover')<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>rn", "<Plug>(coc-rename)", {})
-- vim.api.nvim_set_keymap("n", "<leader>p", ":CocCommand prettier.formatFile<CR>", {noremap = true})
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300


-- Keybindings 
-- vim.cmd([[
-- function! CheckBackspace() abort
--   let col = col('.') - 1
--   return !col || getline('.')[col - 1]  =~# '\s'
-- endfunction

-- inoremap <silent><expr> <Tab>
--       \ coc#pum#visible() ? coc#pum#next(1) :
--       \ CheckBackspace() ? "\<Tab>" :
--       \ coc#refresh()

-- inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

-- inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
-- inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

-- ]])
