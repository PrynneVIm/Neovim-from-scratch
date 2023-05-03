local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " "

-- Install your plugins here
lazy.setup({
	{ "nvim-lua/plenary.nvim" }, -- commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" -- Useful lua functions used by lots of plugins
	{ "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" }, -- Autopairs, integrates with both cmp and treesitter
	{ "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" },
	{ "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" },
	{ "nvim-tree/nvim-web-devicons" }, -- { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" },
	{ "nvim-tree/nvim-tree.lua" }, -- { "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" },
	{ "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" },
	{ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" },
	{ "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" },
	{ "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" },
	{ "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" },
	{ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" },
	{ "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" },
	{ "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" },
	{ "folke/which-key.nvim" },

	-- Colorschemes
	"PrynneVim/darkplus.nvim",

	-- Cmp
	{ "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" }, -- The completion plugin
	{ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }, -- buffer completions
	{ "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }, -- path completions
	{ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lsp", commit = "3cf38d9c957e95c397b66f91967758b31be4abe6" },
	{ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" },
	{ "hrsh7th/cmp-emoji" },
	{ "hrsh7th/cmp-calc" },
	{ "octaltree/cmp-look" },
	{
		"tzachar/cmp-tabnine",
		build = "./install.sh",
		dependencies = "hrsh7th/nvim-cmp",
	},
	"f3fora/cmp-spell",

	-- Snippets
	{ "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" }, --snippet engine
	{ "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" }, -- a bunch of snippets to use

	-- LSP
	-- { "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" }, -- enable LSP
	"neovim/nvim-lspconfig",
	{ "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12" }, -- simple to use language server installer
	{ "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" },
	{ "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" }, -- for formatters and linters
	{ "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" },
	-- "j-hui/fidget.nvim", -- lsp加载进度ui
	-- "mfussenegger/nvim-jdtls", -- java lsp
	-- "folke/neodev.nvim",

	-- Telescope
	{ "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" },
	{ "LinArcX/telescope-env.nvim" },

	-- 快速定位单词和某一行
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
	},

	-- 十六进制颜色高亮
	{
		"norcalli/nvim-colorizer.lua",
	},

	-- 快速更改分隔符
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
	},

	-- markdown
	{ "iamcco/markdown-preview.nvim" }, -- 这里需要手动安装参考官方文档
	{ "dhruvasagar/vim-table-mode" },
	"img-paste-devs/img-paste.vim",

	-- Database
	"tpope/vim-dadbod",
	"kristijanhusak/vim-dadbod-ui",

	-- cmp自动补全
	"kristijanhusak/vim-dadbod-completion",

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac" },
	"p00f/nvim-ts-rainbow",
	"nvim-treesitter/playground",
	"m-demare/hlargs.nvim",
	"nvim-treesitter/nvim-treesitter-context",

	-- Translator
	"voldikss/vim-translator",

	-- 多光标操作
	"mg979/vim-visual-multi",

	-- 类似vscode的问题展示
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- TODO list
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},

	-- Tagbar
	"preservim/tagbar",

	-- Git
	"lewis6991/gitsigns.nvim", -- { "lewis6991/gitsigns.nvim", commit = "2c6f96dda47e55fa07052ce2e2141e8367cbaaf2" },
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },

	-- Renamer
	{
		"filipdutescu/renamer.nvim",
		branch = "master",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},

	-- Noice
	{
		"folke/noice.nvim",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

	-- GitHub Copilot
	-- "github/copilot.vim",
	{ "zbirenbaum/copilot.lua" },

	-- ChatGPT
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},

	-- debugger
	"mfussenegger/nvim-dap",
	"theHamsta/nvim-dap-virtual-text",
	"rcarriga/nvim-dap-ui",
	"nvim-telescope/telescope-dap.nvim",
	"leoluz/nvim-dap-go",
	"vim-test/vim-test",
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-vim-test",
		},
	},

	-- Go
	{ "fatih/vim-go", build = ":GoUpdateBinaries" },
	{ "crusj/structrue-go.nvim", branch = "main" },

	-- Rust
	"simrat39/rust-tools.nvim",
})
