vim.pack.add({
    "http://github.com/folke/tokyonight.nvim",
})

require("tokyonight").setup({
    -- use the night style
    style = "night",
})
vim.cmd.colorscheme('tokyonight')

