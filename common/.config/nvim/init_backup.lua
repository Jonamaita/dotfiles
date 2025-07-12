vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.g.mapleader = (" ")

-- Configurar Shift + Tab para desindentar
vim.api.nvim_set_keymap('i', '<S-Tab>', '<C-d>', { noremap = true, silent = true }) -- en modo inserción
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true })   -- en modo visual
vim.api.nvim_set_keymap('n', '<S-Tab>', '<<', { noremap = true, silent = true })   -- en modo normal


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Theme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }
}
local opts = {}

require("lazy").setup(plugins, opts)

-- Color Scheme Setup
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"


-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {noremap = true, silent = true})

-- treesitter
local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = { "lua", "vim", "query", "javascript", "html", "go", "python", "dockerfile", "bash", "yaml"},
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },  
})

-- shortcut to open neotree
vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })

