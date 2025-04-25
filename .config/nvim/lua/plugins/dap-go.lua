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
        -- program = function()
        --   return coroutine.create(function(dap_run_co)
        --     local path = vim.fn.getcwd() .. "/go/src/fs/services/"
        --     local cogs = vim.split(vim.fn.glob(path .. "*"), "\n")
        --     for i, p in ipairs(cogs) do
        --       cogs[i] = p:gsub(path, "")
        --     end
        --     vim.ui.select(cogs, { prompt = "Select a cog to debug" }, function(cog)
        --       package = path .. cog .. "/main/" .. cog
        --       coroutine.resume(dap_run_co, package)
        --     end)
        --   end)
        -- end,
      },
    },
  },
}
