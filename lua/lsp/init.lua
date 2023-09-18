local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local specializers = {
  ["lua_ls"] = require("lsp.lua_ls"),
  ["rust_analyzer"] = require("lsp.rust_analyzer")
}

local capabilities = cmp_nvim_lsp.default_capabilities()

local M = {}

function M.setup(server_name)
  local config = { capabilities = capabilities }
  if specializers[server_name] ~= nil then
	specializers[server_name](config)
  end
  lspconfig[server_name].setup(config)
end

return M
