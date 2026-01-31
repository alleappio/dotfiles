-- Create an augroup for text wrapping
local text_wrap_group = vim.api.nvim_create_augroup('TextWrap', { clear = true })

-- Enable wrapping for text and markdown files
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
