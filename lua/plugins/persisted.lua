-- Lua
return {
  "olimorris/persisted.nvim",
  lazy = false, -- make sure the plugin is always loaded at startup
  ops = {
    autoload = true,
  },
  config = function()
    require("persisted").setup({
      use_git_branch = true, -- Include the git branch in the session file name?
      autoload = true,

      telescope = {
        mappings = { -- Mappings for managing sessions in Telescope
          copy_session = "<C-c>",
          change_branch = "<C-b>",
          delete_session = "<C-d>",
        },
        icons = { -- icons displayed in the Telescope picker
          selected = " ",
          dir = "  ",
          branch = " ",
        },
      },
    })
  end,
}
