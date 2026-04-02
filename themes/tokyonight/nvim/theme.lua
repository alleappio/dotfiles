vim.pack.add({
    "http://github.com/folke/tokyonight.nvim",
    'http://github.com/nvim-tree/nvim-web-devicons',
    'http://github.com/nvim-lualine/lualine.nvim',
})

require("tokyonight").setup({
    -- use the night style
    style = "night",
})
vim.cmd.colorscheme('tokyonight')

require('lualine').setup({
    options = {
        theme = "tokyonight",
        section_separators = '',
        component_separators = ''
    },

    sections = { 
        lualine_a = { {'mode', fmt = function(str) return str:sub(1,1) end} }
    }
})
