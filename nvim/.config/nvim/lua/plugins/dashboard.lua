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

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
        theme = 'doom',
        config = {
            header = vim.split(logo, "\n"),
            center={},
            footer = {"Hello there!"}
        }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
