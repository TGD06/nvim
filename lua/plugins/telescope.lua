
return {
  -- Other plugins...

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find Help" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/" }, -- Ignore certain directories
          layout_config = {
            prompt_position = "top",
          },
          sorting_strategy = "ascending", -- Sort results in ascending order
        },
      })
    end,
  },
}
