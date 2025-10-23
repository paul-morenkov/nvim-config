return {

	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {
			PATH = "prepend",
			ensure_installed = {
				"pyright",
				"rust-analyzer",
			},
			ui = {
				border = "rounded",
			},
		},
		cond = not vim.g.vscode,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		cond = not vim.g.vscode,
	},
	{
		"neovim/nvim-lspconfig",
		cond = not vim.g.vscode,
	},
}
