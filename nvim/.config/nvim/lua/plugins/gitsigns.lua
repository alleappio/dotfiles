vim.pack.add({
    "https://github.com/lewis6991/gitsigns.nvim"
})

require("gitsigns").setup({
  signs_staged_enable = true,
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  auto_attach = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  sign_priority = 7,
  max_file_length = 5000, -- Disable if file is longer than this (in lines)
})
