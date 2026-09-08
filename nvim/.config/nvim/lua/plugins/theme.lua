vim.pack.add({
    "https://github.com/webhooked/kanso.nvim",
})

require('kanso').setup({background = {dark = 'ink'}})
vim.cmd.colorscheme("kanso")

