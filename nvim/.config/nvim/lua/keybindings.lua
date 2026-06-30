local terminal_emulator = require('terminal_emulator')

-- Bufferline navigation and close
vim.keymap.set('n', '<C-h>', '<cmd>bprevious<cr>')
vim.keymap.set('n', '<C-l>', '<cmd>bnext<cr>')
vim.keymap.set('n', '<C-c>', '<cmd>bd<cr>')

-- Copilot
vim.keymap.set({ 'n', 'v' }, '<leader>cc', '<cmd>CodeCompanionChat Toggle<CR>', { desc = 'Open copilot chat' })
vim.keymap.set('n', '<leader>ce', '<cmd>Copilot enable<CR>', { desc = 'Enable copilot suggestions' })
vim.keymap.set('n', '<leader>cd', '<cmd>Copilot disable<CR>', { desc = 'Disable copilot suggestions' })
vim.keymap.set('i', '<C-j>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false, desc = 'Accept Copilot suggestion' })

-- Open file explorer
vim.keymap.set('n', '<leader>e', function()
    if vim.bo.filetype == 'oil' then
        require('oil').close()
    else
        require('oil').open()
    end
end, { desc = 'Open file explorer' })

-- Telescope stuff
vim.keymap.set('n', '<leader>ff', telescope_find_files, { desc = 'Telescope: Find file' })
vim.keymap.set('n', '<leader>fg', telescope_live_grep, { desc = 'Telescope: Live grep' })
vim.keymap.set('n', '<leader>fk', telescope_keymaps, { desc = 'Telescope: Live grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Telescope: Find buffers' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'Telescope: Help tags' })
vim.keymap.set('n', '<leader>ft', '<cmd>Neotree toggle<CR>', { desc = 'Telescope: Help tags' })

-- git stuff
vim.keymap.set('n', '<leader>g+', '<cmd>Gitsigns stage_hunk<cr>', { desc = 'Git: stage current hunk' })
vim.keymap.set('n', '<leader>g-', '<cmd>Gitsigns undo_stage_hunk<cr>', { desc = 'Git: unstage current hunk' })
vim.keymap.set('n', '<leader>gp', '<cmd>Gitsigns preview_hunk<cr>', { desc = 'Git: preview current hunk' })
vim.keymap.set('n', '<leader>gq', '<cmd>Gitsigns setqflist<cr>', { desc = 'Git: put hunks in quickfix list' })
vim.keymap.set('n', '<leader>gl', '<cmd>ResolveOurs<cr>', { desc = 'Git: accept local changes in this conflict' })
vim.keymap.set('n', '<leader>gr', '<cmd>ResolveTheirs<cr>', { desc = 'Git: accept remote changes in this conflict' })
vim.keymap.set('n', '<leader>gb', '<cmd>ResolveBoth<cr>', { desc = 'Git: accept both changes in this conflict' })
vim.keymap.set('n', '<leader>gn', '<cmd>ResolveNone<cr>', { desc = 'Git: accept no change in this conflict' })
vim.keymap.set('n', '<leader>gQ', '<cmd>ResolveList<cr>', { desc = 'Git: put conflict in quickfix list' })

-- lsp actions
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'Lsp: lsp code actions' })
vim.keymap.set('n', '<leader>lc', vim.diagnostic.open_float, { desc = 'Lsp: lsp diagnostics' })
vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { desc = 'Lsp: lsp definition' })
vim.keymap.set('n', '<leader>lf', function()
    vim.lsp.buf.format()
end, { desc = 'Lsp: lsp format code' })
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, { desc = 'Lsp: lsp hover' })
vim.keymap.set('n', '<leader>lw', vim.lsp.buf.add_workspace_folder, { desc = 'Lsp: lsp add workspace folder' })

-- Quickfix keybindings
vim.keymap.set('n', '<leader>qc', '<cmd>cclose<cr>', { desc = 'Quickfix: Close quickfix' })
vim.keymap.set('n', '<C-j>', '<cmd>cnext<cr>', { desc = 'Quickfix: Next quickfix entry' })
vim.keymap.set('n', '<C-k>', '<cmd>cprev<cr>', { desc = 'Quickfix: Prev quickfix entry' })
vim.keymap.set('n', '<leader>qo', '<cmd>copen<cr>', { desc = 'Quickfix: Open quickfix' })

-- terminal stuff
vim.keymap.set({ 'n', 't' }, '<leader>tt', terminal_emulator.toggle_split_terminal, { desc = 'Terminal: Open split terminal' })
vim.keymap.set({ 'n', 't' }, '<leader>tf', terminal_emulator.toggle_full_screen_terminal, { desc = 'Terminal: Open terminal fullscreen' })
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Terminal: Go into normal mode from terminal' })

-- undotree
vim.keymap.set('n', '<leader>u', '<cmd>Undotree<cr>', { desc = 'Undotree' })

-- restart
vim.keymap.set('n', '<leader>r', '<cmd>restart<cr>', { desc = 'Restart neovim' })
