local function select_next_idx(idx, dir)
  dir = dir or 1

  local list = require("blink.cmp.completion.list")
  if #list.items == 0 then
    return
  end

  local target_idx
  -- haven't selected anything yet
  if list.selected_item_idx == nil then
    if dir == 1 then
      target_idx = idx
    else
      target_idx = #list.items - idx
    end
  elseif list.selected_item_idx == #list.items then
    if dir == 1 then
      target_idx = 1
    else
      target_idx = #list.items - idx
    end
  elseif list.selected_item_idx == 1 and dir == -1 then
    target_idx = #list.items - idx
  else
    target_idx = list.selected_item_idx + (idx * dir)
  end

  -- clamp
  if target_idx < 1 then
    target_idx = 1
  elseif target_idx > #list.items then
    target_idx = #list.items
  end

  list.select(target_idx)
end

return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" },
            { "source_name" },
          },
        },
      },
    },
    keymap = {
      -- set to 'none' to disable the 'default' preset
      preset = "default",
      ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
      ["<C-j>"] = { "select_next", "fallback_to_mappings" },
      ["<C-u>"] = {
        function(cmp)
          if not cmp.is_visible() then
            return
          end
          vim.schedule(function()
            select_next_idx(3, -1)
          end)
          return true
        end,
        "fallback",
      },
      ["<C-d>"] = {
        function(cmp)
          if not cmp.is_visible() then
            return
          end
          vim.schedule(function()
            select_next_idx(3)
          end)
          return true
        end,
        "fallback_to_mappings",
      },
    },
  },
}
