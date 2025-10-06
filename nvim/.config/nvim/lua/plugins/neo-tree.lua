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
      window = {
        position = "left",
        title = "neo-tree",
      },
      filesystem = {
        hijack_netrw_behavior = "open_default",
        title = "neo-tree",
      },
    })
    vim.keymap.set('n', '<C-n>', ':Neotree toggle left<CR>', {})
  end
}
