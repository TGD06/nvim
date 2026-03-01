return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "python", "javascript", "matlab", "cpp", "c", "typst" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  -- optional extra plugin which depends on treesitter:
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
  },
}

