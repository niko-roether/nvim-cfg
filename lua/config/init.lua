local filetypes = require("config.filetypes");
local keymaps = require("config.keymaps");
local options = require("config.options");
local autocmds = require("config.autocmds")

local M = {}

function M.setup()
	options.setup()
	keymaps.setup()
	filetypes.setup()
	autocmds.setup()
end

function M.after()
	options.after()
	keymaps.after()
	filetypes.after()
	autocmds.after()
end

return M;
