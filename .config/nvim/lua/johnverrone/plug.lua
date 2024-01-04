local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- treesitter for better syntax highlighting
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- telescope fuzzy finder 
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', {tag = '0.1.5'})

-- colorscheme
Plug 'tomasiser/vim-code-dark'

-- cmp for autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
-- for vsnip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

vim.call('plug#end')
