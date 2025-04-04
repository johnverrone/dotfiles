-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- delete defaults
vim.keymap.del("n", "<leader>gB")

-- Add any additional keymaps here
-- make joining lines not jump to end
vim.keymap.set("n", "J", "mzJ`z")

-- paste in visual and keep pasted value in register
vim.keymap.set("x", "<leader>p", '"_dP')

-- faster saving
vim.keymap.set("n", "zz", vim.cmd.update)
