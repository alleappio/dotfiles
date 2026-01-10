local markdown_browser_preview = function()
    if vim.bo.filetype ~= "markdown" then
        print("This command can only be used in Markdown files.")
        return
    end
    local filepath = vim.fn.expand("%:p")
    print("Opening Markdown preview for: " .. filepath)
    vim.cmd("!firefox \"" .. filepath .. "\"")
end

vim.api.nvim_create_user_command("MarkdownBrowserPreview", function(opts)
    markdown_browser_preview()
end, {})
