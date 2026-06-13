vim.pack.add({ { src = "https://github.com/mrcjkb/rustaceanvim", version = vim.version.range("^9") } })

vim.g.rustaceanvim = {
	server = {
		capabilities = vim.lsp.protocol.make_client_capabilities(),
	},
}
