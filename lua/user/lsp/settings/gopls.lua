local util = require "lspconfig.util"

return {
	cmd = {"gopls"},
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  -- root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  root_dir = function(fname)
    return util.root_pattern 'go.work'(fname) or util.root_pattern('go.mod', '.git')(fname)
  end,
  single_file_support = true,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
	  codelenses = {
          gc_details = true,
      }
    },
  },
}
