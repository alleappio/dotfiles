return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    config = function()
        require('render-markdown').setup({
            completions = { lsp = { enabled = true } },
            preset = "obsidian",
            heading = {
                border = true,
            },
            latex = {
                enabled = true,
                render_modes = false,
                converter = { 'utftex', 'latex2text' },
                highlight = 'RenderMarkdownMath',
                position = 'center',
                top_pad = 0,
                bottom_pad = 0,
            },
        })
    end,
}
