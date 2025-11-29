return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local bufferline = require('bufferline')
    bufferline.setup({
      options = {
        mode = "buffers",
        themable = true,
        separator_style = "thin",
        show_buffer_close_icons = true,
        show_close_icon = true,
        color_icons = true,
        always_show_bufferline = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neotree",
            text_align = "left",
            separator = true,
          },
        },
      },
    })
  end
}
