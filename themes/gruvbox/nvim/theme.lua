vim.pack.add({
    "http://github.com/sainnhe/gruvbox-material",
    'http://github.com/nvim-tree/nvim-web-devicons',
    'http://github.com/nvim-lualine/lualine.nvim',
})

vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "material"
vim.cmd.colorscheme("gruvbox-material")

require('lualine').setup({
    options = {
        theme = "gruvbox-material",
        section_separators = '',
        component_separators = ''
    },

    sections = { 
        lualine_a = { {'mode', fmt = function(str) return str:sub(1,1) end} }
    }
})
