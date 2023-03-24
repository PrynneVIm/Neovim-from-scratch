local util = require "lspconfig.util"

local root_pattern = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")

local clangd_flags = {
  "--all-scopes-completion",
  "--suggest-missing-includes",
  "--background-index",
  "--pch-storage=disk",
  "--cross-file-rename",
  "--log=info",
  "--completion-style=detailed",
  "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
  "--clang-tidy",
  "--offset-encoding=utf-16", --temporary fix for null-ls
  -- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
  -- "--fallback-style=Google",
  -- "--header-insertion=never",
  -- "--query-driver=<list-of-white-listed-complers>"
}

return {
  cmd = {"clangd", unpack(clangd_flags) };
  filetypes = {"c", "cpp", "objc", "objcpp"};
  root_dir = function(fname)
    local filename = util.path.is_absolute(fname) and fname
      or util.path.join(vim.loop.cwd(), fname)
    return root_pattern(filename) or util.path.dirname(filename)
  end;
}
