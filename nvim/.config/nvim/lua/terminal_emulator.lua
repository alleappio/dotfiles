local M = {
    current = {
        buf = -1,
        win = -1,
    },
}

M.create_split_window = function(opts)
    opts = opts or {}

    -- Get editor height for calculating split size
    local ui = vim.api.nvim_list_uis()[1]
    local editor_height = ui.height

    -- Calculate height (default to 30% of screen for bottom split)
    local height = opts.height or math.floor(editor_height * 0.3)

    -- Create or use existing buffer
    local buf = nil
    if opts.buf and vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    -- Create split below
    vim.cmd('below split')

    -- Get the new window that was just created
    local win = vim.api.nvim_get_current_win()

    -- Set the buffer in the new window
    vim.api.nvim_win_set_buf(win, buf)

    -- Set window height
    vim.api.nvim_win_set_height(win, height)

    return { buf = buf, win = win }
end

M.toggle_split_terminal = function()
    if not vim.api.nvim_win_is_valid(M.current.win) then
        M.current = M.create_split_window({ buf = M.current.buf })
        if vim.bo[M.current.buf].buftype ~= 'terminal' then
            vim.cmd.terminal()
        end
        vim.cmd('startinsert')
    else
        vim.api.nvim_win_hide(M.current.win)
    end
end

M.toggle_full_screen_terminal = function()
    if vim.api.nvim_buf_is_valid(M.current.buf) then
        vim.api.nvim_win_set_buf(0, M.current.buf)
    else
        vim.cmd('term')
        M.current.buf = vim.api.nvim_get_current_buf()
    end
    vim.cmd('startinsert')
end

return M
