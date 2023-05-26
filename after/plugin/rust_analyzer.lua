local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup {
	checkOnSave = {
		command = "clippy"
	}
}
