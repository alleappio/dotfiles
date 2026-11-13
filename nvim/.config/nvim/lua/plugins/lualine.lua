vim.pack.add({
    'https://github.com/nvim-lualine/lualine.nvim.git',
})

require('lualine').setup({
    options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    },
    tabline = {
        lualine_a = { 'buffers' },
        lualine_x = {
            function()
                return 'tab:'
            end,
        },
        lualine_z = { 'tabs' },
    },
})
