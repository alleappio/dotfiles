vim.pack.add {
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" }
}

vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
  end
end })

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
require('nvim-treesitter').setup({})
require('nvim-treesitter').install(language_list)


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

