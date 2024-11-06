vim.g.mapleader = ' '
vim.g.maplocalleader = ';'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Setting ]]

require 'settings'

-- [[ Basic Keymaps ]]
--
require 'keymaps'

-- [[ Basic Autocommands ]]

require 'autocmds'

-- [[ Install `lazy.nvim` plugin manager ]]

require 'config.lazy'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
