local terminal_emulator = require('terminal_emulator')
local telescope_builtin = require('telescope.builtin')

-- Bufferline navigation and close
vim.keymap.set('n', '<C-h>', '<cmd>bprevious<cr>')
vim.keymap.set('n', '<C-l>', '<cmd>bnext<cr>')
vim.keymap.set('n', '<C-c>', '<cmd>bd<cr>')

-- Copilot
vim.keymap.set({"n", "v"}, '<leader>cc', '<cmd>CopilotChatToggle<CR>', {desc = 'Open copilot chat'})
vim.keymap.set('n', '<leader>cm', '<cmd>CopilotChatModel<CR>', {desc = 'Choose copilot model'})
vim.keymap.set('n', '<leader>ce', '<cmd>Copilot enable<CR>', {desc = 'Enable copilot suggestions'})
vim.keymap.set('n', '<leader>cd', '<cmd>Copilot disable<CR>', {desc = 'Disable copilot suggestions'})
vim.keymap.set('i', '<C-j>', 'copilot#Accept("\\<CR>")', {expr = true, replace_keycodes = false, desc = 'Accept Copilot suggestion'})

-- Open file explorer
vim.keymap.set('n', '<leader>e', function() if vim.bo.filetype == 'oil' then require('oil').close() else require('oil').open() end end, {desc = 'Open file explorer'})

-- Telescope stuff
vim.keymap.set('n', '<leader>ff', function() telescope_builtin.find_files({ hidden = true }) end, {desc = 'Find file'})
vim.keymap.set('n', '<leader>fg', function() telescope_builtin.live_grep({ hidden = true }) end, {desc = 'Live grep'})
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', {desc = 'Find buffers'})
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', {desc = 'Help tags'})
vim.keymap.set('n', '<leader>ft', '<cmd>Neotree toggle<CR>', {desc = 'Help tags'})

-- git stuff
vim.keymap.set('n', '<leader>g+', '<cmd>Gitsigns stage_hunk<cr>', {desc = 'stage current hunk'})
vim.keymap.set('n', '<leader>g-', '<cmd>Gitsigns undo_stage_hunk<cr>', {desc = 'unstage current hunk'})
vim.keymap.set('n', '<leader>gl', '<cmd>ResolveOurs<cr>', {desc = 'accept local changes in this conflict'})
vim.keymap.set('n', '<leader>gr', '<cmd>ResolveTheirs<cr>', {desc = 'accept remote changes in this conflict'})
vim.keymap.set('n', '<leader>gb', '<cmd>ResolveBoth<cr>', {desc = 'accept both changes in this conflict'})
vim.keymap.set('n', '<leader>gn', '<cmd>ResolveNone<cr>', {desc = 'accept no change in this conflict'})
vim.keymap.set('n', '<leader>gq', '<cmd>ResolveList<cr>', {desc = 'put conflict in quickfix list'})

-- lsp actions
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, {desc = 'lsp code actions'})
vim.keymap.set('n', '<leader>lc', vim.diagnostic.open_float, {desc = 'lsp diagnostics'})
vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, {desc = 'lsp definition'})
vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format() end, {desc = 'lsp format code'})
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, {desc = 'lsp hover'})
vim.keymap.set('n', '<leader>lw', vim.lsp.buf.add_workspace_folder, {desc = 'lsp add workspace folder'})

-- Quickfix keybindings
vim.keymap.set('n', '<leader>qc', '<cmd>cclose<cr>', {desc = 'Close quickfix'})
vim.keymap.set('n', '<C-j>', '<cmd>cnext<cr>', {desc = 'Next quickfix entry'})
vim.keymap.set('n', '<C-k>', '<cmd>cprev<cr>', {desc = 'Prev quickfix entry'})
vim.keymap.set('n', '<leader>qo', '<cmd>copen<cr>', {desc = 'Open quickfix'})

-- terminal stuff
vim.keymap.set({"n", "t"}, '<leader>tt', function() terminal_emulator.toggle_split_terminal() end, {desc = 'Open split terminal'})
vim.keymap.set({"n", "t"}, '<leader>tf', function() if vim.api.nvim_buf_is_valid(terminal_emulator.current.buf) then vim.api.nvim_win_set_buf(0, terminal_emulator.current.buf) else vim.cmd('term') terminal_emulator.current.buf = vim.api.nvim_get_current_buf() end vim.cmd('startinsert') end, {desc = 'Open terminal fullscreen'})
vim.keymap.set("t", '<esc><esc>', '<c-\\><c-n>', {desc = 'Go into normal mode from terminal'})

-- undotree
vim.keymap.set('n', '<leader>u', '<cmd>Undotree<cr>', {desc = 'Undotree'})





-- show keymaps in a centered floating window without which-key
local function show_keymaps()
  -- Toggle floating window that lists custom keymaps (those with a 'desc' set)
  local winid = vim.g._custom_keymaps_winid
  if winid and vim.api.nvim_win_is_valid(winid) then
    local bufid = vim.g._custom_keymaps_bufid
    pcall(vim.api.nvim_win_close, winid, true)
    vim.g._custom_keymaps_winid = nil
    if bufid and vim.api.nvim_buf_is_valid(bufid) then pcall(vim.api.nvim_buf_delete, bufid, {force = true}) end
    vim.g._custom_keymaps_bufid = nil
    return
  end

  local modes = { 'n', 'i', 'v', 'x', 's', 'o', 't', 'c' }
  local out = {}
  for _, mode in ipairs(modes) do
    local ok, maps = pcall(vim.api.nvim_get_keymap, mode)
    if ok and maps then
      local section = {}
      for _, m in ipairs(maps) do
        if m.desc and m.desc ~= "" then
            local keybind = m.lhs:gsub(" ", "<leader>")
          table.insert(section, string.format("%-20s → %s", keybind, m.desc))
        end
      end
      if #section > 0 then
        table.insert(out, string.upper(mode) .. " MODE")
        for _, l in ipairs(section) do table.insert(out, "  " .. l) end
        table.insert(out, "")
      end
    end
  end

  if #out == 0 then out = { "No custom keymaps found (no mappings with 'desc' present)." } end

  local width = math.max(40, math.floor(vim.o.columns * 0.7))
  local height = math.max(5, math.floor(vim.o.lines * 0.7))
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, out)
  vim.api.nvim_buf_set_option(buf, "modifiable", false)
  vim.api.nvim_buf_set_option(buf, "filetype", "help")

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    height = height,
    style = "minimal",
    border = "rounded",
  })
  vim.api.nvim_win_set_option(win, "wrap", false)

  -- mappings to close window
  pcall(vim.api.nvim_buf_set_keymap, buf, "n", "q", "<cmd>close<CR>", { nowait = true, noremap = true, silent = true })
  pcall(vim.api.nvim_buf_set_keymap, buf, "n", "<Esc>", "<cmd>close<CR>", { nowait = true, noremap = true, silent = true })

  vim.g._custom_keymaps_winid = win
  vim.g._custom_keymaps_bufid = buf
end

-- toggle the keymaps window with <leader>k
vim.keymap.set('n', '<leader>k', function() if vim.api.nvim_win_get_buf(0) == buf then vim.api.nvim_win_close(0, true) else show_keymaps() end end, {desc = 'Show keymaps'})

