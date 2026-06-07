vim.g.mapleader = " "

vim.g.maplocalleader = " "

vim.o.swapfile = false

vim.opt.termguicolors = true

vim.opt.number = true

vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"

vim.opt.conceallevel = 1

vim.opt.wrap = false

vim.cmd[[colorscheme xcodedark]]

require('vim._core.ui2').enable({})   

-- Set background to same as terminal background
vim.cmd [[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight Conceal guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
]]

-- Disable line wrap globally by default
vim.opt.wrap = false

-- Enable line wrap for specific file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typst", "markdown", "tex", "latex", "plaintex" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true  -- Break at word boundaries
    vim.opt_local.breakindent = true  -- Preserve indentation in wrapped lines
  end,
})
