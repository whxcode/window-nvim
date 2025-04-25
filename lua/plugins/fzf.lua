return {
  "ibhagwan/fzf-lua",
  opts = {
    winopts = {
      width = 0.95,
      height = 0.95,
    },
  },
  keys = {
    { "<leader>fs", "<cmd>FzfLua git_files<cr>", desc = "Find Files (git-files)" },
    { "<leader>fg", "<cmd>FzfLua git_status<CR>", desc = "Status" },
    { "<leader><leader>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    { "<leader>ff", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
  },
}
