return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "folke/neodev.nvim",
    },
    config = function()
        require("neodev").setup()
        local lspconfig = vim.lsp.config
        local on_attach = function(_, bufnr)
            local only_buffer = { buffer = bufnr }

            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, only_buffer)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, only_buffer)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, only_buffer)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, only_buffer)
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, only_buffer)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, only_buffer)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, only_buffer)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, only_buffer)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, only_buffer)
            vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, only_buffer)

            vim.api.nvim_buf_create_user_command(0, 'Dia', vim.diagnostic.setqflist, {})
        end

        -- Lua
        lspconfig("lua_ls", {
            on_attach = on_attach,
            settings = {
                Lua = {
                    workspace = {
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })

        -- Go
        lspconfig("gopls", {
            on_attach = on_attach,
        })

        -- Python
        -- Config Poetry
        local function get_poetry_venv_path()
            -- poetry env info --path' to get the path
            local venv_path = vim.fn.systemlist('poetry env info --path')[1]
            if venv_path == "" then
                return nil  -- is't not found return nil
            end
            return venv_path
        end

        -- Get pythonpath
        local python_path = get_poetry_venv_path()
        if python_path then
            python_path = python_path .. "/bin/python"
        else
            python_path = "/usr/bin/python3" -- Fallback to python global 
        end

        lspconfig(
            "jedi_language_server",
            {
                on_attach = on_attach,
                -- pythonpath config
                init_options = {
                    workspace = {
                        environmentPath = python_path,
                    },
                }
            }
        )

        -- bash
        lspconfig(
            "bashls",
            {
                on_attach = on_attach,
        })

        -- tsserver
        lspconfig(
            "ts_ls",
            {
                on_attach = on_attach,
        })

    end
}
