if not vim.g.vscode then
	return {
		"folke/trouble.nvim",

		cmd = "Trouble",
		opts = {},
		keys = {
			{
				"<leader>td",
				"<Cmd>Trouble diagnostics toggle focus=true<CR>",
				desc = "Trouble open diagnostics",
			},
			{
				"<leader>ts",
				"<Cmd>Trouble symbols toggle focus=true<CR>",
				desc = "Trouble open symbols",
			},
		},
	}
else
	return {}
end
