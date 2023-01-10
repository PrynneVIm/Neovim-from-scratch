local util = require "lspconfig.util"

local bin_name = 'vscode-html-language-server'
local cmd = { bin_name, '--stdio' }

if vim.fn.has 'win32' == 1 then
  cmd = { 'cmd.exe', '/C', bin_name, '--stdio' }
end

return {
	cmd = cmd,
  filetypes = {"html"},
  root_dir = util.root_pattern('package.json', '.git'),
  single_file_support = true,
  init_options = {
    provideFormatter = true,
    configurationSection= {"html", "css", "javascript"},
    embeddedLanguages  = {
      css = true,
      javascript = true
    }
  },
  settings = {},
}
