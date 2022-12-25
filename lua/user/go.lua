vim.g.go_fmt_command = 'goimports'

vim.g.go_autodetect_gopath = 1
-- vim g:go_bin_path = '$GOBIN'

vim.g:go_version_warning = 1

vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_generate_tags = 1
vim.g.go_highlight_methods = 1


vim.g:godef_split=2

-- Open :GoDeclsDir with ctrl-g
-- nmap <C-g> :GoDeclsDir<cr>
-- imap <C-g> <esc>:<C-u>GoDeclsDir<cr>