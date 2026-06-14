local vscode = require("vscode")

-- Use VS Code formatting
vim.keymap.set("n", "<leader>f", function()
	vscode.call("editor.action.formatDocument")
end)
