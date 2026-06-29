vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	"https://github.com/rafamadriz/friendly-snippets",
})

require("blink.cmp").setup({
	fuzzy = { implementation = "prefer_rust_with_warning" },

	snippets = { preset = "default" },

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	keymap = {
		preset = "default",
		["<Tab>"] = { "snippet_forward", "select_and_accept", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },
	},

	completion = {
		list = {
			selection = {
				preselect = true,
				auto_insert = true,
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
		ghost_text = { enabled = false },
	},

	signature = {
		enabled = true,
		trigger = {
			show_on_accept = true,
		},
	},

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "normal",
	},
})
