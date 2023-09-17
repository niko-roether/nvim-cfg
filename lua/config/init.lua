local autocmds = require("config.autocmds");
local keymaps = require("config.keymaps");
local options = require("config.options");

local M = {}

function M.init()
	options.init()
	keymaps.init()
	autocmds.init()
end

function M.setup()
	options.setup()
	keymaps.setup()
	autocmds.setup()
end

return M;
