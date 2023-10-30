return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = { 
                "c_sharp",
                "rust",
                "typescript",
                "javascript",
                "lua",
                "json" 
            },
            highlight = {
                enable = true
            }
        }
    end
}
