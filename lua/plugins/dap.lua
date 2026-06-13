vim.pack.add({
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/theHamsta/nvim-dap-virtual-text",
	"https://github.com/jay-babu/mason-nvim-dap.nvim",
})

local function setup()
	require("mason-nvim-dap").setup({
		ensure_installed = { "codelldb", "debugpy" },
		handlers = {},
	})

	local dap = require("dap")
	local dapui = require("dapui")

	dapui.setup()
	require("nvim-dap-virtual-text").setup()

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

local loaded = false

local function lazy(fn)
	return function()
		if not loaded then
			setup()
			loaded = true
		end
		fn()
	end
end

-- stylua: ignore start
local map = vim.keymap.set
map("n", "<leader>db", lazy(function() require("dap").toggle_breakpoint() end), { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", lazy(function() require("dap").continue() end),          { desc = "DAP Continue" })
map("n", "<leader>di", lazy(function() require("dap").step_into() end),         { desc = "Step Into" })
map("n", "<leader>do", lazy(function() require("dap").step_over() end),         { desc = "Step Over" })
map("n", "<leader>dO", lazy(function() require("dap").step_out() end),          { desc = "Step Out" })
map("n", "<leader>dr", lazy(function() require("dap").repl.open() end),         { desc = "Open REPL" })
map("n", "<leader>du", lazy(function() require("dapui").toggle() end),          { desc = "Toggle DAP UI" })
