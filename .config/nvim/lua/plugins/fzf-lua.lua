return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader>gs", false },
    {
      "<leader>gb",
      function()
        require("fzf-lua").git_branches()
      end,
      desc = "Git branches",
    },
  },
  keymap = {
    builtin = {
      ["<F4>"] = "toggle-preview",
    },
  },
  opts = function(_, opts)
    local actions = require("fzf-lua").actions
    return vim.tbl_deep_extend("force", opts, {
      winopts = {
        preview = {
          horizontal = "right:35%",
        },
      },
      -- tmux binds `M-h/j/k/l` (unprefixed) to pane navigation, so alt-h
      -- never reaches fzf-lua here; use ctrl-h to toggle hidden files instead.
      files = {
        actions = {
          ["alt-h"] = false,
          ["ctrl-h"] = { actions.toggle_hidden },
        },
      },
      grep = {
        actions = {
          ["alt-h"] = false,
          ["ctrl-h"] = { actions.toggle_hidden },
        },
      },
    })
  end,
}
