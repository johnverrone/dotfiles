local Plug = vim.fn["plug#"]

vim.call("plug#begin")

-- treesitter for better syntax highlighting
-- ✅
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })

-- telescope fuzzy finder
-- ❌ replaced with fzf-lua
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim")
Plug("nvim-telescope/telescope-ui-select.nvim") -- allows nvim to use telescope picker
Plug("princejoogie/dir-telescope.nvim") -- allows telescope to search directories

-- colorscheme
-- ✅
Plug("tomasiser/vim-code-dark")
Plug("NLKNguyen/papercolor-theme")
Plug("catppuccin/nvim", { ["as"] = "catppuccin" })

-- lsp and autocompletion
-- ✅ nvim-lspconfig and mason
Plug("neovim/nvim-lspconfig")
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")
-- ❌ nvim-cmp relplaced by blink.cmp
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/cmp-nvim-lua")
Plug("hrsh7th/cmp-nvim-lsp")
-- ❌ friendly-snippets
Plug("L3MON4D3/LuaSnip", { tag = "v2.*", ["do"] = "make install_jsregexp" })
-- ❌ mini.icons
Plug("onsails/lspkind.nvim") -- adds icons to lsp completion items

-- golang
-- ❌ lsp with mason and debugging with dap
Plug("fatih/vim-go", { ["do"] = ":GoUpdateBinaries" })

-- run formatting tools
-- ❌ replaced with conform.nvim
Plug("mhartington/formatter.nvim")

-- git
-- TODO
Plug("tpope/vim-fugitive")
Plug("tpope/vim-rhubarb")

-- commentary
-- ✅ ts-comments
Plug("tpope/vim-commentary")

-- abolish (dealing with word variants)
Plug("tpope/vim-abolish")

-- surround (for wrapping stuff)
Plug("tpope/vim-surround")
Plug("tpope/vim-repeat")

-- markdown rendering
-- ❌ this was kinda annoying
Plug("MeanderingProgrammer/render-markdown.nvim")

-- icon library for markdown rendering
-- ✅
Plug("nvim-tree/nvim-web-devicons")

-- copilot
-- ✅
Plug("zbirenbaum/copilot.lua")
Plug("zbirenbaum/copilot-cmp")
Plug("CopilotC-Nvim/CopilotChat.nvim")

-- noice for vim toast style alerts and pretty cmdline
-- ✅
Plug("folke/noice.nvim")
Plug("MunifTanjim/nui.nvim")
Plug("rcarriga/nvim-notify")

-- mini.files for file system navigation and management
-- ✅ neo-tree
Plug("echasnovski/mini.files")

-- interact with databases
-- TODO
Plug("tpope/vim-dadbod")
Plug("kristijanhusak/vim-dadbod-completion")
Plug("kristijanhusak/vim-dadbod-ui")

vim.call("plug#end")
