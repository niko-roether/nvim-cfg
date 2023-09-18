local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local format = require("lsp.format")

local special_configs = {
  ["lua_ls"] = require("lsp.config.lua_ls"),
  ["rust_analyzer"] = require("lsp.config.rust_analyzer")
}

local capabilities = cmp_nvim_lsp.default_capabilities()

local M = {}

function M.setup(server_name)
  local config = { capabilities = capabilities }
  if special_configs[server_name] ~= nil then
	special_configs[server_name](config)
  end
  lspconfig[server_name].setup(config)
end

return M
