vim.pack.add({
    'http://github.com/nvim-tree/nvim-web-devicons',
    'http://github.com/nvim-lualine/lualine.nvim',
})
-- this function should return the current directory name
function get_workspace()
    return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

require('lualine').setup({
    options = {
        theme = "auto",
        section_separators = '',
        component_separators = '|',
        always_show_tabline = true,
    },

    sections = { 
        lualine_a = { {'mode', fmt = function(str) return str:sub(1,1) end} },
    },
    tabline = {
        lualine_a = {
            {
                "buffers",
                max_length = vim.o.columns - 1,
                use_mode_colors = true,
            }
        },
        lualine_z = {get_workspace},
    }
})
