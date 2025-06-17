
-- File: ~/.config/nvim/lua/plugins/rose-pine.lua
return {
    "rose-pine/neovim",
    name = "rose-pine", -- Optional name for clarity
    config = function()
        require("rose-pine").setup({
            dark_variant = "main", -- Options: 'main', 'moon', 'dawn'
            disable_background = false, -- Set true for transparent background
            disable_float_background = false,
            bold_vert_split = false,
        })
    end,
}
