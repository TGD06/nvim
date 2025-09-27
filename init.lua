-- Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Swap File
vim.o.swapfile = false

-- Import lazy
require("config.lazy")

-- colorscheme
vim.cmd[[colorscheme nord]]

-- Nvim options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

-- Set other options as needed
vim.cmd [[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
]]

-- Tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

-- Map Ctrl + S to save the current file
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true }) -- Normal mode
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true, silent = true }) -- Insert mode
vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true }) -- Visual mode

-----------------------------------------------------------------------------------------------------

-- Shift Q quit nvim
vim.keymap.set("n", "Q", ":q<CR>", { desc = "Quit Neovim" })

-----------------------------------------------------------------------------------------------------

-- Tabs
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open New Tab" })

-----------------------------------------------------------------------------------------------------

-- Vimtex
vim.keymap.set("n", "<leader>lc", ":VimtexCompile<CR>", { desc = "Compile LaTeX" })
vim.keymap.set("n", "<leader>lv", ":VimtexView<CR>", { desc = "View PDF" })

-----------------------------------------------------------------------------------------------------

-- Buffer Navigation
vim.keymap.set('n', '<Leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<Leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<Leader>bc', ':bd<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<Leader>bo', ':enew<CR>', { desc = 'New buffer' })

-----------------------------------------------------------------------------------------------------

-- Splits
vim.keymap.set('n', '<Leader>sh', ':split<CR>', { desc = 'Horizontal split' })
vim.keymap.set('n', '<Leader>sv', ':vsplit<CR>', { desc = 'Vertical split' })

-----------------------------------------------------------------------------------------------------

-- Move Between Splits
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { silent = true })

-----------------------------------------------------------------------------------------------------

-- Resize Splits
vim.keymap.set('n', '<Leader>+', ':resize +5<CR>', { desc = 'Increase split height' })
vim.keymap.set('n', '<Leader>_', ':resize -5<CR>', { desc = 'Decrease split height' })
vim.keymap.set('n', '<Leader>-', ':vertical resize -5<CR>', { desc = 'Decrease split width' })
vim.keymap.set('n', '<Leader>=', ':vertical resize +5<CR>', { desc = 'Increase split width' })

-----------------------------------------------------------------------------------------------------

--- Obsidian
vim.keymap.set('n', '<Leader>og', function()
  require('telescope.builtin').live_grep({
    prompt_title = "Search Obsidian Vault",
    cwd = vim.fn.expand("~/Obsidian/Notes"), -- Replace with your vault path
  })
end, { desc = "Search Obsidian Vault" })

vim.keymap.set('n', '<Leader>of', function()
  require('telescope.builtin').find_files({
    prompt_title = "Find Obsidian Note",
    cwd = vim.fn.expand("~/Obsidian/Notes"), -- Replace with your vault path
  })
end, { desc = "Find Obsidian Note" })

vim.keymap.set("n", "<leader>ot", ":ObsidianTemplate<CR>", { desc = "Insert Obsidian template" })
vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { desc = "New Note Title" })
vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>", { desc = "Open Note in obsidian" })
vim.keymap.set("n", "<leader>od", ":ObsidianToday<CR>", { desc = "Daily Note" })

-----------------------------------------------------------------------------------------------------

-- CS 149 additions
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.bo.expandtab = true  -- Use spaces instead of tabs
        vim.bo.tabstop = 4       -- Number of spaces for a tab
        vim.bo.shiftwidth = 4    -- Number of spaces for autoindent
        vim.bo.softtabstop = 4   -- Number of spaces when pressing <Tab>
	vim.opt.textwidth = 79
	vim.opt.colorcolumn = "80"
    end,
})


-----------------------------------------------------------------------------------------------------

-- LuaSnip
local ls = require("luasnip")

-- vim.keymap.set({"i"}, "Tab>", function() ls.expand() end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<Tab>", function() ls.jump( 1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i"}, "<Tab>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	else
		-- Fallback to normal Tab behavior - this should work for getting out of snippets
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
	end
end, {silent = true})

vim.keymap.set({"i", "s"}, "<S-Tab>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	else
		-- Fallback to normal Shift-Tab behavior
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", false)
	end
end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

-----------------------------------------------------------------------------------------------------

-- Auto move help windows to a vertical split on the right
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.txt",
  callback = function()
    if vim.bo.filetype == "help" then
      vim.cmd("wincmd L") -- move help window to far right
    end
  end,
})


-----------------------------------------------------------------------------------------------------

-- Spell Check
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "tex", "typst" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us" }
  end,
})
