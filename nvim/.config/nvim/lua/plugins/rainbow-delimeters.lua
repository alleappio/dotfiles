vim.pack.add({
    'https://github.com/hiphish/rainbow-delimiters.nvim',
})

local hl = {
    'RainbowLevel0',
    'RainbowLevel1',
    'RainbowLevel2',
    'RainbowLevel3',
    'RainbowLevel4',
    'RainbowLevel5',
    'RainbowLevel6',
}
if vim.tbl_isempty(vim.api.nvim_get_hl(0, { name = 'RainbowLevel0' })) then
    hl = {
        'RainbowDelimiterRed',
        'RainbowDelimiterOrange',
        'RainbowDelimiterYellow',
        'RainbowDelimiterGreen',
        'RainbowDelimiterCyan',
        'RainbowDelimiterBlue',
        'RainbowDelimiterViolet',
    }
end

require('rainbow-delimiters.setup').setup({
    highlight = hl
})
