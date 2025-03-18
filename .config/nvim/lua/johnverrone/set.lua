vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50
vim.opt.timeoutlen = 2000

vim.opt.splitright = true

vim.g.mapleader = " "

-- command line completion behavior
vim.opt.wildmode = "longest,list,full"

-- vim-go
vim.g.go_term_enabled = 1
vim.g.go_term_reuse = 1
vim.g.go_term_close_on_exit = 0
vim.g.go_debug_windows = {
	vars = "leftabove 60vnew",
	stack = "leftabove 20new",
	goroutines = "botright 10new",
	out = "botright 5new",
}
vim.g.go_debug_preserve_layout = 1
vim.g.go_debug_address = "127.0.0.1:50206"
