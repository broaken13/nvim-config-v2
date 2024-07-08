return {
    "zaldih/themery.nvim",
    dependencies = {
        "savq/melange-nvim",
        "Shatur/neovim-ayu",
        "folke/tokyonight.nvim",
        "Mofiqul/vscode.nvim",
        "tanvirtin/monokai.nvim",
        "sainnhe/gruvbox-material",
        "sainnhe/everforest",
        "adisen99/codeschool.nvim",
        { "Everblush/nvim", name = "everblush" },
    },
    lazy = false,
    priority = 1000,
    config = function()
        vim.o.background = "dark"
        require("themery").setup {
            themes = {
                "ayu",
                "melange",
                "vscode",
                "tokyonight",
                "slate",
                "gruvbox-material",
                "monokai",
                "monokai_pro",
                "monokai_soda",
                "everforest",
                "everblush"
            }
        }
        vim.cmd([[ colorscheme monokai ]])
        vim.keymap.set("n", "<leader>tt", "<cmd>Themery<CR>", { desc = "Activate Themery" })
    end,
}
