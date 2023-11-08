return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag", -- Auto close xml style tags
	},
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c_sharp",
				"rust",
				"typescript",
				"javascript",
				"lua",
				"json",
				"tsx",
				"css",
				"html",
			},
			highlight = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
		})
	end,
}
