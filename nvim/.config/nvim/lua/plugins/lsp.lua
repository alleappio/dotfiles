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
    'qmlls',
}

require('mason-lspconfig').setup({
    ensure_installed = languages
})


vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
            },
            format = {
                enable = false,
            },
        },
    },
})

vim.lsp.config('qmlls', {
    cmd = { 'qmlls6' },
})

vim.lsp.config("kotlin_lsp", {
    cmd = {
        vim.fn.expand("~/.local/bin/intellij-server"),
        "--stdio"
    }
})
vim.lsp.enable("kotlin_lsp")
