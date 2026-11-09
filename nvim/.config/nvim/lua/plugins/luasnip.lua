vim.pack.add({
    "https://github.com/L3MON4D3/LuaSnip"
})

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("cpp", {
    s("dbg_print", fmt(
        [[
        std::cout << "{}: " << {} << std::endl;
        ]], {
            i(1), rep(1)
        }
    ))
})
