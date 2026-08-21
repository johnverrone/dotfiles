return {
  "obsidian-nvim/obsidian.nvim",

  version = "*",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    workspaces = {
      { name = "notes", path = "~/notes" },
    },

    notes_subdir = "daily",
    new_notes_location = "notes_subdir",

    daily_notes = {
      folder = "daily",
      date_format = "%Y-%m-%d",
      template = "daily.md",
    },

    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      substitutions = {},
    },

    -- URLs are opened with vim.ui.open (see :h vim.ui.open).

    -- Human-readable filenames; no random zettel IDs.
    note_id_func = function(title)
      if title ~= nil and title ~= "" then
        return title:gsub("[^A-Za-z0-9 -]", ""):gsub(" ", "-"):lower()
      end
      return tostring(os.date("%Y-%m-%d-%H%M"))
    end,

    -- Don't let the plugin rewrite frontmatter on files it didn't create.
    frontmatter = {
      enabled = true,
      func = function(note)
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,
    },

    ui = { enable = true },
  },

  keys = {
    { "<leader>o", desc = "+obsidian" },
    { "<leader>od", "<cmd>Obsidian today<cr>", desc = "Daily note (today)" },
    { "<leader>oy", "<cmd>Obsidian yesterday<cr>", desc = "Daily note (yesterday)" },
    { "<leader>on", "<cmd>Obsidian new<cr>", desc = "New note" },
    { "<leader>of", "<cmd>Obsidian quick_switch<cr>", desc = "Find note" },
    { "<leader>os", "<cmd>Obsidian search<cr>", desc = "Search notes" },
    { "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Backlinks" },
    { "<leader>ot", "<cmd>Obsidian tags<cr>", desc = "Tags" },
    { "<leader>ol", "<cmd>Obsidian links<cr>", desc = "Links in note" },
    { "<leader>oo", "<cmd>Obsidian follow_link<cr>", desc = "Follow link" },
    { "<leader>or", "<cmd>Obsidian rename<cr>", desc = "Rename note (updates links)" },
    { "<leader>ox", "<cmd>Obsidian toggle_checkbox<cr>", desc = "Toggle checkbox" },
    { "<leader>oe", "<cmd>Obsidian extract_note<cr>", desc = "Extract selection to note", mode = "v" },
    { "<leader>oL", "<cmd>Obsidian link<cr>", desc = "Link selection to note", mode = "v" },
  },
}
