vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set autoindent")
vim.cmd("set smarttab")
vim.cmd("set clipboard=unnamedplus")

-- Bindings --
-- Move windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Insert mode
vim.keymap.set('i', '<C-e>', '<End>') -- Go to end line in insert mode
--vim.keymap.set('i', '<C-l>', '<Esc>', { noremap = true, silent = true })

-- Command Mode
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-e>', '<End>')

-- get rid of ex mode
vim.keymap.set('n', 'Q', '<nop>')

---

-- Show the relative path
vim.opt.laststatus = 2

-- Configurar Shift + Tab para desindentar
vim.api.nvim_set_keymap('i', '<S-Tab>', '<C-d>', { noremap = true, silent = true }) -- en modo inserción
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true })   -- en modo visual
vim.api.nvim_set_keymap('n', '<S-Tab>', '<<', { noremap = true, silent = true })   -- en modo normal

vim.opt.cursorline = true -- -- highlight cursor line
vim.o.joinspaces = false -- don't join spaces with J
vim.o.showmode = false -- Don't show "INSERT" below. It's in the statusline
vim.opt.list = true -- show whitespace

vim.opt.listchars = {
    trail = '•', -- BULLET (U+2022, UTF-8: E2 80 A2)
}

---- Cursor
vim.opt.guicursor = {
--  "n-v-c:block-Cursor/lCursor",
  "r-ci-ve:ver25-Cursor/lCursor",
--  "r-cr-o:hor20"
}
