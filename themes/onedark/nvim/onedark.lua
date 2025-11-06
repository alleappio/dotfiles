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
