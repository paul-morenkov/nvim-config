if not vim.g.vscode then
	return {
		{
			"williamboman/mason.nvim",
			opts = {
				PATH = "prepend",
			},
			config = true,
		},
		{
			"williamboman/mason-lspconfig.nvim",
			dependencies = { "williamboman/mason.nvim" },
			opts = {
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"pyright",
				},
				auto_install = true,
			},
			config = true,
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				ensure_installed = {
					"black",
					"debugpy",
					"flake8",
					"isort",
					"mypy",
					"pylint",
				},
			},
		},
		{
			"neovim/nvim-lspconfig",
			lazy = false,
			dependencies = {
				"williamboman/mason-lspconfig.nvim",
				"WhoIsSethDaniel/mason-tool-installer.nvim",
			},
			config = function()
				local capabilities = require("cmp_nvim_lsp").default_capabilities()

				local lspconfig = require("lspconfig")
				lspconfig.lua_ls.setup({
					capabilities = capabilities,
				})
				-- rustacean-nvim sets up rust-analyzer for us
				-- lspconfig.rust_analyzer.setup({
				-- capabilities = capabilities,
				-- })
				lspconfig.pyright.setup({
					capabilities = capabilities,
				})

				vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover" })
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Show definition" })
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action menu" })
			end,
		},
	}
else
	return {}
end
