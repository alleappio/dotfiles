return {
    {
        'ellisonleao/gruvbox.nvim',
        name = 'gruvbox',
        lazy = false,
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                terminal_colors = true,
                contrast = "hard",
            })
            vim.cmd.colorscheme("gruvbox")
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = "gruvbox",
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
