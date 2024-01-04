local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- treesitter for better syntax highlighting
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- telescope fuzzy finder 
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', {tag = '0.1.5'})

-- colorscheme
Plug 'tomasiser/vim-code-dark'

-- lsp and autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug('L3MON4D3/LuaSnip', {tag = 'v2.*', ['do'] = 'make install_jsregexp'})

-- golang
Plug('fatih/vim-go', {['do'] = ':GoUpdateBinaries' })

vim.call('plug#end')
