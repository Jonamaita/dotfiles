return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
  },
  name="neogit",
  config = function()
    require('neogit').setup({
      disable_commit_confirmation = true,
      integrations = {
        diffview = true,
      },
    })

    vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<CR>')
  end
}
