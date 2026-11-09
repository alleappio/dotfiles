vim.pack.add({
    {
        src = 'https://github.com/saghen/blink.cmp',
        version = vim.version.range('v1.x'),
    },
})

require('blink.cmp').setup({
    completion = {
        documentation = { auto_show = true },
    },

    snippets = {
        preset = 'luasnip',
    },

    sources = {
        default = { 'lsp', 'snippets', 'path', 'buffer' },
    },
})
