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

    -- Map <C-J> to accept Copilot suggestion
    vim.api.nvim_set_keymap("i", "<C-y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },
}
