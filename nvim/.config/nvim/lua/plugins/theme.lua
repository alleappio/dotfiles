vim.pack.add({
    {
        src="https://github.com/rose-pine/neovim.git",
        name="rose-pine"
    }
})

require('rose-pine').setup()

vim.cmd.colorscheme("rose-pine")

