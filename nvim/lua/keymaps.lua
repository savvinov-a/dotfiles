local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Set <Leader>
vim.g.mapleader = ' '

-- System buffer, shift - Y
map('v', 'S-Y', '"+y', {})
map('i', 'jj', '<Esc>', {noremap = true})
