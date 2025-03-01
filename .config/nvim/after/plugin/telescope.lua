local telescope = require("telescope")

telescope.setup({
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

require("dir-telescope").setup({})
telescope.load_extension("ui-select")
telescope.load_extension("dir")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pp", builtin.builtin, {})
vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>pf", telescope.extensions.dir.find_files, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
vim.keymap.set("n", "<leader>ph", builtin.help_tags, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader><tab>", builtin.commands, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
-- make leader-p noop so that it doesn't paste when I bail out of the keybinding
vim.keymap.set("n", "<leader>p", "<nop>", {})

vim.keymap.set("n", "<leader>vc", function()
	builtin.find_files({
		prompt_title = "Neovim config files",
		cwd = "~/.config/nvim",
	})
end)
