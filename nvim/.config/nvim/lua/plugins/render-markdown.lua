return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    config = function()
        require('render-markdown').setup({
            completions = { lsp = { enabled = true } },
            preset = "obsidian",
            heading = {
                --border = true,
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
