local ls = require("luasnip")

-- Load your snippets from lua/snippets/
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })
