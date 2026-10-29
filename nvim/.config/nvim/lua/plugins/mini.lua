vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

require('mini.snippets').setup({})
require('mini.trailspace').setup({})
-- require('mini.statusline').setup({})
require('mini.pairs').setup({})

require('mini.icons').setup({})
MiniIcons.mock_nvim_web_devicons()
require('mini.tabline').setup({
    tabpage_section = 'right'
})

require('mini.move').setup({
    mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = '<S-h>',
        right = '<S-l>',
        down = '<S-j>',
        up = '<S-k>',

        -- Move current line in Normal mode
        line_left = '',
        line_right = '',
        line_down = '',
        line_up = '',
    },
})

require('mini.files').setup({
    mappings = {
        go_in_plus = 'l',
    },
})

require('mini.surround').setup()

require('mini.clue').setup({
    triggers = {
        { mode = { 'n', 'x' }, keys = '<Leader>' },
        { mode = { 'n', 'x' }, keys = '"' },
        { mode = { 'n', 'x' }, keys = 'g' },
        { mode = { 'i', 'c' }, keys = '<C-r>' },
    },
    clues = {
        require('mini.clue').gen_clues.registers(),
    },
    delay = 1000,
})

require('mini.hipatterns').setup({
    highlighters = {
        fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
        todo = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
        note = { pattern = 'NOTE', group = 'MiniHipatternsNote' },

        hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
    },
})

function miniFilesToggle(...)
    local cwf = vim.api.nvim_buf_get_name(0)
    if MiniFiles.close() == nil then
        if cwf ~= '' and not cwf:match('^ministarter:') and vim.bo.buftype == '' then
            MiniFiles.open(cwf)
        else
            MiniFiles.open(...)
        end
    end
end
