return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim"
    },
    config = function()
        local mason = require("mason")
        local mason_config = require("mason-lspconfig")

        mason.setup({})
        mason_config.setup({
            ensure_installed = {
                "omnisharp",
                "html",
                "cssls",
                "lua_ls",
                "tsserver",
                "rust_analyzer"
            },
            automatic_installation = true
        })
    end
}
