vim.pack.add({
    -- 'https://github.com/rafamadriz/friendly-snippets',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/mason-org/mason-lspconfig.nvim',
    {
        src = 'https://github.com/saghen/blink.cmp',
        version = vim.version.range('v1.x'),
    },
})

require('mason').setup()

require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'stylua',
        'rust_analyzer',
        'pyright',
        'bashls',
        'clangd',
        'docker_compose_language_service',
        'dockerls',
        'html',
        'yamlls',
        'kotlin_lsp'
    },
})

local languages = {
    'lua_ls',
    'stylua',
    'rust_analyzer',
    'pyright',
    'bashls',
    'clangd',
    'docker_compose_language_service',
    'dockerls',
    'html',
    'yamlls',
    'kotlin_lsp',
    'qmlls',
}

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            format = {
                enable = false,
            },
        },
    },
})

vim.lsp.config('qmlls', {
    cmd = { 'qmlls6' },
})

-- for _, language in ipairs(languages) do
--     vim.lsp.enable(language)
-- end

require('blink.cmp').setup({

    keymap = { preset = 'default' },

    appearance = {
        nerd_font_variant = 'mono',
    },

    completion = {
        documentation = { auto_show = false },
        menu = { border = 'none' },
    },

    sources = {
        default = { 'buffer', 'path', 'snippets', 'lsp' },
    },
    fuzzy = {
        implementation = 'prefer_rust',
    },
})
