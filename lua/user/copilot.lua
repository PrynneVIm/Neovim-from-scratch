-- use this table to disable/enable filetypes
-- vim.g.copilot_filetypes = { xml = false }

-- 开启代理
-- vim.g.copilot_proxy = 'localhost:7890'

-- vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]

-- 快捷键
-- vim.g.copilot_assume_mapped = true
-- vim.api.nvim_set_keymap("!", "<C-]>", 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap=true })


local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
	return
end


local copilotCmp_status_ok, copilotCmp = pcall(require, "copilot_cmp")
if not copilotCmp_status_ok then
	return
end

copilot.setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = false,
    debounce = 75,
    keymap = {
      accept = "<Tab>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
  server_opts_overrides = {},
})


-- TODO: copilot cmp提示 输出格式不正确
copilotCmp.setup {
  method = "getCompletionsCycling",
  formatters = {
    label = require("copilot_cmp.format").format_label_text,
    insert_text = require("copilot_cmp.format").format_insert_text,
    preview = require("copilot_cmp.format").deindent,
  },
}
