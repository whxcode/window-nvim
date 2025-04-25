-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = vim.keymap.set

-- formatting
map({ "n", "v" }, "gq", function()
  Util.format({ force = true })
end, { desc = "Format" })

map({ "n" }, "<leader>rn", function()
  Util.format({ force = true })
end, { desc = "Format" })

--
map({ "n", "v" }, "<C-P>", "<cmd>BufferLinePick<cr>")
map({ "n", "v" }, ";q", "<cmd>BufferLineCloseOthers<cr>")
map({ "n", "v" }, "<C-q>", "<cmd>exit<cr>", { desc = "exit nvim" })
-- map({ "n", "v" }, ";g", "<cmd>exit<cr>", { desc = "exit nvim" })

if require("lazyvim.util").has("inc-rename.nvim") then
  map({ "n" }, "<leader>rn", function()
    local inc_rename = require("inc_rename")
    return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
  end, { desc = "rename" })
else
  map({ "n" }, "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
end

-- map({ "n" }, "<leader>gg", "")

map({ "n", "v" }, ",ci", "<cmd>ClangdToggleInlayHints<cr>", { desc = "ClangdToggleInlayHints" })
map({ "n", "v" }, ",ca", "<cmd>ClangdAST<cr>", { desc = "ClangdAST" })
map({ "n", "v" }, ",ch", "<cmd>ClangdTypeHierarchy<cr>", { desc = "ClangdTypeHierarchy" })
map({ "n", "v" }, ",cr", "<cmd>CMakeRun<cr>", { desc = "CMakeRun" })
map({ "n", "v" }, "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "toggle_current_line_blame" })

-- Move current line down
map("n", "<C-,>", ":m .+1<CR>", { noremap = true, silent = true })

-- Move current line up
map("n", "<C-.>", ":m .-2<CR>", { noremap = true, silent = true })

map("n", "<A-q>", "<cmd>qall<CR>", { noremap = true, silent = true })

-- 定义一个函数来执行 make 命令并发送通知
local function make_uikit()
  --local result = vim.fn.system("echo pwd")
  -- require("notify")("UIKit compilation finished", "info")
end

map("n", ",db", function()
  local current_path = vim.fn.expand("%")
  vim.fn.setreg("+", current_path)
  print(current_path)
end, { noremap = true, silent = true, desc = "Copy current path to clipboard" })

map("n", ",dg", function()
  local diagnostics = vim.lsp.diagnostic.get_line_diagnostics()
  local messages = {}
  for _, diagnostic in ipairs(diagnostics) do
    table.insert(messages, diagnostic.message)
  end
  local result = table.concat(messages, "\n")
  vim.fn.setreg("+", result)
  print(result)
end, { desc = "Copy diagnostics to clipboard" })

map("n", ",do", function()
  -- 获取当前文件的目录路径
  local current_path = vim.fn.expand("%:p:h")
  vim.fn.system("explorer.exe $(" .. "wslpath -w " .. current_path .. ")")
end, { desc = "Open current directory in Windows Explorer" })

-- map({ "n", "v", "i" }, "<leader>t", function()
--   Snacks.terminal(nil, { cwd = LazyVim.root() })
-- end, { desc = "Terminal (Root Dir)" })
