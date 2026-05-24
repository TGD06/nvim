require("nvim-tree").setup({
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  view = {
    width = 30,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
    },
  },
  filters = {
    dotfiles = false,
  },
})
