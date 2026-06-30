vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

local statusline = require("mini.statusline")
statusline.section_mode({trunc_width=math.huge})
statusline.setup()
require("mini.tabline").setup({})
require("mini.trailspace").setup({})


