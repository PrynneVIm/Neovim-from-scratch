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
