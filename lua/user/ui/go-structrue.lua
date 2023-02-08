local status_ok, structrue_go = pcall(require, "structrue-go")
if not status_ok then
  return
end

structrue_go.setup()
