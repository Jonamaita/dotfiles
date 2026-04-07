vim.g.mapleader = (" ")
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

require("lazy").setup("plugins")
require("vim-options")

----------------------------------
-- 🚀 Treesitter Auto-Activation
----------------------------------
vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        'bash',
        'c',
        'cpp',
        'css',
        'dockerfile',
        'fish',
        'gitignore',
        'go',
        'gomod',
        'graphql',
        'html',
        'javascript',
        'json',
        'kdl',
        'lua',
        'make',
        'markdown',
        'meson',
        'ninja',
        'php',
        'python',
        'rasi',
        'ruby',
        'rust',
        'scss',
        'sql',
        'sxhkdrc',
        'toml',
        'tsx',
        'twig',
        'typescript',
        'vue',
        'yaml',
        'comment',
    },
    callback = function() vim.treesitter.start() end,
})
