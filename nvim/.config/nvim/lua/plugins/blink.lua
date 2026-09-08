vim.pack.add({
    {
        src = 'https://github.com/saghen/blink.cmp',
        version = vim.version.range('v1.x'),
    },
})

require('blink.cmp').setup({
    keymap = { preset = 'default' },

    appearance = {
        nerd_font_variant = 'mono',
    },

    completion = {
        documentation = { auto_show = true },
        menu = { border = 'single' },
    },

    sources = {
        default = { 'buffer', 'path', 'snippets', 'lsp' },
    },
    fuzzy = {
        implementation = 'prefer_rust',
    },
})
