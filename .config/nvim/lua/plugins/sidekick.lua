return {
  "folke/sidekick.nvim",
  opts = {
    nes = { enabled = false },
  },
  keys = {
    { "<tab>", false },
    { "<leader>as", false },
    {
      "<leader>aa",
      function()
        require("sidekick").nes_jump_or_apply()
      end,
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
    {
      "<leader>ac",
      function()
        require("sidekick.cli").toggle({ name = "claude", focus = true })
      end,
      desc = "Sidekick Toggle Claude",
    },
    {
      "<leader>at",
      function()
        require("sidekick.cli").select()
      end,
      -- Or to select only installed tools:
      -- require("sidekick.cli").select({ filter = { installed = true } })
      desc = "Sidekick Select AI Tool",
    },
    {
      "<leader>av",
      function()
        require("sidekick.cli").send({ msg = "{this}" })
      end,
      mode = { "n" },
      desc = "Sidekick Send This",
    },
    {
      "<leader>av",
      function()
        require("sidekick.cli").send({ selection = true })
      end,
      mode = { "v" },
      desc = "Sidekick Send Selection",
    },
    {
      "<leader>ap",
      function()
        require("sidekick.cli").prompt()
      end,
      mode = { "n", "v" },
      desc = "Sidekick Select Prompt",
    },
    {
      "<c-.>",
      function()
        require("sidekick.cli").focus()
      end,
      mode = { "n", "x", "i", "t" },
      desc = "Sidekick Switch Focus",
    },
  },
}
