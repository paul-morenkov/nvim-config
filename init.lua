print(vim.g.vscode)

if not vim.g.vscode then
	require("vim._core.ui2").enable()
	require("options")
	require("lsp")
	require("plugins")
	require("keymaps")
else
	require("options")
	require("plugins")
	require("keymaps")
	require("vscode-config")
end
