vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
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
    'qmlls',
    'ols',
    'texlab',
    'marksman',
    'cmake'
}

for _,l in ipairs(languages) do
    vim.lsp.config(l, {})
end

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

vim.lsp.enable(languages)
