vim.pack.add({
    'https://github.com/rafamadriz/friendly-snippets',
    'https://github.com/neovim/nvim-lspconfig',
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    {
        src = 'https://github.com/saghen/blink.cmp',
        version = vim.version.range('v1.x'),
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

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            format = {
                enable = false,
            },
        },
    },
})

require('blink.cmp').setup({

    keymap = { preset = 'default' },

    appearance = {
        nerd_font_variant = 'mono',
    },

    completion = { documentation = { auto_show = false } },

    sources = {
        default = { 'buffer', 'path', 'snippets', 'lsp' },
    },
    fuzzy = {
        implementation = 'prefer_rust',
    },
})
