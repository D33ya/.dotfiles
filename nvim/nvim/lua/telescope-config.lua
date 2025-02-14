local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
-- local actions = require 'telescope.actions'
-- local action_state = require 'telescope.actions.state'
local Path = require 'plenary.path'
-- local utils = require 'telescope.utils'
local scandir = require 'plenary.scandir'
local entry_display = require 'telescope.pickers.entry_display'
local strings = require 'plenary.strings'

-- Telescope extension for dotfiles
local get_dotfiles = function()
  local base_dir = Path:new '~/.config/'
  local dir_path = base_dir:expand()
  local dir = scandir.scan_dir(dir_path, { add_dirs = true, only_dirs = true, depth = 0 })
  local configs = {}

  for _, path in ipairs(dir) do
    local title = vim.fs.basename(path)
    table.insert(configs, { title = title, path = path })
  end

  return configs
end

local dotfile_finder = function(configs)
  local widths = {
    title = 0,
    display_path = 0,
  }

  for _, config in pairs(configs) do
    local display_path = config.path:gsub('\n', '\\n')
    config.display_path = '[' .. display_path .. ']'
    config.display_title = config.title:gsub('\n', '\\n')

    for key, value in pairs(widths) do
      widths[key] = math.max(value, strings.strdisplaywidth(config[key] or ''))
    end
  end

  local create_opts = {
    separator = ' ',
    items = {
      { width = widths.title },
      { width = widths.display_path },
    },
  }

  local displayer = entry_display.create(create_opts)
  local make_display = function(entry)
    local display_opts = {
      { entry.display_title },
      { entry.display_path },
    }

    return displayer(display_opts)
  end

  return finders.new_table {
    results = configs,
    entry_maker = function(config)
      config.value = config.path
      if type(search_by) == 'string' then
        config.ordinal = config[search_by]
      end
      if type(search_by) == 'table' then
        config.ordinal = ''
        for _, property in ipairs(search_by) do
          config.ordinal = config.ordinal .. ' ' .. config[property]
        end
      end
      config.display = make_display
      return config
    end,
  }
end

local dotfiles = function(opts)
  opts = opts or { conf_dir = '~/.config' }

  pickers
    .new(opts, {
      prompt_title = 'dotfiles',
      finder = dotfile_finder(get_dotfiles()),
      sorter = conf.generic_sorter(opts),
    })
    :find()
end

-- to execute the function
dotfiles()
