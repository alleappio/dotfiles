-- VIM OPTIONS
-- Use system clipboard for all yank/delete/paste operations
vim.opt.clipboard = "unnamedplus"

-- Set indentation width to 4 spaces with smart tab behavior
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

-- Convert tabs to spaces
vim.opt.expandtab = true

-- Set tab display width to 8 and disable softtabstop
vim.opt.tabstop = 8
vim.opt.softtabstop = 0

-- Enable absolute line numbers
vim.opt.number = true

-- Enable relative line numbers
vim.opt.relativenumber = true

-- Keep 15 lines visible above and below cursor when scrolling
vim.opt.scrolloff = 15

-- Always show sign column to prevent text shifting
vim.opt.signcolumn = "yes"

-- Automatically indent new lines based on previous line
vim.opt.autoindent = true

-- Automatically reload files changed outside of Neovim
vim.opt.autoread = true

-- Set cursor to vertical bar when leaving Neovim
vim.api.nvim_create_autocmd("VimLeave", { pattern = "*", command = "set guicursor=a:ver25" })

-- Enable 24-bit RGB color support in terminal
vim.opt.termguicolors = true

-- Use dark background for color schemes
vim.opt.background = "dark"

-- Always show tabline
vim.opt.showtabline = 2

-- Use global statusline for all windows
vim.opt.laststatus = 3

-- Disable line wrapping
vim.opt.wrap = false

-- Use rounded borders for floating windows
vim.opt.winborder = "rounded"

-- Ignore case in search patterns
vim.o.ignorecase = true

-- Override ignorecase if search pattern contains uppercase
vim.o.smartcase = true

-- Open vertical splits to the right
vim.o.splitright = true

-- Open horizontal splits below
vim.o.splitbelow = true

-- Show confirmation dialog for unsaved changes
vim.o.confirm = true

-- Set cursor line
vim.opt.cursorline = true

-- Disable diagnostic display signs (they are annoying)
local severity = vim.diagnostic.severity
vim.diagnostic.enable = true
vim.diagnostic.config({
    signs = {
        text = {
            [severity.ERROR] = "",
            [severity.WARN] = "",
            [severity.INFO] = "",
            [severity.HINT] = "",
        },
    },
})
