return {
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    opts = {
      -- Resolve whichever `node` is on PATH at startup (fsdev toolchain, nvm, etc.)
      -- rather than hardcoding a version-specific path that breaks on upgrades.
      copilot_node_command = vim.fn.exepath("node"),
    },
  },

  -- Remove Copilot status indicator from statusline (always enabled, just noise)
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      -- The copilot extra inserts a status icon into lualine_x.
      -- Remove any component whose function returns the Copilot icon.
      local copilot_icon = LazyVim.config.icons.kinds.Copilot
      opts.sections.lualine_x = vim.tbl_filter(function(comp)
        if type(comp) == "table" and type(comp[1]) == "function" then
          local ok, result = pcall(comp[1])
          if ok and result == copilot_icon then
            return false
          end
        end
        return true
      end, opts.sections.lualine_x or {})
    end,
  },
}
