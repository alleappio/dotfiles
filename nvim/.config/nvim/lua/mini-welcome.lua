local logo = {
    'o    o                       o         ',
    '8b   8                                 ',
    '8`b  8 .oPYo. .oPYo. o    o o8 ooYoYo. ',
    "8 `b 8 8oooo8 8    8 Y.  .P  8 8' 8  8 ",
    "8  `b8 8.     8    8 `b..d'  8 8  8  8 ",
    "8   `8 `Yooo' `YooP'  `YP'   8 8  8  8 ",
    '..:::..:.....::.....:::...:::....:..:..',
    ':::::::::::::::::::::::::::::::::::::::',
    ':::::::::::::::::::::::::::::::::::::::',
}

local startup_time = 'Neovim started in ' .. (vim.uv.now() - vim.g.start_time) / 1000 .. ' seconds'
local plugins_number = "Loaded " .. #vim.pack.get(nil, { info = false }) .. " plugins"
local footer = plugins_number .. "\n" .. startup_time

local function get_fortune()
    if vim.fn.executable('fortune') ~= 1 then
        return 'Hello there! - General Kenobi'
    end

    local result = vim.system({ 'fortune', '-s', '-n', '50' }, { text = true }):wait()
    -- local text = (result.stdout or ''):gsub('\t', ''):gsub('\n', ' '):gsub('^%s+', ''):gsub('%s+$', '')
    local text = (result.stdout or '')
    lines = {}
    for line in (text .. '\n'):gmatch('(.-)\r?\n') do
        table.insert(lines, line)
    end

    return lines ~= '' and lines or { 'Hello there!',  '\t- General Kenobi' }
end

local fortune = {}
for _, i in ipairs(get_fortune()) do
    if i ~= "" then
        table.insert(fortune, {
            name = i,
            action = '',
            section = '',
        })
    end
end

vim.api.nvim_set_hl(0, 'MiniStarterHeader', {link = '@markup.heading.4.markdown'})
require('mini.starter').setup({
    header = table.concat(logo, '\n'),
    footer = footer,
    items = fortune,
    query_updaters = '',
})
