return{
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        priority = 1000,
        config = function()
            require('kanagawa').setup({
                theme="wave",
            })
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
               options = {
                  theme = 'kanagawa',
                }
            })
        end
    }
}
