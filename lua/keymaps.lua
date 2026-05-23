
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
-- Telescope Current Buffer
vim.keymap.set('n', '<leader>/', ':Telescope current_buffer_fuzzy_find<CR>', { desc = 'Fuzzy find in current buffer' })
----------------------------------------------------------------------------------------------------

-- Tabs
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open New Tab" })

-----------------------------------------------------------------------------------------------------

-- Zathura 
vim.keymap.set("n", "<leader>lz", function()
  local pdf = vim.fn.expand("%:r") .. ".pdf"
  vim.fn.jobstart({"zathura", pdf}, {detach = true})
end, { desc = "Open PDF in Zathura" })

-- Typst Compile
vim.keymap.set("n", "<leader>lc", function()
  vim.cmd("!typst compile %")
end, { desc = "Typst Compile Current File" })
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
    cwd = vim.fn.expand("~/Obsidian/notes"), -- Replace with your vault path
  })
end, { desc = "Search Obsidian Vault" })

vim.keymap.set('n', '<Leader>of', function()
  require('telescope.builtin').find_files({
    prompt_title = "Find Obsidian Note",
    cwd = vim.fn.expand("~/Obsidian/notes"), -- Replace with your vault path
  })
end, { desc = "Find Obsidian Note" })

vim.keymap.set("n", "<leader>ot", ":ObsidianTemplate<CR>", { desc = "Insert Obsidian template" })
vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { desc = "New Note Title" })
vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>", { desc = "Open Note in obsidian" })
vim.keymap.set("n", "<leader>od", ":ObsidianToday<CR>", { desc = "Daily Note" })

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
