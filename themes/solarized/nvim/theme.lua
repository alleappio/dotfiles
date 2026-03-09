return{
    {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {},
    config = function(_, opts)
        vim.o.termguicolors = true
        vim.o.background = 'dark'
        require('solarized').setup(opts)
        vim.cmd.colorscheme 'solarized'
      end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
               options = {
                  theme = 'solarized_dark',
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
