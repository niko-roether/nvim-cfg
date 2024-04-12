local globals = require("globals")

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	enabled = globals.theme == "catppuccin",
	opts = {
		barbar = true,
		mason = true
	}
}
