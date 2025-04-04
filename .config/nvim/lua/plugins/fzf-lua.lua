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
}
