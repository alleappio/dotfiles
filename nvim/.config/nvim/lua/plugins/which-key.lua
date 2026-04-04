vim.pack.add({
    "https://github.com/folke/which-key.nvim",
})

require("which-key").setup({

    delay=2000,
    layout = {
        width = { min = 10, max = 30 },
        spacing = 1,
    },
    preset="helix",
})
