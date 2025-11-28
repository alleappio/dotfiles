-- ~/.config/nvim/lua/plugins/copilot.lua
return {
  {
    "github/copilot.vim",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        -- Recommended config
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_assume_mapped = true
        vim.g.copilot_tab_fallback = ""
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    config = function()
      require("CopilotChat").setup({
            model = 'claude-3.5-sonnet',
            window = {
                layout = 'vertical',
                width = 0.25,
            },
            auto_insert_mode = true,
        })
    end,
  },
}
