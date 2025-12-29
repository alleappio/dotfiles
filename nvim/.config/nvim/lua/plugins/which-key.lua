return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        delay=2000,
        layout = {
            width = { min = 10, max = 30 },
            spacing = 1,
        },
        preset="helix",
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
