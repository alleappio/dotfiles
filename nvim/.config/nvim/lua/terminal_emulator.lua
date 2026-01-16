local state = {
    current = {
        buf = -1,
        win = -1,
    }
}

local function create_split_window(opts)
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

-- Create a centered floating window
local function create_floating_window(opts)
  opts = opts or {}
  
  -- Get editor dimensions
  local ui = vim.api.nvim_list_uis()[1]
  local editor_width = ui.width
  local editor_height = ui.height
  
  -- Calculate dimensions (default to 80% of screen)
  local width = opts.width or math.floor(editor_width * 0.8)
  local height = opts.height or math.floor(editor_height * 0.8)
  
  -- Calculate position to center the window
  local row = math.floor((editor_height - height) / 2)
  local col = math.floor((editor_width - width) / 2)
  
  -- Create a scratch buffer
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
      buf = opts.buf
  else
      buf = vim.api.nvim_create_buf(false, true)
  end
  
  -- Window configuration
  local win_opts = {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  }
  
  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, win_opts)
  vim.api.nvim_set_option_value('winhl', 'Normal:Normal,FloatBorder:FloatBorder', { win = win })

  return { buf = buf, win = win }
end

local toggle_split_terminal =  function()
    if not vim.api.nvim_win_is_valid(state.current.win) then
        state.current = create_split_window({ buf = state.current.buf })
        if vim.bo[state.current.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
        vim.cmd('startinsert')
    else
        vim.api.nvim_win_hide(state.current.win)
    end
end

local toggle_floating_terminal =  function()
    if not vim.api.nvim_win_is_valid(state.current.win) then
        state.current = create_floating_window({ buf = state.current.buf })
        if vim.bo[state.current.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
        vim.cmd('startinsert')
    else
        vim.api.nvim_win_hide(state.current.win)
    end
end

vim.api.nvim_create_user_command("TerminalEmulator", function(opts)
    local subcmd = opts.fargs[1]
    if subcmd == "float" then
        toggle_floating_terminal()
    elseif subcmd == "split" then
        toggle_split_terminal()
    elseif subcmd == nil then
        toggle_floating_terminal()
    else
        print("Usage: :TerminalEmulator [float|split]")
    end
end, { nargs = "*",
    complete = function(arglead, cmdline, cursorpos)
        return { "float", "split" }
    end
})
