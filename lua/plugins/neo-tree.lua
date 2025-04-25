-- Plugin: Neo-tree
-- https://github.com/rafi/vim-config

local winwidth = 25

-- Toggle width.
local toggle_width = function()
  local max = winwidth * 2
  local cur_width = vim.fn.winwidth(0)
  local half = math.floor((winwidth + (max - winwidth) / 2) + 0.4)
  local new_width = winwidth
  if cur_width == winwidth then
    new_width = half
  elseif cur_width == half then
    new_width = max
  else
    new_width = winwidth
  end
  vim.cmd(new_width .. " wincmd |")
end

-- Get current opened directory from state.
---@param state table
---@return string
local function get_current_directory(state)
  local node = state.tree:get_node()
  local path = node.path
  if node.type ~= "directory" or not node:is_expanded() then
    local path_separator = package.config:sub(1, 1)
    path = path:match("(.*)" .. path_separator)
  end
  return path
end

return {
  "nvim-neo-tree/neo-tree.nvim",

  opts = {
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function(arg)
          vim.cmd([[
          setlocal relativenumber
        ]])
        end,
      },
    },

    window = {
      width = winwidth,
      mappings = {
        ["w"] = toggle_width,
      },
    },
    filesystem = {
      window = {
        mappings = {

          ["gf"] = function(state)
            require("fzf-lua").files({
              cwd = get_current_directory(state),
            })
          end,

          ["gr"] = function(state)
            require("fzf-lua").live_grep({
              cwd = get_current_directory(state),
            })
          end,
        },
      },
    },
  },
}
