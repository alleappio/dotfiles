return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme rose-pine")
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = "rose-pine",
                    section_separators = '', 
                    component_separators = '' 
                },

                sections = { 
                    lualine_a = { {'mode', fmt = function(str) return str:sub(1,1) end} }
                }
            })
        end
    }
}
