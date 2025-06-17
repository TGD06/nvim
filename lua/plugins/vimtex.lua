
return {
  -- Other plugins...

  {
    "lervag/vimtex",
    ft = { "tex" }, -- Load only for TeX files
    config = function()
      vim.g.vimtex_view_method = "zathura" -- Use Zathura as the PDF viewer
      vim.g.vimtex_compiler_method = "latexmk" -- Use latexmk for compilation
      vim.g.tex_flavor = "latex" -- Default to LaTeX
      vim.g.vimtex_quickfix_mode = 0 -- Disable quickfix by default
      vim.g.vimtex_compiler_prog = 'bash'
    end,
  },
}
