vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
})

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<C-y>'] = function(prompt_bufnr)
                    local entry = action_state.get_selected_entry()
                    actions.close(prompt_bufnr)
                    local path = vim.fn.fnamemodify(entry.path or entry.filename, ':.')
                    vim.fn.setreg('+', path)
                    vim.notify('Copied: ' .. path)
                end,
            },
        },
    },
})
