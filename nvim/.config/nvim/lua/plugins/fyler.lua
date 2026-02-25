return {
    "A7Lavinraj/fyler.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false, -- Necessary for `default_explorer` to work properly
    opts = {},
    config = function()
        require("fyler").setup({
            integrations = {
              icon = "nvim_web_devicons", -- nvim-tree/nvim-web-devicons
            },
            views = {
                finder = {
                    default_explorer = true,
                        win = {
                        kinds = {
                            split_left = {
                                width = "15%",
                            },
                        },
                    },
                },
            },
        })
    end
}
