vim.pack.add({
    "http://github.com/shaunsingh/nord.nvim",
    'http://github.com/nvim-tree/nvim-web-devicons',
    'http://github.com/nvim-lualine/lualine.nvim',
})

vim.g.nord_borders=true
require("nord").set()
vim.cmd.colorscheme('nord')

require('lualine').setup({
    options = {
        theme = "nord",
        section_separators = '',
        component_separators = ''
    },

    sections = { 
        lualine_a = { {'mode', fmt = function(str) return str:sub(1,1) end} }
    }
})
