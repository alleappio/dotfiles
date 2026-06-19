vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
})

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local telescope_builtin = require('telescope.builtin')

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

function telescope_find_files()
    telescope_builtin.find_files(require('telescope.themes').get_ivy({ hidden = true, no_ignore = true, preview = false, layout_config = { height = 20 } }))
end
function telescope_live_grep()
    telescope_builtin.live_grep(require('telescope.themes').get_ivy({ hidden = true, no_ignore = true, preview = true, layout_config = { height = 20 } }))
end
function telescope_keymaps()
    telescope_builtin.keymaps(require('telescope.themes').get_ivy({ hidden = true, no_ignore = true, preview = true, layout_config = { height = 20 } }))
end
