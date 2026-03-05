return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
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
    end
  },
}
