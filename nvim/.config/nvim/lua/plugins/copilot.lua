vim.pack.add({
    'https://github.com/github/copilot.vim',
    'https://github.com/olimorris/codecompanion.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
})

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ''
vim.g.copilot_enabled = false

require('codecompanion').setup({
    adapters = {
        copilot = function()
            return require('codecompanion.adapters').extend('copilot', {
                schema = {
                    model = {
                        default = 'gemini-3-flash-preview',
                    },
                },
            })
        end,
    },
    strategies = {
        chat = {
            adapter = 'copilot',
        },
        inline = {
            adapter = 'copilot',
        },
    },
    interactions = {
        chat = {
            adapter = 'copilot',
            model = 'gemini-3-flash-preview',
            opts = {
                completion_provider = "blink",
            }
        },
    },
    display = {
        chat = {
            auto_scroll = true,
            window = {
                width = 80,
            }
        }
    }
})
