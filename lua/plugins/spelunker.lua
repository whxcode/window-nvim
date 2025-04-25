local M = {
  url = "https://github.com/kamykn/spelunker.vim",
  cmd = { "SpelunkerAddAll", "SpelunkerStart" },
  lazy = false,
  priority = 1000,
  keys = {

    {
      "[s",
      "<cmd>call spelunker#jump_next()<CR>",
      desc = "jump bad next spell",
    },

    {
      "]s",
      "<cmd>call spelunker#jump_prev()<CR>",
      desc = "jump bad prev spell",
    },

    {
      "zl",
      "<cmd>call spelunker#correct_from_list()<CR>",
      desc = "jump bad next spell",
    },

    {
      "zL",
      "<cmd>call spelunker#correct_all_from_list()<CR>",
      desc = "jump bad next spell",
    },

    {
      "zc",
      "<cmd>call spelunker#correct()<CR>",
      desc = "jump bad next spell",
    },

    {
      "zC",
      "<cmd>call spelunker#correct_all()<CR>",
      desc = "jump bad next spell",
    },

    {
      "zf",
      "<cmd>call spelunker#correct_feeling_lucky()<CR>",
      desc = "jump bad next spell",
    },

    {
      "zF",
      "<cmd>call spelunker#correct_all_feeling_lucky()<CR>",
      desc = "jump bad next spell",
    },

    {
      "<leader>by",
      function()
        local path = vim.fn.expand("%:p") --[[@as string]]

        if path == "" then
          return ""
        end

        local cwd = LazyVim.root.cwd()
        path = path:sub(#cwd + 2)

        vim.api.nvim_command('let @+="' .. path .. '"')
        print("write clipboard:[" .. path .. "]")
      end,
      desc = "jump bad next spell",
    },
  },
  config = function() end,
}

return M
