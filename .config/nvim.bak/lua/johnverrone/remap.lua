-- make joining lines not jump to end
vim.keymap.set("n", "J", "mzJ`z")

-- keep searches in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste in visual and keep pasted value in register
vim.keymap.set("x", "<leader>p", '"_dP')

-- faster saving
vim.keymap.set("n", "zz", vim.cmd.update)

-- yank to clipboard with leader-y/Y
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- keep cursor in place when page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- setup substitute with value under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- easy open nvim plugins
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/johnverrone/plug.lua<CR>")

-- restart lsp
vim.keymap.set("n", "<leader>lr", vim.cmd.LspRestart)

-- quickly delete buffer
vim.keymap.set("n", "<leader>d", "<cmd>bd<CR>")

-- clear search highlighting
vim.keymap.set("n", "ss", ":noh<CR>", { noremap = true })

-- automatically close quickfix after selection
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf" },
	command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>]],
})

-- vim-go
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go" },
	command = [[nmap <leader>r <Plug>(go-run-vertical)]],
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go" },
	command = [[nmap <leader>t <Plug>(go-test-func)]],
})

-- noice
vim.api.nvim_set_keymap("n", "<leader>nn", ":Noice dismiss<CR>", { noremap = true })

-- open FS localdev featureflags
vim.api.nvim_set_keymap("n", "<leader>ff", ":e $FS_HOME/etc/localdev/featureflags.yaml<CR>", { noremap = true })
