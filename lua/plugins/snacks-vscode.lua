vim.pack.add({
	"https://github.com/folke/snacks.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})

local Snacks = require("snacks")

Snacks.setup({
	animate = { enabled = true }, -- TODO: Determine if this does anything
	bigfile = { enabled = true },
	dashboard = { enabled = false },
	dim = { enabled = false },
	explorer = { enabled = false },
	image = { enabled = false },
	indent = { enabled = false },
	input = { enabled = false },
	layout = { enabled = false },
	notifier = { enabled = false },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scratch = { enabled = false },
	scroll = { enabled = false },
	statuscolumn = { enabled = false },
	terminal = { enabled = false },
	toggle = { enabled = true },
	words = { enabled = false },
	zen = { enabled = false },
	picker = {},
})

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
		Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
		Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
		Snacks.toggle.diagnostics():map("<leader>td")
		Snacks.toggle.line_number():map("<leader>ul")
		Snacks.toggle
			.option(
				"conceallevel",
				{ off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }
			)
			:map("<leader>uc")
		Snacks.toggle
			.option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" })
			:map("<leader>uA")
		Snacks.toggle.treesitter():map("<leader>uT")
		Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
		Snacks.toggle.dim():map("<leader>uD")
		Snacks.toggle.animate():map("<leader>ua")
		Snacks.toggle.indent():map("<leader>ug")
		Snacks.toggle.scroll():map("<leader>uS")
		Snacks.toggle.profiler():map("<leader>dpp")
		Snacks.toggle.profiler_highlights():map("<leader>dph")
		Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
		Snacks.toggle.zen():map("<leader>uz")
	end,
})

-- stylua: ignore start
local keymaps = {
  { "<leader>l",       function() vim.cmd("Lazy") end,                 desc = "Open Lazy tab", },
  -- find
  { "<leader>bd", function() Snacks.bufdelete() end,                   desc = "Delete buffer",            mode = { "n" }, },
  { "<leader>bo", function() Snacks.bufdelete.other() end,             desc = "Delete other buffers",     mode = { "n" }, },
}

for _, map in ipairs(keymaps) do
  local mode = map.mode or "n"
  local opts = { desc = map.desc, nowait = map.nowait }
  vim.keymap.set(mode, map[1], map[2], opts)
end
