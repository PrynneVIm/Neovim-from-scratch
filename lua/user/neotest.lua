local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	return
end

local neotest_ns = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      local message =
        diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
      return message
    end,
  },
}, neotest_ns)

neotest.setup({
  icons ={
    -- https://www.bilibili.com/video/BV1GD4y1B7Xm/?vd_source=d6bc7040894b607a59071589b402d7f2
  },
  adapters = {
    require("neotest-go"),
    -- require("neotest-go")({
    --   experimental = {
    --     test_table = true,
    --   },
    --   args = { "-count=1", "-timeout=60s" }
    -- }),
    require("neotest-plenary"),
    -- require("neotest-vim-test")({
    --   ignore_file_types = { "python", "vim", "lua" },
    -- }),
  },
})
