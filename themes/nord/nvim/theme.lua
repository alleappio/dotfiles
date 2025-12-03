return{
    {
        "shaunsingh/nord.nvim",
        name = "nord",
        priority = 1000,
        config = function()
            vim.g.nord_borders=true
            require("nord").set()
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
               options = {
                  theme= 'nord',
                }
            })
        end
    }
}
