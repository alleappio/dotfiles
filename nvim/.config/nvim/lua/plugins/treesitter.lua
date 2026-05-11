vim.pack.add {
  { src = "https://github.com/romus204/tree-sitter-manager.nvim" }
}

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
require("tree-sitter-manager").setup({
  -- Default Options
  ensure_installed = language_list, -- list of parsers to install at the start of a neovim session
  border = "rounded", -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
  auto_install = false, -- if enabled, install missing parsers when editing a new file
  highlight = true, -- treesitter highlighting is enabled by default
  -- languages = {}, -- override or add new parser sources
  -- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
  -- query_dir = vim.fn.stdpath("data") .. "/site/queries",
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

