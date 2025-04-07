-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
		vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, opts)
	end,
})

local nvim_lsp = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls", "eslint", "gopls", "sqlls" },
})
require("mason-lspconfig").setup_handlers({
	-- default handler
	function(server_name)
		nvim_lsp[server_name].setup({
			capabilities = lsp_capabilities,
		})
	end,

	-- Next, you can provide a dedicated handler for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	["rust_analyzer"] = function()
		require("rust-tools").setup({})
	end,
	["denols"] = function()
		nvim_lsp.denols.setup({
			root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
		})
	end,

	["eslint"] = function()
		nvim_lsp.eslint.setup({
			capabilities = lsp_capabilities,
			on_attach = function(_, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
		})
	end,
	["ts_ls"] = function()
		nvim_lsp.ts_ls.setup({
			capabilities = lsp_capabilities,
			root_dir = nvim_lsp.util.root_pattern("package.json"),
			single_file_support = false,
		})
	end,
	["lua_ls"] = function()
		nvim_lsp.lua_ls.setup({
			capabilities = lsp_capabilities,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				},
			},
		})
	end,
})
