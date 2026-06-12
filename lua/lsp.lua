local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- ── C / C++ ────────────────────────────────────────────────────────────────
vim.lsp.config("clangd", {
  capabilities = capabilities,
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_markers = { "compile_commands.json", "CMakeLists.txt", ".clangd", ".git" },
})
vim.lsp.enable("clangd")

-- ── Python ─────────────────────────────────────────────────────────────────
vim.lsp.config("pyright", {
  capabilities = capabilities,
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
})
vim.lsp.enable("pyright")

-- ── Lua ────────────────────────────────────────────────────────────────────
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})
vim.lsp.enable("lua_ls")

-- ── Markdown ───────────────────────────────────────────────────────────────
vim.lsp.config("marksman", {
  capabilities = capabilities,
  cmd = { "marksman", "server" },
  filetypes = { "markdown" },
  root_markers = { ".marksman.toml", ".git" },
})
vim.lsp.enable("marksman")

-- ── Typst ──────────────────────────────────────────────────────────────────
vim.lsp.config("tinymist", {
  capabilities = capabilities,
  cmd = { "tinymist" },
  filetypes = { "typst" },
  root_markers = { ".git" },
  settings = { formatterMode = "typstyle" },
})
vim.lsp.enable("tinymist")

-- ── LaTeX ──────────────────────────────────────────────────────────────────
vim.lsp.config("texlab", {
  capabilities = capabilities,
  cmd = { "texlab" },
  filetypes = { "tex", "bib" },
  root_markers = { ".git" },
})
vim.lsp.enable("texlab")

-- ── JavaScript / TypeScript ────────────────────────────────────────────────
vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
})
vim.lsp.enable("ts_ls")

-- ── HTML ───────────────────────────────────────────────────────────────────
vim.lsp.config("html", {
  capabilities = capabilities,
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  root_markers = { ".git" },
})
vim.lsp.enable("html")

-- ── CSS ────────────────────────────────────────────────────────────────────
vim.lsp.config("cssls", {
  capabilities = capabilities,
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_markers = { ".git" },
})
vim.lsp.enable("cssls")

-- ── MATLAB ─────────────────────────────────────────────────────────────────
vim.lsp.config("matlab_ls", {
  capabilities = capabilities,
  cmd = {
    "node",
    vim.fn.expand("~/.local/share/MATLAB-language-server/out/index.js"),
    "--stdio",
  },
  filetypes = { "matlab" },
  root_markers = { ".git", "." },
  settings = {
    MATLAB = {
      indexWorkspace = true,
      installPath = "/Applications/MATLAB_R2024a.app", -- adjust to your MATLAB.app path
      matlabConnectionTiming = "never",
    },
  },
})
vim.lsp.enable("matlab_ls")

-- ── Keymaps (attach per buffer when LSP connects) ─────────────────────────
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local map = vim.keymap.set
    local buf = args.buf
    map("n", "gd",         vim.lsp.buf.definition,     { buffer = buf, desc = "Go to definition" })
    map("n", "gD",         vim.lsp.buf.declaration,    { buffer = buf, desc = "Go to declaration" })
    map("n", "gr",         vim.lsp.buf.references,     { buffer = buf, desc = "References" })
    map("n", "gi",         vim.lsp.buf.implementation, { buffer = buf, desc = "Go to implementation" })
    map("n", "K",          vim.lsp.buf.hover,          { buffer = buf, desc = "Hover docs" })
    map("n", "<leader>rn", vim.lsp.buf.rename,         { buffer = buf, desc = "Rename" })
    map("n", "<leader>ca", vim.lsp.buf.code_action,    { buffer = buf, desc = "Code action" })
    map("n", "<leader>d",  vim.diagnostic.open_float,  { buffer = buf, desc = "Open diagnostic" })
    map("n", "[d",         vim.diagnostic.goto_prev,   { buffer = buf, desc = "Prev diagnostic" })
    map("n", "]d",         vim.diagnostic.goto_next,   { buffer = buf, desc = "Next diagnostic" })
    end,
})
