return{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy=false,
    config=function()
        require('nvim-treesitter').setup {
            -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
            install_dir = vim.fn.stdpath('data') .. '/site'
        }
        require('nvim-treesitter').install({
            "cmake",
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "javascript",
            "html",
            "cpp",
            "python",
            "rust",
            "latex",
            "markdown",
            "markdown_inline"
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "markdown", "copilot-chat" },
            callback = function(ev)
            vim.treesitter.start(ev.buf)
            end,
        })
    end
}
