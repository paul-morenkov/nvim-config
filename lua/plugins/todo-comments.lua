return {
	"folke/todo-comments.nvim",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	-- event = {
	--   "BufReadPre",
	--   "BufNewFile",
	-- },
	keys = {
		{
			"<leader>st",
			function()
				require("snacks").picker.todo_comments()
			end,
			{ desc = "Todo" },
		},
		{
			"[t",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "Next Todo",
		},
		{
			"]t",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Next Todo",
		},
	},
	-- config = function(opts)
	-- 	local todo = require("todo-commments").setup(opts)
	-- 	vim.keymap.set("n", "]t", function()
	-- 		todo.jump_next()
	-- 	end, { desc = "Next Todo" })
	-- end,
	-- TODO: test
}
