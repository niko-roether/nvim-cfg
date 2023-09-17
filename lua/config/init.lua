local autocmds = require("config.autocmds");
local keymaps = require("config.keymaps");
local options = require("config.options");

local M = {}

function M.setup()
	options.setup()
	keymaps.setup()
	autocmds.setup()
end

function M.after()
	options.after()
	keymaps.after()
	autocmds.after()
end

return M;
