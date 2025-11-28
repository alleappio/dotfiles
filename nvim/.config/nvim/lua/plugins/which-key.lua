return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        delay=2500,
        layout = {
            width = { min = 10, max = 20 },
            spacing = 1,
        },
        sort = "group",
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
