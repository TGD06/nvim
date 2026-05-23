require("obsidian").setup({
  dir = "~/Obsidian/notes/",
  templates = {
    folder = "bin/templates",
  },
  daily_notes = {
    folder = "bin/daily notes",
    template = "Daily Note Template.md",
  },
  notes_subdir = "bin",
  new_notes_location = "notes_subdir",
  note_frontmatter_func = function(note)
    local out = {}
    if note.metadata then
      out.id       = note.metadata.id or note.id
      out.aliases  = note.metadata.aliases or note.aliases
      out.tags     = note.metadata.tags or note.tags
      out.date     = note.metadata.date or os.date("%Y-%m-%d")
      out.Section  = note.metadata.Section
      out.Room     = note.metadata.Room
      out.Time     = note.metadata.Time
      out.Instructor       = note.metadata.Instructor
      out.Email            = note.metadata.Email
      out["Office Hours"]  = note.metadata["Office Hours"]
    else
      out.id      = note.id
      out.aliases = note.aliases
      out.tags    = note.tags
      out.date    = os.date("%Y-%m-%d")
    end
    return out
  end,
})
