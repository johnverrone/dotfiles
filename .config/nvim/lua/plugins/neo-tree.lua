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
      reveal_force_cwd = true,
      mappings = {
        ["<space>"] = "noop",
        ["e"] = "toggle_node",
      },
    },
    nesting_rules = {
      ["proto"] = {
        pattern = "^(.-)%.proto$",
        files = { "%1.pb.go", "%1.pb.grpchan.go", "%1.pb.srcinfo.go", "%1_grpc.pb.go", "%1_grpc_mock.pb.go" },
      },
    },
  },
}
