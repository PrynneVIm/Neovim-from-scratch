local status_ok, go = pcall(require, "vim-go")
if not status_ok then
	return
end

go.setup({
  -- optional configuration
})
