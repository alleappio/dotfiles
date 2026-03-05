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
        vim.g.copilot_enabled = false
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
            debug = true,
            show_help = true,
            window = {
                layout = 'vertical',
            },
            model = 'claude-sonnet-4.6',
            highlight_headers = false,
            separator = '---',
            error_header = '> [!ERROR] Error',
        })
    end,
  },
}
