return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter'},
    config = function()
        require('render-markdown').setup({
            completions = { lsp = { enabled = true } },
            file_types = { 'markdown', 'copilot-chat' },
            heading = {
                backgrounds = {
                    nil,
                    nil,
                    nil,
                    nil,
                    nil,
                    nil,
                },
            },
            latex = {
                enabled = false,
            },
        })
    end,
}
