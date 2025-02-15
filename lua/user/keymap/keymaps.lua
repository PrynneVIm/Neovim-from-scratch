local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- 重命名元素
-- keymap('n', '<leader>re', '<cmd>lua require("renamer").rename()<cr>', opts)
-- keymap('v', '<leader>re', '<cmd>lua require("renamer").rename()<cr>', opts)

-- 快速定位单词
keymap('n', '<leader><leader>w', '<cmd>HopWord<cr>', opts)
keymap('n', '<leader><leader>a', '<cmd>HopAnywhere<cr>', opts)

-- 打开文件大纲
keymap('n', '<F8>', '<cmd>TagbarToggle<cr>', opts)

-- 打开测试
keymap('n', '<leader><leader>t', "<cmd>lua require('neotest').summary.toggle()<CR>", opts)

-- 打开可视化数据库
keymap('n', '<leader><leader>d', '<cmd>DBUIToggle<cr>', opts)

-- 快速分屏
keymap('n', "<leader>\\", '<cmd>vs<cr>', opts)

-- 快速保存
keymap('n', "<C-s>", '<cmd>w!<cr>', opts)

-- 翻译
-- keymap('n', "<leader>tw", '<cmd>TranslateW<cr>', opts)
keymap('v', "<leader>tw", '<cmd>TranslateW<cr>', opts)

-- Undo Tree
keymap('n', "<leader><F5>", '<cmd>UndotreeToggle<cr>', opts)

-- TagbarToggle
-- keymap('n', '<F8>', ":TagbarToggle<CR>", opts)

-- Insert --
-- Press jk fast to exit insert mode 
-- keymap("i", "jk", "<ESC>", opts)
-- keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

