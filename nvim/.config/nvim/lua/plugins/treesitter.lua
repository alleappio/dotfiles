return{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  branch='main',
  config=function()
    require'nvim-treesitter'.setup {
      ensure_installed = { "cmake", "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "cpp", "python", "rust", "latex" },
      auto_install = true,
      highlight = { enable = true },
    }
  end
}
