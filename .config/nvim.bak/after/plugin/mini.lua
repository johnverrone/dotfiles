local minifiles = require("mini.files")
minifiles.setup({
	mappings = {
		close = "<Esc>",
	},
	windows = {
		preview = true,
		width_preview = 50,
	},
})

vim.keymap.set("n", "<leader>e", function()
	local bufname = vim.api.nvim_buf_get_name(0)
	local _ = minifiles.close() or minifiles.open(bufname)
end, { desc = "Toggle mini.files" })
