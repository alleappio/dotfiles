return { 
  "navarasu/onedark.nvim", 
  priority = 1000, 
  config = true, 
  opts = ...,

  config = function()
    require('onedark').setup {
      style = 'darker'
    }
    require('onedark').load()
  end
}
