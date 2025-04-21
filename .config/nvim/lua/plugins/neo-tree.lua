return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>fE", false },
    { "<leader>E", false },
    {
      "<leader>fe",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          position = "float",
          reveal = true,
        })
      end,
      desc = "Toggle NeoTree",
    },
    { "<leader>e", "<leader>fe", desc = "Toggle NeoTree", remap = true },
  },
  opts = {
    window = {
      position = "float",
      reveal = true,
    },
  },
}
