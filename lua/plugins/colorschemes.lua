return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		cond = not vim.g.vscode,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = {
			transparent_mode = false,
			contrast = "hard",
			overrides = {
				LspReferenceText = { bg = "#49443C" },
			},
		},
		cond = not vim.g.vscode,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavor = "mocha",
			transparent_background = true,
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
		cond = not vim.g.vscode,
	},
}
