-- use this table to disable/enable filetypes
vim.g.copilot_filetypes = { xml = false }

-- 开启代理
vim.g.copilot_proxy = 'localhost:7890'

vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]
