require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".git/" },
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
  },
})
