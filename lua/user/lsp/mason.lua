local servers = {
  "lua_ls",
	"cssls",
	"html",
	-- "tsserver",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
	"clangd",
	"gopls",
  -- "bufls",
  "dockerls",
  -- "marksman",
  -- "sqlls",
  -- "rust_analyzer", -- 不需要手动设置,开启会引发冲突(conflict)
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

-- local neodev_status_ok, neodev = pcall(require, "neodev")
-- if not neodev_status_ok then
-- 	return
-- end
--
-- -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
-- neodev.setup({
--   -- add any options here, or leave empty to use the default settings
--   library = { plugins = { "neotest" }, types = true },
-- })

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
