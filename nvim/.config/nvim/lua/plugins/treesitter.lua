return{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  branch='main',
  lazy=false,
  config=function()
    require'nvim-treesitter'.setup {
      ensure_installed = { "cmake", "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "cpp", "python", "rust", "latex", "markdown", "markdown_inline" },
      auto_install = true,
      highlight = { enable = true },
    }
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown", "copilot-chat" },
      callback = function(ev)
        vim.treesitter.start(ev.buf)
      end,
    })
    
  end
}
