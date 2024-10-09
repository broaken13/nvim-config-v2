return {
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
            "echasnovski/mini.nvim",
        },
        opts = {
            graph_style = "unicode",
        },
        keys = {
            {
                "<leader>gg",
                function()
                    require("neogit").open()
                end,
                desc = "Open Neogit",
            },
            { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {}
    }
}

