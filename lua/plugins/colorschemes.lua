return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
    opts = {
      transparent = false,
    },
		cond = not vim.g.vscode,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = {
			transparent_mode = true,
			contrast = "hard",
			overrides = {
				LspReferenceText = { bg = "#49443C" },
			},
		},
    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.cmd.colorscheme("gruvbox")
    end,
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
			vim.cmd.colorscheme("gruvbox")
		end,
		cond = not vim.g.vscode,
	},
}
