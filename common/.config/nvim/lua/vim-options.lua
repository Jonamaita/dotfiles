----------------------------------
-- 🌟 Neovim General Settings
----------------------------------

-- Tabs and indentation
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.tabstop = 4             -- Number of spaces tabs count for
vim.opt.softtabstop = 4         -- Number of spaces when pressing <Tab> in insert mode
vim.opt.shiftwidth = 4          -- Indent amount for << and >>
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.smartcase = true

-- Interface and UI
vim.opt.number = true           -- Show line numbers
vim.opt.cursorline = true       -- Highlight current line
vim.opt.laststatus = 2          -- Always show statusline
vim.opt.showmode = false        -- Hide "-- INSERT --" mode since it's in statusline
vim.opt.list = true             -- Show whitespace characters
vim.opt.listchars = {
    trail = '•',                -- Character for trailing spaces
    tab = '  ',                 -- This hides the tab character using two spaces.
}
vim.opt.guicursor = {
  "r-ci-ve:ver25-Cursor/lCursor", -- Thin vertical cursor in insert/replace
}

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- Use system clipboard

-- Behavior
vim.opt.joinspaces = false      -- Don't add two spaces when joining lines
vim.keymap.set('n', 'Q', '<nop>') -- Disable Ex mode

----------------------------------
-- ⌨️ Keymaps
----------------------------------

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Insert mode
vim.keymap.set('i', '<C-e>', '<End>') -- Move to end of line in insert mode

-- Command-line mode
vim.keymap.set('c', '<C-a>', '<Home>') -- Start of command
vim.keymap.set('c', '<C-e>', '<End>')  -- End of command

-- Indentation in visual mode
vim.keymap.set('i', '<S-Tab>', '<C-d>', { noremap = true, silent = true }) -- insert mode
vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true, silent = true })   -- visual mode
vim.keymap.set('n', '<S-Tab>', '<<', { noremap = true, silent = true })   -- normal mode
