-- goctl插件 提供api语法高亮等
local status_ok_3, goctl = pcall(require, "goctl")
if not status_ok_3 then
  return
end

goctl.setup()

local status_ok, go = pcall(require, "vim-go")
if not status_ok then
	return
end

go.setup({
  -- optional configuration
})

local status_ok_2, structrue_go = pcall(require, "structrue-go")
if not status_ok_2 then
  return
end

structrue_go.setup({
  keymap = {
		toggle = "<leader><leader>m", -- toggle structure-go window
	},
})
