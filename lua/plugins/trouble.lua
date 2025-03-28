	return {
		"folke/trouble.nvim",

		cmd = "Trouble",
		opts = {},
		keys = {
			{
				"<leader>tD",
				"<Cmd>Trouble diagnostics toggle focus=true<CR>",
				desc = "Trouble open diagnostics",
			},
			{
				"<leader>ts",
				"<Cmd>Trouble symbols toggle focus=true<CR>",
				desc = "Trouble open symbols",
			},
		},
    cond = not vim.g.vscode
	}
