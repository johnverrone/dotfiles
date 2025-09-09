return {
  "leoluz/nvim-dap-go",
  opts = {
    dap_configurations = {
      {
        type = "go",
        name = "Debug Cog",
        request = "launch",
        program = function()
          local path = vim.fn.getcwd() .. "/go/src/fs/services/"
          local cog = vim.fn.input("Name the cog to debug")
          local package = path .. cog .. "/main/" .. cog
          print("Debugging " .. cog)
          return package
        end,
      },
    },
  },
}
