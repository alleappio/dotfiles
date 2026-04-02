local logo = [[

    o    o                       o
    8b   8
    8`b  8 .oPYo. .oPYo. o    o o8 ooYoYo.
    8 `b 8 8oooo8 8    8 Y.  .P  8 8' 8  8
    8  `b8 8.     8    8 `b..d'  8 8  8  8
    8   `8 `Yooo' `YooP'  `YP'   8 8  8  8
    ..:::..:.....::.....:::...:::....:..:..
    :::::::::::::::::::::::::::::::::::::::
    :::::::::::::::::::::::::::::::::::::::
]]

vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvimdev/dashboard-nvim",
})

local fortune = vim.system({ "fortune", "-s" }, { text = true }):wait()

fortune = vim.split(fortune.stdout:gsub("\t", ""), "\n")

require("dashboard").setup({
    theme = "doom",
    config = {
        header = vim.split(logo, "\n"),
        center = {},
        footer = #fortune > 0 and fortune or { "Hello there!\n\t- General Kenobi" },
        -- footer = {"Hello there!"}
    },
})
