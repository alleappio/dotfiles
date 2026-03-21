return {
    "ciocapiat02/pandoc.nvim",
    branch="dev",

    config = function ()
       require("pandoc-nvim").setup({
           auto_open=true,
           html_template="template.html",
           default_export_path = "./pandoc_output/", -- default path in which the export file will be put
           enable_katex = true, -- whether to add or not the --katex flag
           self_contained = true
       }) 
    end
}
