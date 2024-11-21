require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = require("telescope.actions").move_selection_next,
				["<C-k>"] = require("telescope.actions").move_selection_previous,
			},
		},
	},
	pickers = {
		buffers = {
			show_all_buffers = true,
			sort_last_used = true,
			mappings = {
				i = {
					["<c-d>"] = "delete_buffer",
				},
				n = {
					["d"] = "delete_buffer",
				},
			},
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

require("telescope").load_extension("ui-select")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
-- make leader-p noop so that it doesn't paste when I bail out of the keybinding
vim.keymap.set("n", "<leader>p", "<nop>", {})

vim.api.nvim_set_keymap(
	"n",
	"<leader><tab>",
	"<Cmd>lua require('telescope.builtin').commands()<CR>",
	{ noremap = false }
)
