vim.pack.add({
    "https://github.com/arborist-ts/arborist.nvim",
})

local language_list ={
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
    "markdown_inline",
    "zig",
    "kotlin"
}
require("arborist").setup({
    ensure_installed = language_list,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = language_list,
    callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "copilot-chat" },
    callback = function(ev)
        vim.treesitter.start(ev.buf)
    end,
})

