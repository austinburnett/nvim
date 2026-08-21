---@param capabilities lsp.ClientCapabilities
local function configureLuaLs(capabilities)
    local config =
    {
        on_init = function(client)
            if client.workspace_folders then
                local path = client.workspace_folders[1].name

                if path ~= vim.fn.stdpath('config') and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
                    return
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua,
                {
                    runtime = { version = 'LuaJIT', path = { 'lua/?.lua', 'lua/?/init.lua', }, },

                    -- Make the server aware of Neovim runtime files
                    workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } }
                })
            end
        end,

        settings = { Lua = {} },
        capabilities = capabilities
    }

    vim.lsp.config('lua_ls', config)
    vim.lsp.enable("lua_ls")
end


---@param capabilities lsp.ClientCapabilities
local function configureClangd(capabilities)
    vim.lsp.config("clangd", {capabilities = capabilities})
    vim.lsp.enable("clangd")
end


return
{
    {
        "neovim/nvim-lspconfig",
        dependencies =
        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts =
            {
                library =
                {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            configureLuaLs(capabilities)
            configureClangd(capabilities)
        end,
    }
}
