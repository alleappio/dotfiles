vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
    'http://github.com/nvim-tree/nvim-web-devicons',
})

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local telescope_builtin = require('telescope.builtin')
local telescope_themes = require('telescope.themes')

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

        theme = "ivy",

        sorting_strategy = "ascending",

        layout_strategy = "bottom_pane",
        layout_config = {
          height = 25,
        },

        border = true,
        borderchars = {
          prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
          results = { " " },
          -- preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          preview = { " ", "│", " ", "│", " ", " ", " ", " " },
        },
    },
})

function telescope_find_files()
    telescope_builtin.find_files({ hidden = true, no_ignore = true, preview = false })
end
function telescope_live_grep()
    telescope_builtin.live_grep({ hidden = true, no_ignore = true, preview = true})
end
function telescope_keymaps()
    telescope_builtin.keymaps({ hidden = true, no_ignore = true, preview = true})
end
