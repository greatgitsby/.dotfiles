vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.mapleader = " "
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.expandtab = true
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 4
vim.o.errorbells = false
vim.o.shiftwidth = 4
vim.o.numberwidth = 4
vim.o.termguicolors = true
vim.o.listchars = "tab:‣\\ ,trail:·,precedes:«,extends:»,eol:¬"
vim.o.list = true
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.signcolumn = 'yes'
vim.o.mouse = 'a'

vim.o.colorcolumn = '80'

-- Turn off arrow keys!
modes = {"c", "n", "i", "v"}
for _, mode in ipairs(modes) do
  vim.api.nvim_set_keymap(mode, "<Left>", "<Nop>", {})
  vim.api.nvim_set_keymap(mode, "<Right>", "<Nop>", {})
  vim.api.nvim_set_keymap(mode, "<Up>", "<Nop>", {})
  vim.api.nvim_set_keymap(mode, "<Down>", "<Nop>", {})
end

