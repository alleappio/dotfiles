vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.o.verbose = 1

vim.api.nvim_create_user_command("Packupdate", function()
    vim.pack.update()
end, {})

require("vim-options")
vim.schedule(function()
    require("keybindings")
end)
require("terminal_emulator")
