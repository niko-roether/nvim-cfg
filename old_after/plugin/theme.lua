local tokyonight = require("tokyonight")
local lualine = require("lualine")

tokyonight.setup {
	style = "moon",
}

lualine.setup {
	options = {
		theme = "tokyonight",
	}
}

vim.cmd("colorscheme tokyonight")
