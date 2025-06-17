
return {
  -- other plugins...
  {
    "epwalsh/obsidian.nvim",
    config = function()
      require("obsidian").setup({
        -- Path to your vault directory
        dir = "~/Obsidian/Notes/",

	disable_frontmatter = true, 
        -- Ensure new notes use the link text as the filename
        note_id_func = function(title)
          return title or "Untitled" -- If no title is given, default to "Untitled"
        end,

	templates = {
		folder = "04 Archives/Templates"
	},
	daily_notes = {
		folder = "00 Daily Notes",
		template = "04 Archives/Templates/Daily Note Template.md",
	},

	notes_subdir = "04 Archives",
	new_notes_location = "notes_subdir",

      

      })

      -- Set conceallevel for enhanced UI (this should be set outside of the setup function)
      vim.opt.conceallevel = 1 -- Enables concealing of markdown syntax
      vim.opt.concealcursor = "" -- Conceal only in normal mode
    end,
  },
  -- other plugins...
}

