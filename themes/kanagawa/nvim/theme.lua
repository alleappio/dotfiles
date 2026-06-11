vim.pack.add({ 'https://github.com/rebelot/kanagawa.nvim' })
require("kanagawa").setup({
    theme="dragon",
    background = {               -- map the value of 'background' option to a theme
        dark = "dragon",           -- try "dragon" !
        light = "lotus"
    },
})
vim.cmd.colorscheme('kanagawa')

