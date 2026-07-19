vim.pack.add({
    'https://github.com/hiphish/rainbow-delimiters.nvim',
})

require 'rainbow-delimiters.setup'.setup({
    highlight = {
        'RainbowLevel0',
        'RainbowLevel1',
        'RainbowLevel2',
        'RainbowLevel3',
        'RainbowLevel4',
        'RainbowLevel5',
        'RainbowLevel6',
    },
})
