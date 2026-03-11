return {
    "uhs-robert/sshfs.nvim",
    opts = {
        ui = {
            local_picker = {
                preferred_picker = "oil",  -- one of: "auto", "snacks", "fzf-lua", "mini", "telescope", "oil", "neo-tree", "nvim-tree", "yazi", "lf", "nnn", "ranger", "netrw"
                fallback_to_netrw = true,   -- fallback to netrw if no picker is available
                netrw_command = "Explore",  -- netrw command: "Explore", "Lexplore", "Sexplore", "Vexplore", "Texplore"
            },
            remote_picker = {
                preferred_picker = "telescope",  -- one of: "auto", "snacks", "fzf-lua", "telescope", "mini"
            },
        },
    },
}
