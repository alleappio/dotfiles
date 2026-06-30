vim.pack.add({ 'https://github.com/felipefdl/warm-burnout' })
vim.opt.rtp:append(vim.pack.get({'warm-burnout'})[1].path .. "/nvim")
vim.cmd.colorscheme("warm-burnout-dark")
