return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    opts = {
        disable_in_visualblock = true, -- disable when insert after visual block mode
    }
}
