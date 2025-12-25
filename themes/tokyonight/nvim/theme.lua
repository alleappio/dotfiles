return{
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
      config = function()
        require("tokyonight").setup({
          -- use the night style
          style = "night",
        })
      end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
               options = {
                  theme = 'tokyonight',
                }
            })
        end
    }
}
