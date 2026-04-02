vim.pack.add({
    "http://github.com/rebelot/kanagawa.nvim",
    'http://github.com/nvim-tree/nvim-web-devicons',
    'http://github.com/nvim-lualine/lualine.nvim',
})

vim.cmd.colorscheme('kanagawa')

require('lualine').setup({
    options = {
        theme = "kanagawa",
        section_separators = '',
        component_separators = ''
    },

    sections = { 
        lualine_a = { {'mode', fmt = function(str) return str:sub(1,1) end} }
    }
})
