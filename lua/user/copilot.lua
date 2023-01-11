-- use this table to disable/enable filetypes
vim.g.copilot_filetypes = { xml = false }

-- 开启代理
vim.g.copilot_proxy = 'localhost:7890'

vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]

-- 快捷键
vim.g.copilot_assume_mapped = true

-- vim.api.nvim_set_keymap("!", "<C-]>", 'copilot#Accept("<CR>")', { silent = true, expr = true, noremap=true })
