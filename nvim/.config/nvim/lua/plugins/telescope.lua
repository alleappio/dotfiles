vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
})

local telescope_builtin = require('telescope.builtin')
require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<C-y>'] = function(prompt_bufnr)
                    local actions = require('telescope.actions')
                    local action_state = require('telescope.actions.state')
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

function telescope_find_files()
    telescope_builtin.find_files()
end
function telescope_find_files_hidden()
    telescope_builtin.find_files({ hidden = true })
end
function telescope_live_grep()
    telescope_builtin.live_grep({})
end
function telescope_live_grep_hidden()
    telescope_builtin.live_grep({ hidden = true, no_ignore = true })
end
function telescope_keymaps()
    telescope_builtin.keymaps({ hidden = true, no_ignore = true })
end
