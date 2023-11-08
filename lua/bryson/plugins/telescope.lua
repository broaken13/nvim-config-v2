return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-frecency.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-project.nvim",
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		{ "<leader>fr", "<cmd>Telescope frecency<cr>", desc = "Frecency" },
		{ "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
		{ "<leader>fp", "<cmd>lua require'telescope'.extensions.project.project{}<cr>", desc = "Projects" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
			extensions = {
				project = {
					base_dirs = {
						"C:/Repos/DesignSpace",
						"~/AppData/Local/nvim/",
					},
					on_project_selected = function(buffnr)
						local project_actions = require("telescope._extensions.project.actions")
						project_actions.change_working_directory(buffnr, false)
					end,
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("frecency")
		telescope.load_extension("file_browser")
		telescope.load_extension("project")
	end,
}
