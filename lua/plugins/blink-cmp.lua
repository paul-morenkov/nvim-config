return {
	"saghen/blink.cmp",
	version = "1.*",
  dependencies = {"rafamadriz/friendly-snippets"},

	opts = {
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		keymap = {
			["<CR>"] = { "select_and_accept", "fallback"},
      ["<C-y>"] = {'show', 'show_documentation', 'hide_documentation'}
		},
	},

	cond = not vim.g.vscode,
}
