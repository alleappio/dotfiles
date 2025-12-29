return {
  "nvim-neo-tree/neo-tree.nvim",
  --branch = "v3.x",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },

  config=function()
    require("neo-tree").setup({
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      popup_border_style = "NC", -- or "" to use 'winborder' on Neovim v0.11+
      window = {
        position = "left",
        width = 30,
        title = "neo-tree",
      },
      filesystem = {
        hijack_netrw_behavior = "open_default",
        title = "neo-tree",
      },
    })
  end
}
