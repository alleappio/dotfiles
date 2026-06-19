local ns = vim.api.nvim_create_namespace('welcome-screen')

local function get_fortune()
    if vim.fn.executable('fortune') ~= 1 then
        return 'Hello there! - General Kenobi'
    end

    local result = vim.system({ 'fortune', '-s', '-n', '50' }, { text = true }):wait()
    -- local text = (result.stdout or ''):gsub('\t', ''):gsub('\n', ' '):gsub('^%s+', ''):gsub('%s+$', '')
    local text = (result.stdout or '')
    lines = {}
    for line in ( text .. "\n"):gmatch("(.-)\r?\n") do
        table.insert(lines, line)
    end

    return lines ~= '' and lines or {'Hello there!",  "\t- General Kenobi'}
end

local function center_text(text, width)
    local pad = math.max(0, math.floor((width - vim.fn.strdisplaywidth(text)) / 2))
    return string.rep(' ', pad) .. text
end

local function build_lines(width)
    local logo = {
        '  _   _                 _           ',
        ' | \\ | |               (_)          ',
        ' |  \\| | ___  _____   ___ _ __ ___  ',
        ' | . ` |/ _ \\/ _ \\ \\ / / | \'_ ` _ \\ ',
        ' | |\\  |  __/ (_) \\ V /| | | | | | |',
        ' \\_| \\_/\\___|\\___/ \\_/ |_|_| |_| |_|',
    }

    local fortune = get_fortune()
    local content = vim.list_extend({}, logo)
    local startup_time = "Neovim started in " .. (vim.uv.now()-vim.g.start_time)/1000 .. " seconds"
    table.insert(content, '')
    content = vim.list_extend(content, fortune)
    table.insert(content, '')
    table.insert(content, startup_time)

    local lines = {}
    for _, line in ipairs(content) do
        table.insert(lines, center_text(line, width))
    end

    return lines
end

local function close_dashboard(state)
    if state.closed then
        return
    end
    state.closed = true

    pcall(vim.on_key, nil, ns)

    if vim.api.nvim_win_is_valid(state.win) then
        pcall(vim.api.nvim_win_close, state.win, true)
    end
end

local function open_dashboard()
    local columns = vim.o.columns
    local rows = vim.o.lines - vim.o.cmdheight

    local preview = build_lines(columns)
    local width = 0
    for _, line in ipairs(preview) do
        width = math.max(width, vim.fn.strdisplaywidth(line))
    end

    width = math.min(width, math.max(20, columns - 4))
    local lines = build_lines(width)
    local height = #lines

    local buf = vim.api.nvim_create_buf(false, true)
    vim.bo[buf].buftype = 'nofile'
    vim.bo[buf].bufhidden = 'wipe'
    vim.bo[buf].swapfile = false
    vim.bo[buf].modifiable = true
    vim.bo[buf].filetype = 'welcome'

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo[buf].modifiable = false

    local startup_row = 0
    vim.api.nvim_buf_set_extmark(buf, ns, startup_row, 0, {
        end_row = 6, -- "neovim started in"
        hl_group = 'function',
    })
    vim.api.nvim_buf_set_extmark(buf, ns, #lines-1, 0, {
        end_row = #lines, -- "neovim started in"
        hl_group = '@comment',
    })

    local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        style = 'minimal',
        border = 'none',
        -- row = math.floor((rows - height) / 2),
        row = 5,
        col = math.floor((columns - width) / 2),
        width = width,
        height = height,
        focusable = false,
        noautocmd = true,
    })

    vim.api.nvim_set_option_value('winhighlight', 'NormalFloat:Normal,FloatBorder:Normal,FloatTitle:Normal', {
      win = win,
    })

    local state = { win = win, closed = false }

    vim.on_key(function()
        close_dashboard(state)
    end, ns)
end

vim.api.nvim_create_autocmd('VimEnter', {
    once = true,
    callback = function()
        if vim.fn.argc() ~= 0 then
            return
        end

        open_dashboard()
    end,
})
