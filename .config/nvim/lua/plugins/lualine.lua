-- Custom lualine config based on the bubbles theme
-- Overrides LazyVim's default lualine configuration

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },
  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },
  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local icons = LazyVim.config.icons

      return {
        options = {
          theme = bubbles_theme,
          component_separators = "",
          section_separators = { left = "", right = "" },
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = string.lower,
              separator = { left = "" },
              padding = { left = 1, right = 2 },
              draw_empty = true,
            },
          },
          lualine_b = {
            "branch",
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_c = {
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            {
              function(self)
                local path = vim.fn.expand("%:p") --[[@as string]]
                if path == "" then
                  return ""
                end

                local root = LazyVim.root.get({ normalize = true })
                local cwd = LazyVim.root.cwd()

                if path:find(cwd, 1, true) == 1 then
                  path = path:sub(#cwd + 2)
                elseif path:find(root, 1, true) == 1 then
                  path = path:sub(#root + 2)
                end

                local sep = "/"
                local parts = vim.split(path, "[\\/]")

                -- Shorten middle segments to first letter, keep first and last 2 full
                if #parts > 3 then
                  for i = 2, #parts - 2 do
                    parts[i] = parts[i]:sub(1, 1)
                  end
                end

                local filename = parts[#parts]
                if vim.bo.modified then
                  parts[#parts] = LazyVim.lualine.format(self, filename, "MatchParen")
                else
                  parts[#parts] = LazyVim.lualine.format(self, filename, "Bold")
                end

                if vim.bo.readonly then
                  parts[#parts] = parts[#parts] .. LazyVim.lualine.format(self, " 󰌾 ", "MatchParen")
                end

                return table.concat(parts, sep)
              end,
              padding = 0,
            },
          },
          lualine_x = {
            Snacks.profiler.status(),
            -- noice command
            {
              function()
                return require("noice").api.status.command.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.command.has()
              end,
              color = function()
                return { fg = Snacks.util.color("Statement") }
              end,
            },
            -- noice mode
            {
              function()
                return require("noice").api.status.mode.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.mode.has()
              end,
              color = function()
                return { fg = Snacks.util.color("Constant") }
              end,
            },
            -- DAP status
            {
              function()
                return "  " .. require("dap").status()
              end,
              cond = function()
                return package.loaded["dap"] and require("dap").status() ~= ""
              end,
              color = function()
                return { fg = Snacks.util.color("Debug") }
              end,
            },
            {
              function()
                local status = require("sidekick.status").cli()
                return " " .. (#status > 1 and #status or "")
              end,
              cond = function()
                return #require("sidekick.status").cli() > 0
              end,
              color = function()
                return "Special"
              end,
            },
          },
          lualine_y = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
              padding = { left = 1, right = 2 },
            },
          },
          lualine_z = {
            { "location", separator = { right = "" }, padding = { left = 1, right = 0 } },
          },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
        extensions = { "neo-tree", "lazy", "fzf" },
      }
    end,
  },
}
