return{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config=function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "cmake", "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "cpp", "python", "rust", "latex" }, 
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
