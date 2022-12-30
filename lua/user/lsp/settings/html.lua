local util = require "lspconfig/util"
local root_pattern = util.root_pattern("package.json")



return {
	cmd = {"html-languageserver", "--stdio"},
  filetypes = {"html"},
  root_dir = function(fname)
    return root_pattern(fname) or vim.loop.os_homedir()
  end;
  init_options = {
    configurationSection= {"html", "css", "javascript"},
    embeddedLanguages  = {
      css = true,
      javascript = true
    }
  },
  settings = {},
}
