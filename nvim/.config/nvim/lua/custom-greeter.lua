local function center_lines(lines)
    local width = vim.api.nvim_get_option_value("columns", {})
    local centered = {}
    for _, line in ipairs(lines) do
        local padding = math.floor((width - #line) / 2)
        if padding > 0 then
            table.insert(centered, string.rep(" ", padding) .. line)
        else
            table.insert(centered, line)
        end
    end
    return centered
end

local function show_greeting()
  if vim.fn.argc() == 0 then
    vim.cmd('enew')  -- open an empty buffer
    local buf = vim.api.nvim_get_current_buf()

    vim.bo[buf].buftype = 'nofile'
    vim.bo[buf].bufhidden = 'wipe'
    vim.bo[buf].swapfile = false
    vim.bo[buf].modifiable = true

    vim.api.nvim_set_option_value('number', false, { scope = 'local', win = 0 })
    vim.api.nvim_set_option_value('relativenumber', false, { scope = 'local', win = 0 })

    local header = {
        "                                        ",
        "o    o               o     o  o         ",
        "8b   8               8     8            ",
        "8`b  8 .oPYo. .oPYo. 8     8 o8 ooYoYo. ",
        "8 `b 8 8oooo8 8    8 `b   d'  8 8' 8  8 ",
        "8  `b8 8.     8    8  `b d'   8 8  8  8 ",
        "8   `8 `Yooo' `YooP'   `8'    8 8  8  8 ",
        "..:::..:.....::.....::::..::::....:..:..",
        "::::::::::::::::::::::::::::::::::::::::",
        "::::::::::::::::::::::::::::::::::::::::",
    }

    local lines = {
        "",
        "Hello There!",
    }

    local final_lines = {}
    vim.list_extend(final_lines, header)
    vim.list_extend(final_lines, lines)
    final_lines = center_lines(final_lines)

    local height = vim.api.nvim_get_option_value("lines", {})
    local top_padding = math.floor((height/2)-(#final_lines/2)-5)
    for _ = 1, top_padding do
        table.insert(final_lines, 1, "")
    end

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, final_lines)
    vim.bo[buf].modifiable = false
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = show_greeting,
})
