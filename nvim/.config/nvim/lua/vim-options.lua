-- VIM OPTIONS
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set scrolloff=10")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.opt.autoindent = true
vim.cmd("colorscheme gruvbox")
vim.opt.autoread = true
vim.cmd("autocmd VimLeave * set guicursor=a:ver25")

-- REMAPPINGS
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>o", "o<ESC>k")
vim.keymap.set("n", "<leader>O", "O<ESC>j")
