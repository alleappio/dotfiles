vim.pack.add({
    "http://github.com/sainnhe/everforest",
    'http://github.com/nvim-tree/nvim-web-devicons',
    'http://github.com/nvim-lualine/lualine.nvim',
})

vim.g.everforest_enable_italic = true
vim.g.everforest_background = 'hard'
vim.cmd.colorscheme('everforest')

require('lualine').setup({
    options = {
        theme = "everforest",
        section_separators = '',
        component_separators = ''
    },

    sections = { 
        lualine_a = { {'mode', fmt = function(str) return str:sub(1,1) end} }
    }
})
