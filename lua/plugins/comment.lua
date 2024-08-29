if not vim.g.vscode then
	return {
		"numToStr/Comment.nvim",
		opts = {
			toggler = {
				line = "<C-_>",
				block = "gbc",
			},
		},
		config = function(opts)
			require("Comment").setup(opts)
      vim.keymap.set("n", "<C-_>", "gcc")
      vim.keymap.set("v", "<C-_>", "gc")
		end,
	}
else
	return {}
end
