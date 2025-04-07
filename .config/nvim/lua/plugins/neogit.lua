return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "ibhagwan/fzf-lua", -- optional
  },
  config = true,
  lazy = false,
  keys = {
    {
      "<leader>gs",
      function()
        require("neogit").open()
      end,
      desc = "Neogit",
    },
  },
}
