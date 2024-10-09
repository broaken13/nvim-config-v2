return {
	"MagicDuck/grug-far.nvim",
	opts = {},
	keys = {
		{
			"<leader>fr",
			function()
				require("grug-far").open()
			end,
			desc = "Grug Find & Replace",
		},
	},
}
