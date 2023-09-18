local eslint_d = {
	lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %tarning %m", "%f:%l:%c: %trror %m" },
	lintIgnoreExitCode = true,
	lintSource = "eslint",
	formatCommand = "eslint_d --stdin --fix-to-stdout --stdin-filename=${INPUT}]",
	formatStdin = true
}

local prettierd = {
	formatCommand = "prettierd ${INPUT}",
	formatStdin = true
}

local function config(opts)
	function opts.on_attach(client)
		client.server_capabilities.documentFormattingProvider = true
	end

	opts.settings = {
		rootMarkers = { ".git", "package.json" },
		languages = {
			javascript = { eslint_d, prettierd },
			javascriptreact = { eslint_d, prettierd },
			typescript = { eslint_d, prettierd },
			typescriptreact = { eslint_d, prettierd },
			yaml = { prettierd },
			markdown = { prettierd },
			css = { prettierd },
			scss = { prettierd },
			sass = { prettierd },
			less = { prettierd },
			json = { prettierd },
			graphql = { prettierd },
			vue = { prettierd },
			html = { prettierd },
			svelte = { prettierd }
		}
	}

	opts.filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }
end

return config
