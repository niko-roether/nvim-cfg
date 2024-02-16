return {
	"luukvbaal/nnn.nvim",
	config = function()
		local nnn = require("nnn")
		local cfg = {
			replace_netrw = "explorer",
			mappings = {
				{ "<C-p>", nnn.builtin.open_in_preview },
				{ "<C-y>", nnn.builtin.copy_to_clipboard },
				{ "<C-t>", nnn.builtin.open_in_tab }
			}
		}
		nnn.setup(cfg)
	end
}
