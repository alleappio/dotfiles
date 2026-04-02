vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
})

require('render-markdown').setup({
    completions = { lsp = { enabled = true } },
    file_types = { 'markdown', 'copilot-chat' },
    heading = {
        backgrounds = {
            nil,
            nil,
            nil,
            nil,
            nil,
            nil,
        },
    },
    latex = {
        enabled = false,
    },
})

-- Enable wrapping for text and markdown files
local text_wrap_group = vim.api.nvim_create_augroup('TextWrap', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = text_wrap_group,
  pattern = {
        'text',
        'markdown',
        'md',
        'tex',
        'rst',
    },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true  -- optional: break at word boundaries
  end,
})
