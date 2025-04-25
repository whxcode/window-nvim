local opt = vim.opt

opt.mouse = "nv" -- Disable mouse in command-line mode
opt.shell = "zsh" -- Disable mouse in command-line mode

opt.history = 5000

opt.signcolumn = "no"

opt.scrolloff = 10
opt.sidescrolloff = 10

-- Undo
opt.undofile = true
opt.undolevels = 10000
opt.writebackup = false

-- If sudo, disable vim swap/backup/undo/shada writing
local USER = vim.env.USER or ""
local SUDO_USER = vim.env.SUDO_USER or ""
if
  SUDO_USER ~= ""
  and USER ~= SUDO_USER
  and vim.env.HOME ~= vim.fn.expand("~" .. USER, true)
  and vim.env.HOME == vim.fn.expand("~" .. SUDO_USER, true)
then
  vim.opt_global.modeline = false
  vim.opt_global.undofile = false
  vim.opt_global.swapfile = false
  vim.opt_global.backup = false
  vim.opt_global.writebackup = false
  vim.opt_global.shadafile = "NONE"
end

-- opt.foldenable = true -- enable folding
-- opt.foldlevelstart = 10 -- open most folds by default
-- opt.foldnestmax = 10 -- 10 nested fold max
-- opt.foldmethod = "indent" -- fold based on indent level

opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true

-- Enable python3 provider back for CopilotChat.nvim
-- vim.g.loaded_python3_provider = 0
-- Disable providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

vim.g.maplocalleader = ","

vim.g.lazygit_config = true
vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.98 -- scaling factor for floating window
vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } -- customize lazygit popup window border characters
vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
vim.g.lazygit_config_file_path = "" -- custom config file path
-- OR
vim.g.lazygit_config_file_path = {} -- table of custom config file paths

vim.g.lazygit_on_exit_callback = nil -- optional function callback when exiting lazygit (useful for example to refresh some UI elements after lazy git has made some changes)

vim.g.lazyvim_picker = "fzf"

vim.opt.laststatus = 3
