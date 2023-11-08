return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>ee", "<cmd>Neotree toggle<cr>", desc = "Neotree" },
	},
	config = function()
		require("neo-tree").setup()
	end,
}
