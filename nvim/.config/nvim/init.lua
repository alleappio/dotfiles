vim.g.start_time = vim.uv.now()
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.o.verbose = 0

vim.api.nvim_create_user_command("PackUpdate", function()
    vim.pack.update()
end, {})

vim.api.nvim_create_user_command("PackClean", function()
    local unused_packages = vim.iter(vim.pack.get())
        :filter(function(x) return not x.active end)
        :map(function(x) return x.spec.name end)
        :totable()
    vim.pack.del(unused_packages)
end, {})

require("plugins")

require("vim-options")
require("keybindings")
require("terminal_emulator")

require("welcome")
