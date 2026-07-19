vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

require('mini.icons').setup({})
local statusline = require('mini.statusline')

statusline.setup({
    content = {
        active = function()
            local mode, mode_hl = statusline.section_mode({ trunc_width = math.huge })
            local git = statusline.section_git({ trunc_width = 40 })
            local diff = statusline.section_diff({ trunc_width = 40 })
            local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
            local filename = statusline.section_filename({ trunc_width = 140 })
            local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
            local location = statusline.section_location({ trunc_width = 120 })

            return statusline.combine_groups({
                { hl = mode_hl, strings = { mode } },
                { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics } },
                '%<', -- Mark general truncate point
                { hl = 'MiniStatuslineFilename', strings = { filename } },
                '%=', -- End left alignment
                { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                { hl = mode_hl, strings = { location } },
            })
        end,
    },
})

vim.api.nvim_set_hl(0, 'MiniTablineCurrent', {link = 'MiniStatuslineModeNormal'})
require('mini.tabline').setup({})

require('mini.trailspace').setup({})
require('mini.pairs').setup({})
local miniclue = require('mini.clue')
miniclue.setup({
    triggers = {
        { mode = { 'n', 'x' }, keys = '<Leader>' },
        { mode = { 'n', 'x' }, keys = '"' },
        { mode = { 'i', 'c' }, keys = '<C-r>' },
    },
    clues = {
        miniclue.gen_clues.registers(),
    },
    delay = 1000,
})

local hipatterns = require('mini.hipatterns')
hipatterns.setup({
    highlighters = {
        fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
        todo = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
        note = { pattern = 'NOTE', group = 'MiniHipatternsNote' },

        hex_color = hipatterns.gen_highlighter.hex_color(),
    },
})

require('mini.files').setup({
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

require("mini.snippets").setup({})
