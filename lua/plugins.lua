vim.pack.add({
  -- Colorschemes
  'https://github.com/arcticicestudio/nord-vim',
  'https://github.com/lunacookies/vim-colors-xcode', 

  -- Completion (swap these out if moving to blink.cmp)
  'https://github.com/hrsh7th/nvim-cmp',
  'https://github.com/hrsh7th/cmp-nvim-lsp',
  'https://github.com/hrsh7th/cmp-buffer',
  'https://github.com/hrsh7th/cmp-path',

  -- Snippets
  'https://github.com/L3MON4D3/LuaSnip',
  'https://github.com/saadparwaiz1/cmp_luasnip',

  -- Treesitter
  'https://github.com/nvim-treesitter/nvim-treesitter',

  -- Telescope
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-lua/plenary.nvim',

  -- File tree
  'https://github.com/nvim-tree/nvim-tree.lua',
  'https://github.com/nvim-tree/nvim-web-devicons',

  -- Tmux navigation
  'https://github.com/christoomey/vim-tmux-navigator',

  -- Editing
  'https://github.com/windwp/nvim-autopairs',
  'https://github.com/kylechui/nvim-surround',

  -- Writing / notes
  'https://github.com/epwalsh/obsidian.nvim',
  'https://github.com/lervag/vimtex',
})

-- load plugin configs
require('plugins.telescope')
require('plugins.nvim-tree')
require('plugins.cmp')          -- or blink if switching
require('plugins.luasnip')
require('plugins.obsidian')
require('plugins.tmuxnav')
require('plugins.autoclose')
require('plugins.nvim-surround')
