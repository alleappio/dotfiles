vim.pack.add({
    "http://github.com/catppuccin/nvim",
    'http://github.com/nvim-tree/nvim-web-devicons',
    'http://github.com/nvim-lualine/lualine.nvim',
})

require('catppuccin').setup({
    flavour="mocha",
})
vim.cmd.colorscheme('catppuccin')

require('lualine').setup({
    options = {
        theme = "catppuccin",
        section_separators = '',
        component_separators = ''
    },

    sections = { 
        lualine_a = { {'mode', fmt = function(str) return str:sub(1,1) end} }
    }
})
