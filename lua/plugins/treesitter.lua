require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "python", "javascript", "matlab", "cpp", "c", "typst" },
  highlight = { enable = true },
  indent = { enable = true },
})
