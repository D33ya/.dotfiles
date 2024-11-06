do
  local _, neorg = pcall(require, 'neorg.core')
  local dirman = neorg.modules.get_module 'core.dirman'
  local function get_todos(dir, states)
    local current_workspace = dirman.get_current_workspace()
    local dir = current_workspace[2]
    require('telescope.builtin').live_grep { cwd = dir }
    vim.fn.feedkeys('^ *([*]+|[-]+) +[(]' .. states .. '[)]')
  end

  -- This can be bound to a key
  vim.keymap.set('n', '<c-t>', function()
    get_todos('~/notes', '[^x_]')
  end)
end
