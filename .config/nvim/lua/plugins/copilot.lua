return {
  "zbirenbaum/copilot.lua",
  optional = true,
  opts = function()
    -- Temporary fix remove after https://github.com/LazyVim/LazyVim/pull/5900 is merged
    ---@diagnostic disable-next-line: inject-field
    require("copilot.api").status = require("copilot.status")
  end,
}
