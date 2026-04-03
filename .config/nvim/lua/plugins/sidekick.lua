return {
  "folke/sidekick.nvim",
  opts = {
    nes = { enabled = false },
  },
  keys = {
    { "<tab>", false },
    { "<leader>as", false },
    { "<leader>av", false },
    {
      "<leader>aa",
      function()
        require("sidekick.cli").select({ filter = { installed = true } })
      end,
      desc = "Select CLI",
    },
  },
}
