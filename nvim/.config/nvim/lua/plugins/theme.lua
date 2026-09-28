vim.pack.add({
    {
        src="https://github.com/ellisonleao/gruvbox.nvim",
        name="gruvbox"
    }
})

require("gruvbox").setup({contrast="hard"})

vim.cmd.colorscheme("gruvbox")

