vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",
    {
        src="https://github.com/akinsho/bufferline.nvim",
        name="bufferline",
    },
})

local bufferline = require('bufferline')
bufferline.setup({
    options = {
        style_preset = bufferline.style_preset.default,
        mode = "buffers",
        themable = true,
        separator_style = "thin",
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
        always_show_bufferline = false,
    },
})
