local fortune = vim.system({ "fortune", "-s" }, { text = true }):wait()
fortune = fortune.stdout:gsub("\t", ""):gsub("\n", " ")
print(#fortune > 0 and fortune or { "Hello there!\n\t- General Kenobi" })
