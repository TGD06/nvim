return {
  {
    "neovim/nvim-lspconfig", -- still needed for server definitions
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("clangd", {
        capabilities = capabilities,
      })

      vim.lsp.enable("clangd")
    end,
  },
}

