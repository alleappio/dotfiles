return {
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        --dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
        priority = 1000,
        config = function()
            require("oil").setup({
                default_file_explorer = true,
                skip_confirm_for_simple_edits = true,
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
        end
    },
    {
      "benomahony/oil-git.nvim",
      dependencies = { "stevearc/oil.nvim" },
      -- No opts or config needed! Works automatically
    },
}
