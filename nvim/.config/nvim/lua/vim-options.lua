-- VIM OPTIONS
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set scrolloff=5")

-- REMAPPINGS
vim.g.mapleader=" "
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>o", "o<ESC>k")
vim.keymap.set("n", "<leader>O", "O<ESC>j")

