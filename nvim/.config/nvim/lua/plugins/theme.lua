vim.pack.add({
    {
        src="https://github.com/ellisonleao/gruvbox.nvim",
        name="gruvbox"
    }
})

require("gruvbox").setup({contrast="hard"})

vim.cmd.colorscheme("gruvbox")

vim.api.nvim_set_hl(0, 'SignColumn', { bg = nil })
