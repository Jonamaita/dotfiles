return {
  "szw/vim-maximizer",
  config = function()
    vim.keymap.set('n', '<leader>z', ':MaximizerToggle<CR>', { noremap = true, silent = true })
  end
}

