vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

vim.api.nvim_set_hl(0, 'MiniTablineCurrent', { link = 'MiniStatuslineModeNormal' })

require('mini.icons').setup({})
require('mini.snippets').setup({})
require('mini.surround').setup({})
require('mini.tabline').setup({})
require('mini.trailspace').setup({})
require('mini.statusline').setup({})
local minipairs = require('mini.pairs')
local miniclue = require('mini.clue')
local hipatterns = require('mini.hipatterns')
local minifiles = require('mini.files')

minipairs.setup({})

local lt_opts = {
    action = 'open',
    pair = '<>',
    neigh_pattern = '\r.',
    register = { cr = false },
}
MiniPairs.map('i', '<', lt_opts)

local gt_opts = { action = 'close', pair = '<>', register = { cr = false } }
MiniPairs.map('i', '>', gt_opts)

-- Create symmetrical `$$` pair only in Tex files
local map_tex = function()
    MiniPairs.map_buf(0, 'i', '$', { action = 'closeopen', pair = '$$' })
end
vim.api.nvim_create_autocmd('FileType', { pattern = 'tex', callback = map_tex })

miniclue.setup({
    triggers = {
        { mode = { 'n', 'x' }, keys = '<Leader>' },
        { mode = { 'n', 'x' }, keys = '"' },
        { mode = { 'n', 'x' }, keys = 'g' },
        { mode = { 'i', 'c' }, keys = '<C-r>' },
    },
    clues = {
        miniclue.gen_clues.registers(),
    },
    delay = 1000,
})

hipatterns.setup({
    highlighters = {
        fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
        todo = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
        note = { pattern = 'NOTE', group = 'MiniHipatternsNote' },

        hex_color = hipatterns.gen_highlighter.hex_color(),
    },
})

minifiles.setup({
    mappings = {
        close = 'q',
        go_in = 'L',
        go_in_plus = 'l',
        go_out = 'h',
        go_out_plus = 'H',
        mark_goto = "'",
        mark_set = 'm',
        reset = '<BS>',
        reveal_cwd = '@',
        show_help = 'g?',
        synchronize = '=',
        trim_left = '<',
        trim_right = '>',
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
