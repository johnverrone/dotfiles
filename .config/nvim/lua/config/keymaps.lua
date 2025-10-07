-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- delete defaults
vim.keymap.del("n", "<leader>gB")
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")

-- paste in visual and keep pasted value in register
vim.keymap.set("x", "<leader>p", '"_dP')

-- faster saving
vim.keymap.set("n", "zz", vim.cmd.update)

-- yank to clipboard with leader-y/Y
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
