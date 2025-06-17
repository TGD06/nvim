local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- Snippets List
ls.add_snippets("all", {
  -- Date Snippet
  s("date", { t(os.date("%Y-%m-%d")) }),

  -- Markdown Snippet for LaTeX notes
  s("bf", { t("**"), i(1, "text"), t("**") }),
  s("it", { t("*"), i(1, "text"), t("*") }),
  s("mt", { t("$"), i(1, "equation"), t("$") }),
  s("block", { t("$$"), t({"", ""}), i(1, "equation"), t({"", "$$"}) }),

  s("sqrt", {
    t("\\sqrt{"),
    i(1, "expression"),
    t("}"),
  }),

  s("frac", {
    t("\\frac{"),
    i(1, "numerator"), -- Placeholder for numerator
    t("}{"),
    i(2, "denominator"), -- Placeholder for denominator
    t("}"),
  }),

})

