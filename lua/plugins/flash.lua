vim.pack.add({ "https://github.com/folke/flash.nvim" })

local flash = require("flash")

vim.keymap.set({ "n", "x", "o" }, "s", function()
	flash.jump()
end, { desc = "Flash Jump" })

vim.keymap.set({ "n", "x", "o" }, "S", function()
	flash.treesitter()
end, { desc = "Flash Treesitter" })

vim.keymap.set("o", "r", function()
	flash.remote()
end, { desc = "Flash Remote" })

vim.keymap.set({ "o", "x" }, "R", function()
	flash.treesitter_search()
end, { desc = "Flash Treesitter Search" })
