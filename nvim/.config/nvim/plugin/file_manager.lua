
vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/benomahony/oil-git.nvim",
})

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
    },
})
