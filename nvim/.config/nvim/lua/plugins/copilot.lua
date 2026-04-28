vim.pack.add({
    "https://github.com/github/copilot.vim",
    "https://github.com/CopilotC-Nvim/CopilotChat.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
})

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.g.copilot_enabled = false

require("CopilotChat").setup({
    show_help = true,
    window = {
            layout = "vertical",
            width = 0.3,
            border = 'rounded',
    },
    highlight_headers = false,
    separator = "---",
    error_header = "> [!ERROR] Error",
})
