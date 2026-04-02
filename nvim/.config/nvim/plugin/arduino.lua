vim.pack.add({"https://github.com/yuukiflow/Arduino-Nvim"})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "arduino",
    callback = function()
        require("Arduino-Nvim")
    end,
})
