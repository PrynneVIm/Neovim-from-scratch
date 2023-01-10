local spell_group = vim.api.nvim_create_augroup("spell_group", { clear = true })

vim.opt.spelloptions = "camel"

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "python", "go", "c", "cpp" },
  command = "setlocal spell spelllang=en_us,cjk",
  group = spell_group,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  command = "setlocal nospell",
  group = spell_group,
})
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*", -- disable spellchecking in the embeded terminal
  command = "setlocal nospell",
  group = spell_group,
})
