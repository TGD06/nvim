local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- ── C / C++ ────────────────────────────────────────────────────────────────
-- brew install llvm
vim.lsp.config("clangd", { capabilities = capabilities })
vim.lsp.enable("clangd")

-- ── Python ─────────────────────────────────────────────────────────────────
-- brew install basedpyright
vim.lsp.config("basedpyright", { capabilities = capabilities })
vim.lsp.enable("basedpyright")

-- ── Lua ────────────────────────────────────────────────────────────────────
-- brew install lua-language-server
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = { diagnostics = { globals = { "vim" } } }
  },
})
vim.lsp.enable("lua_ls")

-- ── Julia ──────────────────────────────────────────────────────────────────
-- install from within Julia: using Pkg; Pkg.add("LanguageServer")
vim.lsp.config("julials", { capabilities = capabilities })
vim.lsp.enable("julials")

-- ── Markdown ───────────────────────────────────────────────────────────────
-- brew install marksman
vim.lsp.config("marksman", { capabilities = capabilities })
vim.lsp.enable("marksman")

-- ── Typst ──────────────────────────────────────────────────────────────────
-- brew install tinymist
vim.lsp.config("tinymist", {
  capabilities = capabilities,
  settings = {
    formatterMode = "typstyle",
  },
})
vim.lsp.enable("tinymist")

-- ── LaTeX ──────────────────────────────────────────────────────────────────
-- brew install texlab
vim.lsp.config("texlab", { capabilities = capabilities })
vim.lsp.enable("texlab")

-- ── JavaScript / TypeScript ────────────────────────────────────────────────
-- brew install typescript-language-server
vim.lsp.config("ts_ls", { capabilities = capabilities })
vim.lsp.enable("ts_ls")

-- ── HTML / CSS ─────────────────────────────────────────────────────────────
-- npm install -g vscode-langservers-extracted
vim.lsp.config("html",   { capabilities = capabilities })
vim.lsp.config("cssls",  { capabilities = capabilities })
vim.lsp.enable("html")
vim.lsp.enable("cssls")
 
-- ── Keymaps (attach per buffer when LSP connects) ─────────────────────────
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local map = vim.keymap.set
    local buf = args.buf
    map("n", "gd",          vim.lsp.buf.definition,    { buffer = buf, desc = "Go to definition" })
    map("n", "gD",          vim.lsp.buf.declaration,   { buffer = buf, desc = "Go to declaration" })
    map("n", "gr",          vim.lsp.buf.references,    { buffer = buf, desc = "References" })
    map("n", "gi",          vim.lsp.buf.implementation,{ buffer = buf, desc = "Go to implementation" })
    map("n", "K",           vim.lsp.buf.hover,         { buffer = buf, desc = "Hover docs" })
    map("n", "<leader>rn",  vim.lsp.buf.rename,        { buffer = buf, desc = "Rename" })
    map("n", "<leader>ca",  vim.lsp.buf.code_action,   { buffer = buf, desc = "Code action" })
    map("n", "<leader>d",   vim.diagnostic.open_float, { buffer = buf, desc = "Open diagnostic" })
    map("n", "[d",          vim.diagnostic.goto_prev,  { buffer = buf, desc = "Prev diagnostic" })
    map("n", "]d",          vim.diagnostic.goto_next,  { buffer = buf, desc = "Next diagnostic" })
  end,
})
