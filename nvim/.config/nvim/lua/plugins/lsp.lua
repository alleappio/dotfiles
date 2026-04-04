vim.pack.add({
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    {
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range("v1.x"),
    },
})

require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "stylua",
        "rust_analyzer",
        "pyright",
        "bashls",
        "clangd",
        "docker_compose_language_service",
        "dockerls",
        "html",
        "yamlls",
    },
})

require("blink.cmp").setup({

    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = "default" },

    appearance = {
        nerd_font_variant = "mono",
    },

    completion = { documentation = { auto_show = false } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
        default = { "buffer", "path", "snippets", "lsp" },
    },
    fuzzy = {
        implementation = "prefer_rust",
    },
})
