return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {
			PATH = "prepend",
		},
		-- TODO: is this needed
		config = true,
		cond = not vim.g.vscode,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = { "lua_ls", "rust_analyzer", "clangd" },
			auto_install = true,
		},
		-- TODO: is this needed
		config = true,
		cond = not vim.g.vscode,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({})

			-- rustacean-nvim sets up rust-analyzer for us
			-- lspconfig.rust_analyzer.setup({
			-- capabilities = capabilities,
			-- })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Show definition" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action menu" })
		end,
		cond = not vim.g.vscode,
	},
}
