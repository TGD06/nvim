-- Line wrap for writing filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typst", "markdown", "tex", "latex", "plaintex" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
  end,
})

-- Python indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.expandtab = true
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.opt.textwidth = 79
    vim.opt.colorcolumn = "80"
  end,
})

-- C/C++ indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c", "h", "hpp" },
  callback = function()
    vim.bo.expandtab = true
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.opt.textwidth = 100
    vim.opt.colorcolumn = "100"
  end,
})

-- Help window to vertical split
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.txt",
  callback = function()
    if vim.bo.filetype == "help" then
      vim.cmd("wincmd L")
    end
  end,
})

-- Spell check for writing filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "tex", "typst" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us" }
  end,
})
