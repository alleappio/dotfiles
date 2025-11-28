vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>o", "o<ESC>k")
vim.keymap.set("n", "<leader>O", "O<ESC>j")

-- Bufferline navigation and close
vim.keymap.set('n', '<A-.>', "<cmd>BufferLineCycleNext<cr>", {})
vim.keymap.set('n', '<A-,>', "<cmd>BufferLineCyclePrev<cr>", {})
vim.keymap.set('n', '<A-c>', "<cmd>bd<cr>", {})

-- Copilot
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.keymap.set("n", "<leader>cc", ':CopilotChat<CR>', {})

-- Neo-tree toggle
vim.keymap.set('n', '<C-n>', ':Neotree toggle left<CR>', {})

-- lsp actions
vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

-- Telescope keybindings
vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<CR>", {})
vim.keymap.set('n', '<leader>fg', "<cmd>Telescope live_grep<CR>", {})


