vim.pack.add({
    "http://github.com/maxmx03/solarized.nvim",
})

vim.o.termguicolors = true
vim.o.background = 'dark'
require('solarized').setup(opts)
vim.cmd.colorscheme('solarized')

