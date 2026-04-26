    local wk = require("which-key")

    -- Bufferline navigation and close
    wk.add({
            { "<C-h>", "<cmd>bprevious<cr>", mode = "n" },
            { "<C-l>", "<cmd>bnext<cr>", mode = "n" },
            { "<C-c>", "<cmd>bd<cr>", mode = "n" },
    })

    -- Copilot
    wk.add({
            { "<leader>c", group = "Copilot" },
            { "<leader>cc", "<cmd>CopilotChatToggle<CR>", desc = "Open copilot chat", mode = { "n", "v" } },
            { "<leader>cm", "<cmd>CopilotChatModel<CR>", desc = "Choose copilot model", mode = "n" },
            { "<leader>ce", "<cmd>Copilot enable<CR>", desc = "Enable copilot suggestions", mode = "n" },
            { "<leader>cd", "<cmd>Copilot disable<CR>", desc = "Disable copilot suggestions", mode = "n" },
            {
                    "<C-j>",
                    'copilot#Accept("\\<CR>")',
                    mode = "i",
                    expr = true,
                    replace_keycodes = false,
                    desc = "Accept Copilot suggestion",
            },
    })

    -- Open file explorer
    wk.add({
        {
            "<leader>e",
            function()
                if vim.bo.filetype == "oil" then
                    require("oil").close()
                else
                    require("oil").open()
                end
            end,
            desc = "Open file explorer",
            mode = "n",
        },
    })

    -- Telescope keybindings
    local telescope_builtin = require("telescope.builtin")
    wk.add({
            { "<leader>f", group = "file" },
            {
                    "<leader>ff",
                    function()
                            telescope_builtin.find_files({ hidden = true })
                    end,
                    desc = "Find file",
                    mode = "n",
            },
            {
                    "<leader>fg",
                    function()
                            telescope_builtin.live_grep({ hidden = true })
                    end,
                    desc = "Live grep",
                    mode = "n",
            },
            { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers", mode = "n" },
            { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags", mode = "n" },
    })

    -- git stuff
    wk.add({
        { "<leader>g", group = "git"},
        { "<leader>gl", "<cmd>ResolveOurs<cr>", desc = "accept local changes in this conflict"},
        { "<leader>gr", "<cmd>ResolveTheirs<cr>", desc = "accept remote changes in this conflict"},
        { "<leader>gb", "<cmd>ResolveBoth<cr>", desc = "accept both changes in this conflict"},
        { "<leader>gn", "<cmd>ResolveNone<cr>", desc = "accept no change in this conflict"},
        { "<leader>gq", "<cmd>ResolveList<cr>", desc = "put conflict in quickfix list"},
    })

    -- lsp actions
    wk.add({
            { "<leader>l", group = "lsp" },
            { "<leader>la", vim.lsp.buf.code_action, desc = "lsp code actions", mode = "n" },
            { "<leader>lc", vim.diagnostic.open_float, desc = "lsp diagnostics", mode = "n" },
            { "<leader>ld", vim.lsp.buf.definition, desc = "lsp definition", mode = "n" },
            {
                    "<leader>lf",
                    function()
                            vim.lsp.buf.format()
                    end,
                    desc = "lsp format code",
                    mode = "n",
            },
            { "<leader>lh", vim.lsp.buf.hover, desc = "lsp hover", mode = "n" },
            { "<leader>lw", vim.lsp.buf.add_workspace_folder, desc = "lsp add workspace folder", mode = "n" },
    })

    -- Quickfix keybindings
    wk.add({
            { "<leader>q", group = "Quickfix" },
            { "<leader>qc", "<cmd>cclose<cr>", desc = "Close quickfix", mode = "n" },
            { "<C-j>", "<cmd>cnext<cr>", desc = "Next quickfix entry", mode = "n" },
            { "<C-k>", "<cmd>cprev<cr>", desc = "Prev quickfix entry", mode = "n" },
            { "<leader>qo", "<cmd>copen<cr>", desc = "Open quickfix", mode = "n" },
    })

    -- terminal stuff
    wk.add({
            { "<leader>t", group = "Terminal" },
            { "<leader>tt", "<cmd>TerminalEmulator<cr>", desc = "Open split terminal", mode = { "n", "t" }, },
            { "<leader>tf", "<cmd>:term<cr>", desc = "Open terminal fullscreen", mode = { "n", "t" }, },
            { "<esc><esc>", "<c-\\><c-n>", desc = "Go into normal mode from terminal", mode = "t" },
    })
