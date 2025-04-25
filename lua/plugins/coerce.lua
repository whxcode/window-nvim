return {
  "gregorias/coerce.nvim",
  tag = "v4.1.0",
  config = function()
    require("coerce").setup({
      keymap_registry = require("coerce.keymap").keymap_registry(),
      -- The notification function used during error conditions.
      notify = function(...)
        return vim.notify(...)
      end,
      default_mode_keymap_prefixes = {
        normal_mode = "c",
        visual_mode = "c",
      },
      -- Set any field to false to disable that mode.
      default_mode_mask = {
        normal_mode = true,
        motion_mode = true,
        visual_mode = true,
      },
    })
  end,
}
