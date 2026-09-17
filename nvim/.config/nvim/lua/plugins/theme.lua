vim.pack.add({
    "https://github.com/blazkowolf/gruber-darker.nvim",
})

vim.api.nvim_set_hl(0, 'MiniStatuslineModeNormal', { link = 'MiniHipatternsHack' })
vim.cmd.colorscheme("gruber-darker")

