vim.pack.add({
    "http://github.com/navarasu/onedark.nvim",
    'http://github.com/nvim-tree/nvim-web-devicons',
    'http://github.com/nvim-lualine/lualine.nvim',
})

require('onedark').setup({
  -- style = 'darker'
})
require('onedark').load()
vim.cmd.colorscheme('onedark')

require('lualine').setup({
    options = {
        theme = "onedark",
        section_separators = '',
        component_separators = ''
    },

    sections = { 
        lualine_a = { {'mode', fmt = function(str) return str:sub(1,1) end} }
    }
})
