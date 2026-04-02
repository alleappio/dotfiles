vim.pack.add({
    "http://github.com/shaunsingh/nord.nvim",
})

vim.g.nord_borders=true
require("nord").set()
vim.cmd.colorscheme('nord')

