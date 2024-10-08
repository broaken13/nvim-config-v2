return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        { 
            "windwp/nvim-ts-autotag", -- Auto close xml style tags
            config = function()
                require("nvim-ts-autotag").setup({
                    opts = {
                        enable_close_on_slash = true
                    }
                })
            end
        }
    },
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = {
                "c_sharp",
                "dockerfile",
                "gitignore",
                "go",
                "rust",
                "zig",
                "typescript",
                "javascript",
                "sql",
                "lua",
                "json",
                "tsx",
                "css",
                "html",
                "regex",
                "printf",
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm"
                },
            },
        }
    end
}
