return{
    {
        'sainnhe/everforest',
        lazy = false,
        priority = 1000,
        config = function()
          vim.g.everforest_enable_italic = true
          vim.g.everforest_background = 'hard'
          vim.cmd.colorscheme('everforest')
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
               options = {
                  theme = 'everforest',
                }
            })
        end
    }
}
