return { 
  "ericvw/nordtheme-vim", 
  priority = 1000, 
  config = true, 
  opts = ...,

  config = function()
    vim.cmd("colorscheme nord")
  end
}
