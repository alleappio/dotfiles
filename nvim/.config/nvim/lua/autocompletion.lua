vim.opt.autocomplete = true

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'minifiles', 'TelescopePrompt' },
    callback = function()
        vim.opt_local.autocomplete = false
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})

vim.opt.complete:append('o')
vim.opt.completeopt = {
    'menuone',
    'fuzzy',
    'noinsert',
    'popup',
}
vim.opt.pumheight = 5
vim.opt.pumborder = 'single'
vim.opt.winborder = 'single'
