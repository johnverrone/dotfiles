-- go back to net-rw easily
vim.keymap.set("n", "-", vim.cmd.Ex)

-- keep searches in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste in visual and keep pasted value in register
vim.keymap.set("x", "<leader>p", "\"_dP")

