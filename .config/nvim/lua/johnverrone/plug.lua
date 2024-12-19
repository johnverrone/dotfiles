local Plug = vim.fn["plug#"]

vim.call("plug#begin")

-- treesitter for better syntax highlighting
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })

-- telescope fuzzy finder
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim", { tag = "0.1.5" })
Plug("nvim-telescope/telescope-ui-select.nvim") -- allows nvim to use telescope picker

-- colorscheme
Plug("tomasiser/vim-code-dark")
Plug("NLKNguyen/papercolor-theme")
Plug("catppuccin/nvim", { ["as"] = "catppuccin" })

-- lsp and autocompletion
Plug("neovim/nvim-lspconfig")
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")
Plug("L3MON4D3/LuaSnip", { tag = "v2.*", ["do"] = "make install_jsregexp" })

-- golang
Plug("fatih/vim-go", { ["do"] = ":GoUpdateBinaries" })

-- run formatting tools
Plug("mhartington/formatter.nvim")

-- git
Plug("tpope/vim-fugitive")
Plug("tpope/vim-rhubarb")

-- commentary
Plug("tpope/vim-commentary")

-- abolish (dealing with word variants)
Plug("tpope/vim-abolish")

-- surround (for wrapping stuff)
Plug("tpope/vim-surround")
Plug("tpope/vim-repeat")

-- markdown rendering
Plug("MeanderingProgrammer/render-markdown.nvim")

-- icon library for markdown rendering
Plug("nvim-tree/nvim-web-devicons")

-- copilot chat
Plug("zbirenbaum/copilot.lua")
Plug("nvim-lua/plenary.nvim")
Plug("CopilotC-Nvim/CopilotChat.nvim", { ["branch"] = "canary" })

-- noice for vim toast style alerts and pretty cmdline
Plug("folke/noice.nvim")
Plug("MunifTanjim/nui.nvim")
Plug("rcarriga/nvim-notify")

-- mini.files for file system navigation and management
Plug("echasnovski/mini.files")

vim.call("plug#end")
