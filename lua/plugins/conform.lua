vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
	},

	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})

vim.keymap.set("n", "<leader>f", conform.format, { silent = true, desc = "Format File" })
