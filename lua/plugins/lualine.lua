return {
	"nvim-lualine/lualine.nvim",
	opts = {
		theme = "dracula",
	},
	config = function(_, opts)
		require("lualine").setup(opts)
	end,
	cond = not vim.g.vscode,
}
