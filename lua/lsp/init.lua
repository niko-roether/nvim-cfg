local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local special_configs = {
	efm = require("lsp.config.efm"),
	lua_ls = require("lsp.config.lua_ls"),
	rust_analyzer = require("lsp.config.rust_analyzer"),
	tsserver = require("lsp.config.disable_formatting"),
	svelte = require("lsp.config.disable_formatting")
}

local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.set_log_level("off")

local M = {}

function M.setup(server_name)
	local config = { capabilities = capabilities }
	if special_configs[server_name] ~= nil then
		special_configs[server_name](config)
	end
	lspconfig[server_name].setup(config)
end

return M
