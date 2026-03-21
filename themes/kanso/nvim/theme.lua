return {
    {
        "webhooked/kanso.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("kanso-mist")
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = "kanso",
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
