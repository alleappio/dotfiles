return {
  "akinsho/bufferline.nvim",
  requires = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local bufferline = require('bufferline')
    bufferline.setup {}
  end
}
