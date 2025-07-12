return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      -- shortcut to open neotree
        vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>n', ':Neotree focus<CR>', {noremap = true, silent = true})

        require("neo-tree").setup({
          default_component_configs = {
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            default = "*",
            highlight = "NeoTreeFileIcon"
          },
        },
        filesystem = {
            filtered_items = {
                hide_gitignored = false,
                hide_dotfiles = false, -- Muestra archivos ocultos
                hide_by_name = {'.git'},
            },
        },
        })
    end
}
