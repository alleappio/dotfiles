-- VIM OPTIONS
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set scrolloff=15")
vim.cmd("set shiftwidth=4 smarttab")
vim.cmd("set expandtab")
vim.cmd("set tabstop=8 softtabstop=0")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.autoindent = true
vim.opt.autoread = true
vim.cmd("autocmd VimLeave * set guicursor=a:ver25")
vim.opt.termguicolors = true
vim.o.background = "dark"
vim.opt.showtabline = 2
vim.opt.laststatus = 3
vim.opt.wrap=false

local severity = vim.diagnostic.severity
vim.diagnostic.enable = true
vim.diagnostic.config({
    signs = {
        text = {
            [severity.ERROR] = "",
            [severity.WARN] = "",
            [severity.INFO] = "",
            [severity.HINT] = "",
        },
    },
})
