return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim'
    },
    name="telescope",
    config = function()
      local builtin = require('telescope.builtin')
      local actions = require('telescope.actions')
      local themes = require('telescope.themes')
      local telescope = require('telescope')

      telescope.setup(
        {
          defaults = {
            mappings = {
              i = {
                  ['<esc>'] = actions.close,
                  ['<C-u>'] = false,
            },
          },
        },
          extensions = {
            ['ui-select'] = themes.get_cursor({}),
          },
        }
      )
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>a', builtin.live_grep, {noremap = true, silent = true})
      vim.keymap.set('n', '<leader>b', builtin.buffers)
      telescope.load_extension('ui-select')
      
    end
}
