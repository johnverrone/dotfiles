-- Utilities for creating configurations
-- local defaults = require("formatter.defaults")
-- local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	filetype = {
		css = { require("formatter.filetypes.css").prettier },
		lua = { require("formatter.filetypes.lua").stylua },
		scss = { require("formatter.filetypes.css").prettier },
		svelte = { require("formatter.filetypes.svelte").prettier },
		typescript = { require("formatter.filetypes.typescript").prettier },
		typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
		-- astro = { util.withl(defaults.prettier, "astro") },

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.keymap.set("n", "<leader>F", vim.cmd.Format)

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
