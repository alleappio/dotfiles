return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
        local configs = require("ibl").setup({
            scope = {
                enabled=false,
            },
            indent = {
                char = "┆",
            },
            exclude = {
                filetypes = { "dashboard" }
            }
        })
    end,
}
