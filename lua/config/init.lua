local filetypes = require("config.filetypes");
local keymaps = require("config.keymaps");
local options = require("config.options");

local M = {}

function M.setup()
	options.setup()
	keymaps.setup()
	filetypes.setup()
end

function M.after()
	options.after()
	keymaps.after()
	filetypes.after()
end

return M;
