return{
    'ntpeters/vim-better-whitespace',
    dependencies = {},
    config = function ()
      vim.keymap.set('n', '<leader>w', ':ToggleWhitespace<CR>', {})
      vim.cmd("DisableWhitespace")
    end
};
