return {
    {
        'sainnhe/gruvbox-material',
        lazy = false,
        priority = 1000,
        dependencies = {'nvim-treesitter/nvim-treesitter'},
        config = function()
            vim.g.gruvbox_material_background = "hard"
            vim.g.gruvbox_material_foreground = "material"
            vim.cmd.colorscheme("gruvbox-material")
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = "gruvbox-material",
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
