return{
    {
        "navarasu/onedark.nvim",
          priority = 1000, -- make sure to load this before all the other start plugins
          config = function()
            require('onedark').setup({
--              style = 'darker'
            })
            require('onedark').load()
          end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
               options = {
                  theme = 'onedark',
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
