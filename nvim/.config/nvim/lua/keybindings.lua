local wk = require("which-key")

-- Copy and paste from and to system clipboard
wk.add({
    { "<leader>y", "\"+y", mode = {"n", "v"}, desc = "Yank to system clipboard" },
    { "<leader>p", "+p", mode = "n", desc = "Paste from system clipboard" },
    { "<leader>o", "o<ESC>k", mode = "n", desc = "Open new line below" },
    { "<leader>O", "O<ESC>j", mode = "n", desc = "Open new line above" },
})

-- Bufferline navigation and close
wk.add({
    { "<A-.>", "<cmd>BufferLineCycleNext<cr>", mode = "n" },
    { "<A-,>", "<cmd>BufferLineCyclePrev<cr>", mode = "n" },
    { "<A-c>", "<cmd>bd<cr>", mode = "n" },
})

-- Copilot
wk.add({
    { "<leader>c", group = "Copilot" },
    { "<leader>cc", "<cmd>CopilotChatToggle<CR>", desc="Open copilot chat", mode = {"n", "v"} },
    { "<leader>cm", "<cmd>CopilotChatModel<CR>", desc="Choose copilot model", mode = "n" },
    { "<leader>ce", "<cmd>Copilot enable<CR>", desc="Enable copilot suggestions", mode = "n" },
    { "<leader>cd", "<cmd>Copilot disable<CR>", desc="Disable copilot suggestions", mode = "n" },
    { "<C-j>", 'copilot#Accept("\\<CR>")', mode = "i", expr = true, replace_keycodes = false, desc = "Accept Copilot suggestion" },
})

-- Neo-tree toggle
wk.add({
    { "<leader>e", ":Neotree toggle left<CR>", desc = "Toggle Neotree", mode = "n" },
})

-- lsp actions
wk.add({
    { "<leader>l", group = "lsp" },
    { "<leader>lh", vim.lsp.buf.hover, desc = "lsp hover", mode = "n" },
    { "<leader>la", vim.lsp.buf.code_action, desc = "lsp code actions", mode = "n" },
    { "<leader>ld", vim.lsp.buf.definition, desc = "lsp definition", mode = "n" },
    { "<leader>lc", vim.diagnostic.open_float, desc = "lsp diagnostics", mode = "n" },
    { "<leader>lw", vim.lsp.buf.add_workspace_folder, desc = "lsp add workspace folder", mode = "n" },
})

-- Telescope keybindings
wk.add({
    { "<leader>f", group = "file" },
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find file", mode = "n" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep", mode = "n" },
})

