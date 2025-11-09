return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            require("lspconfig").lua_ls.setup{capabilities = capabilities}
            require("lspconfig").clangd.setup{capabilities = capabilities}
            require("lspconfig").glsl_analyzer.setup{capabilities = capabilities}
        end,
    }
}
