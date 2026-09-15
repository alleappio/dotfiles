vim.pack.add({
    "https://github.com/ellisonleao/gruvbox.nvim",
})

require("gruvbox").setup({contrast="hard"})
vim.cmd.colorscheme("gruvbox")

