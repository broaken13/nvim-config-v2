return {
	"nvim-lualine/lualine.nvim",
	priority = 500,
	dependencies = {
        "echasnovski/mini.nvim",
	},
	opts = {
		options = {
			icons_enabled = true,
			theme = "wombat",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
	},
}

