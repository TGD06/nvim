local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- Snippets List
ls.add_snippets("all", {
  -- Date Snippet
  s("date", { t(os.date("%Y-%m-%d")) }),
  })

-- md
ls.add_snippets("markdown", {
  -- Markdown Snippet for LaTeX notes
  s("hl", { t("=="), i(1, "text"), t("==") }),
  s("bf", { t("**"), i(1, "text"), t("**"), i(0) }),
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

--tex
ls.add_snippets("latex", {
  -- Bold text
  s("bf", {
    t("\\textbf{"),
    i(1, "text"),
    t("}"),
  }),
  -- Italic text  
  s("it", {
    t("\\textit{"),
    i(1, "text"),
    t("}"),
  }),
  -- Enumerate environment
  s("enum", {
    t("\\begin{enumerate}[label=\\"),
    i(1, "alph*)"),
    t({"]", "\t\\item "}),
    i(2, "first item"),
    t({"", "\\end{enumerate}"}),
    i(0), -- Final cursor position
  }),
  -- Square Root
  s("sqrt", {
    t("\\sqrt{"),
    i(1, "expression"),
    t("}"),
  }),
  -- Fractions
  s("frac", {
    t("\\frac{"),
    i(1, "numerator"), -- Placeholder for numerator
    t("}{"),
    i(2, "denominator"), -- Placeholder for denominator
    t("}"),
  }),
})

--typ
ls.add_snippets("typst", {

  s("bf", { t("*"), i(1, "text"), t("*") }),
  s("mt", { t("$"), i(1, "equation"), t("$") }),
  s("it", { t("_"), i(1, "text"), t("_") }),
  s("linebreak", { t("#line(length: 100%)") }),
  s("block", { t("$"), t({"", ""}), i(1, "equation"), t({"", "$"}) }),

  s("enum", { t('#set enum(numbering: "'), i(1, 'a)'), t({'", start: '}), i(2, '1'), t({')'}) }),
  s({trig = "dpdt", name = "dP/dt", wordTrig = true},{ t({ "(d P)/(d t)" }) }),
  s({trig = "dxdt", name = "dx/dt"}, { t({ "(d x)/(d t)" }) } ),
  s({trig = "dydt", name = "dx/dt"}, { t({ "(d y)/(d t)" }) } ),
  s({trig = "int", name = "integral"}, { t({ "integral" }) } ),
  s({trig = "dd", name = "dif (proper differential)"}, { t("dif") } ),

})
