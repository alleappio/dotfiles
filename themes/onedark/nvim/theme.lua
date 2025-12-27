return{
    {
      "olimorris/onedarkpro.nvim",
      priority = 1000, -- Ensure it loads first
      lazy=true,
      config = function()
        require("onedarkpro").setup({
          colors = {
            onedark = {
              bg = "#282C34"
            }
          }
        })
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
                }
            })
        end
    }
}
