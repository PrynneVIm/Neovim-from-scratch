-- local colorscheme = "tokyonight"
local colorscheme = "darkplus"
-- local colorscheme = "everforest"
-- local colorscheme = "PaperColor"
-- local colorscheme = "vscode"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. "not found!")
  return
end
