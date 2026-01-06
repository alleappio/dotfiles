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
  end
}
