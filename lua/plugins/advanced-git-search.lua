return {
  "aaronhallaert/advanced-git-search.nvim",
  cmd = { "AdvancedGitSearch" },
  keys = {
    {
      "<leader>vc",
      ":AdvancedGitSearch search_log_content<CR>",
      desc = "find commit",
    },

    {
      "<leader>vf",
      ":AdvancedGitSearch search_log_content_file<CR>",
      desc = "find commit",
    },

    {
      "<leader>vl",
      ":AdvancedGitSearch diff_commit_line<CR>",
      desc = "find commit",
    },
  },
  --- See options
  config = function()
    -- optional: setup telescope before loading the extension
    require("advanced_git_search.fzf").setup({
      -- move this to the place where you call the telescope setup function
      diff_plugin = "diffview",
    })

    -- require("fzf-lua").load_extension("advanced_git_search")
  end,
  dependencies = {
    --- See dependencies
  },
}
