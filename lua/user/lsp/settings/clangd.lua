local util = require "lspconfig/util"

local root_pattern = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")

return {
  cmd = {"clangd", "--background-index"};
  filetypes = {"c", "cpp", "objc", "objcpp"};
  root_dir = function(fname)
    local filename = util.path.is_absolute(fname) and fname
      or util.path.join(vim.loop.cwd(), fname)
    return root_pattern(filename) or util.path.dirname(filename)
  end;
}
