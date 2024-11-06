local M = {}

M.dotfiles = function()
  local picker = require 'telescope._extensions.file_browser.picker'
  Opts = {
    cwd = '~/.dotfiles/',
    promt_title = 'Dotfiles',
  }
  picker(Opts)
end

return M
