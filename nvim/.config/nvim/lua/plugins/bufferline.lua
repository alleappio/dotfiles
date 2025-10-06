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
        always_show_bufferline = true,
        offset = {
          {
            filetype={ "neo-tree", "neo-tree-popup", "notify" },
            text="neo-tree",
            highlight="directory",
            text_align="left",
            separator=true,
          },
        },
      },

    })
    vim.keymap.set('n', '<A-.>', "<cmd>BufferLineCycleNext<cr>", {})
    vim.keymap.set('n', '<A-,>', "<cmd>BufferLineCyclePrev<cr>", {})
    vim.keymap.set('n', '<A-c>', "<cmd>bd<cr>", {})
  end
}
