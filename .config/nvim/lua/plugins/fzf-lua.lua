return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<leader>fb",
      function()
        -- find merge base against green, fall back to master
        local base
        for _, ref in ipairs({ "green", "master" }) do
          vim.fn.system("git merge-base HEAD " .. ref)
          if vim.v.shell_error == 0 then
            base = ref
            break
          end
        end
        if not base then
          vim.notify("Could not find base branch (tried green, master)", vim.log.levels.WARN)
          return
        end
        local fzf = require("fzf-lua")
        local git_root = vim.fn.system("git rev-parse --show-toplevel"):gsub("\n", "")
        local fs_home = vim.env.FS_HOME
        -- if $FS_HOME is a subdirectory of the git root, use --relative to strip
        -- the prefix so paths resolve correctly from $FS_HOME as cwd
        local cwd = git_root
        local relative_flag = ""
        if fs_home and fs_home ~= "" and fs_home ~= git_root then
          local rel = fs_home:sub(#git_root + 2)
          if rel ~= "" then
            cwd = fs_home
            relative_flag = " --relative=" .. rel
          end
        end
        fzf.fzf_exec("git diff --name-only" .. relative_flag .. " " .. base .. "...", {
          prompt = "Branch Files> ",
          previewer = "builtin",
          cwd = cwd,
          file_icons = true,
          color_icons = true,
          actions = fzf.config.globals.actions.files,
        })
      end,
      desc = "Branch files",
    },
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
