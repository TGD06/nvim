
local M = {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {"python", "lua"},  -- make sure Python is listed here
            highlight = {
                enable = true,  -- Enable Tree-sitter syntax highlighting
                additional_vim_regex_highlighting = false,  -- Disable Vim's built-in highlighting for better performance
            },
        }
    end
}

return { M }
