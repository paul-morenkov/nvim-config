vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.ai").setup()
require("mini.comment").setup()
require("mini.move").setup()
require("mini.pairs").setup()

require("mini.align").setup({
	modifiers = {
		-- Customize justify to take list of justification patterns
		j = function(_, opts)
			local char_to_side = {
				l = "left",
				c = "center",
				r = "right",
				n = "none",
			}

			local input = vim.fn.input("Justify (l/c/r/n): ")
			if input == "" then
				return
			end

			local sides = {}
			for i = 1, #input do
				local side = char_to_side[input:sub(i, i)]
				if side then
					table.insert(sides, side)
				end
			end

			if #sides == 0 then
				return
			end
			opts.justify_side = #sides == 1 and sides[1] or sides
		end,
	},
})
