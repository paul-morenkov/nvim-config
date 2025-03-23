	return {
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>og", vim.cmd.Git)
		end,
    cond = vim.g.vscode
	}
