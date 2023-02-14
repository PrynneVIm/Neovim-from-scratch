local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	return
end


-- 十六进制颜色高亮
colorizer.setup()
