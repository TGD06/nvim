-- Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Import lazy
require("config.lazy")

-- Colorscheme
vim.cmd[[colorscheme default]]

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

-- Shift Q quit nvim
vim.keymap.set("n", "Q", ":q<CR>", { desc = "Quit Neovim" })

-- Navigate to the next tab
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", { desc = "Next Tab" })

-- Navigate to the previous tab
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { desc = "Previous Tab" })

-- Close the current tab
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close Tab" })

-- Open a new tab
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open New Tab" })

-- Vimtex
vim.keymap.set("n", "<leader>lc", ":VimtexCompile<CR>", { desc = "Compile LaTeX" })
vim.keymap.set("n", "<leader>lv", ":VimtexView<CR>", { desc = "View PDF" })

-- Buffer Navigation
vim.keymap.set('n', '<Leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<Leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<Leader>bc', ':bd<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<Leader>bo', ':enew<CR>', { desc = 'New buffer' })

-- Splits
vim.keymap.set('n', '<Leader>sh', ':split<CR>', { desc = 'Horizontal split' })
vim.keymap.set('n', '<Leader>sv', ':vsplit<CR>', { desc = 'Vertical split' })

-- Move Between Splits
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { silent = true })

-- Resize Splits
vim.keymap.set('n', '<Leader>+', ':resize +5<CR>', { desc = 'Increase split height' })
vim.keymap.set('n', '<Leader>_', ':resize -5<CR>', { desc = 'Decrease split height' })
vim.keymap.set('n', '<Leader>-', ':vertical resize -5<CR>', { desc = 'Decrease split width' })
vim.keymap.set('n', '<Leader>=', ':vertical resize +5<CR>', { desc = 'Increase split width' })

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

-- LuaSnip
-- In your init.lua or a separate snippets.lua file
require("luasnip").setup({
  history = true,
  updateevents = "TextChanged,TextChangedI",
})

-- Optional: Load friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()
vim.keymap.set({"i", "s"}, "<Tab>", function()
  if require("luasnip").expand_or_jumpable() then
    return "<Plug>luasnip-expand-or-jump"
  else
    return "<Tab>"
  end
end, {expr = true})

vim.keymap.set({"i", "s"}, "<S-Tab>", function()
  if require("luasnip").jumpable(-1) then
    return "<Plug>luasnip-jump-prev"
  else
    return "<S-Tab>"
  end
end, {expr = true})

--- Move File
vim.keymap.set("n", "<leader>fm", function()
  -- Get the current file name without path
  local current_file = vim.fn.expand("%:t")
  
  -- Get the current working directory (where nvim was opened)
  local cwd = vim.fn.getcwd() .. "/"
  
  -- Use vim.ui.input with default value being the current directory
  vim.ui.input({ 
    prompt = "Move to folder: ", 
    default = cwd,
    completion = "dir" -- Enable directory path completion
  }, function(destination)
    if destination then
      -- Ensure destination has trailing slash
      if not destination:match("/$") then
        destination = destination .. "/"
      end
      
      -- Get full path of current file
      local current_path = vim.fn.expand("%:p")
      
      -- Build the full destination path
      local target_path = destination .. current_file
      
      -- Execute the move using vim's rename function
      local success, err = os.rename(current_path, target_path)
      
      if success then
        -- Open the moved file
        vim.cmd("edit " .. target_path)
        vim.notify("File moved to " .. target_path, vim.log.levels.INFO)
      else
        vim.notify("Failed to move file: " .. (err or "unknown error"), vim.log.levels.ERROR)
      end
    end
  end)
end, { desc = "Move current file to different folder" })

