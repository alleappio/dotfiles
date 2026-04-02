vim.pack.add({
    "http://github.com/maxmx03/solarized.nvim",
    'http://github.com/nvim-tree/nvim-web-devicons',
    'http://github.com/nvim-lualine/lualine.nvim',
})

vim.o.termguicolors = true
vim.o.background = 'dark'
require('solarized').setup(opts)
vim.cmd.colorscheme('solarized')

require('lualine').setup({
    options = {
        theme = "solarized_dark",
        section_separators = '',
        component_separators = ''
    },

    sections = { 
        lualine_a = { {'mode', fmt = function(str) return str:sub(1,1) end} }
    }
})
