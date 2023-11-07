return {
    "mfussenegger/nvim-lint",
    event = "InsertEnter",
    config = function ()
        require("lint").linters_by_ft = {
            typescript = { "eslint" }
        }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function ()
                require("lint").try_lint()
            end
        })
    end
}
