-- return {
--   "navarasu/onedark.nvim",
--   --priority = 1000,
--   config = true,
--   opts = ...,
-- 
--   config = function()
--     require('onedark').setup {
--       style = 'darker'
--     }
--     require('onedark').load()
--   end
-- }
return{
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
  lazy=true,
  config = function()
    require("onedarkpro").setup({
      colors = {
        onedark = {
          bg = "#282C34"
        }
      }
    })
  end
}

