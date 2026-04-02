vim.pack.add({
    "http://github.com/navarasu/onedark.nvim",
})

require('onedark').setup({
  -- style = 'darker'
})
require('onedark').load()
vim.cmd.colorscheme('onedark')

