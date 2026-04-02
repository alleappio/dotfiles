vim.pack.add({
    "http://github.com/rose-pine/neovim",
    'http://github.com/nvim-tree/nvim-web-devicons',
    'http://github.com/nvim-lualine/lualine.nvim',
})

vim.cmd.colorscheme('rose-pine')

require('lualine').setup({
    options = {
        theme = "rose-pine",
        section_separators = '',
        component_separators = ''
    },

    sections = { 
        lualine_a = { {'mode', fmt = function(str) return str:sub(1,1) end} }
    }
})
