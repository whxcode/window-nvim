return {
  "stevearc/overseer.nvim",
  opts = {
    bundles = {
      -- When saving a bundle with OverseerSaveBundle or save_task_bundle(), filter the tasks with
      -- these options (passed to list_tasks())
      save_task_opts = {
        bundleable = true,
      },
      -- Autostart tasks when they are loaded from a bundle
      autostart_on_load = true,
    },
  },
  keys = {
    { "<leader>ol", "<cmd>OverseerLoadBundle<cr>", desc = "load list" },
  },
}
