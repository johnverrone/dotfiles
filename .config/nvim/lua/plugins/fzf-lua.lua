return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<leader>fb",
      function()
        -- pick the newest merge-base across candidates (fewest files from HEAD)
        local base
        for _, ref in ipairs({ "origin/green", "origin/master", "green", "master" }) do
          local sha = vim.fn.system("git merge-base HEAD " .. ref):gsub("\n", "")
          if vim.v.shell_error == 0 and sha ~= "" then
            if base == nil then
              base = sha
            else
              -- if sha descends from base, it's newer — prefer it
              vim.fn.system("git merge-base --is-ancestor " .. base .. " " .. sha)
              if vim.v.shell_error == 0 then
                base = sha
              end
            end
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
          cwd = fs_home
          -- --relative without a path uses cwd as the base; --relative=<path> mis-parses
          relative_flag = " --relative"
        end
        fzf.files({
          prompt = "Branch Files> ",
          cmd = "git diff --name-only" .. relative_flag .. " " .. base,
          cwd = cwd,
          hidden = false,
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
