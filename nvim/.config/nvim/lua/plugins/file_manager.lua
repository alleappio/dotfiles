
vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/benomahony/oil-git.nvim",
})

-- Declare a global function to retrieve the current directory
function _G.get_oil_winbar()
    local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
    local dir = require("oil").get_current_dir(bufnr)
    return vim.fn.fnamemodify(dir, ":~") or vim.api.nvim_buf_get_name(0)
end

require("oil").setup({
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    columns = {
        "icon",
        "permissions",
    },
    float = {
        padding = 2,
        max_width = 0.5,
        max_height = 0.5,
        border = "rounded",
    },
    view_options = {
        show_hidden = true,
        show_path = "absolute",
    },
    win_options = {
        winbar = "%!v:lua.get_oil_winbar()",
    },
})
