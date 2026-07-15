return {
  "joelgwebber/yaks.nvim",
  keys = {
    {
      "<leader>py",
      function()
        -- Toggle: close the yaks list if it's showing, otherwise open it.
        local list = require("yaks.ui.list")
        local buf = list.get_buf()
        if buf then
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_buf(win) == buf then
              list.close()
              return
            end
          end
        end
        require("yaks").list()
      end,
      desc = "Yaks (toggle)",
    },
  },
  config = function()
    require("yaks").setup()

    -- Dim the task id so it doesn't fight the title for attention.
    -- The plugin links YaksTaskId to Identifier (default), which equals the
    -- title color in some themes; our override wins over that default.
    local function dim_task_id()
      vim.api.nvim_set_hl(0, "YaksTaskId", { link = "Comment" })
    end
    dim_task_id()
    -- Re-apply after a colorscheme change, which clears our override.
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("yaks_highlights", { clear = true }),
      callback = dim_task_id,
    })
  end,
}
