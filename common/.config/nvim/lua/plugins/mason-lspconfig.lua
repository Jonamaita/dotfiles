-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#automatic-server-setup-advanced-feature
return {
    'williamboman/mason-lspconfig.nvim',
    opts = {},
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
    },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "jedi_language_server", -- python you shall installed pipx in your system
                "gopls",          -- Go
                "ts_ls",       -- JavaScript/TypeScript
                "html",           -- HTML
                "lua_ls",          -- Lua
            },
            automatic_enable = true,
        })
    end
}
