return {
  {
      "mason-org/mason.nvim",
      config = function()
        require("mason").setup()
      end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "pyright",
          "clangd",
          "bashls",
          "clangd",
          "docker_compose_language_service",
          "dockerls",
          "html",
          "yamlls"
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("lua_ls", {})
      vim.lsp.config("rust_analyzer", {})
      vim.lsp.config("pyright", {})
      vim.lsp.config("clangd", {})
      vim.lsp.config("bashls", {})
      vim.lsp.config("clangd", {})
      vim.lsp.config("docker_compose_language_service", {})
      vim.lsp.config("dockerls", {})
      vim.lsp.config("html", {})
      vim.lsp.config("yamlls", {})

      vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end
  }
}
