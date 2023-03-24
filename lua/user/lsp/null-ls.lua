local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.yamlfmt,

    -- go formatting
    formatting.gofmt,
    -- formatting.gofumpt,
    formatting.goimports,
    -- formatting.goimports_reviser,
    -- formatting.golines,

		-- 通过echo executable("eslint") 查看是否安装了eslint
		-- 如果为0则没有安装 \
		-- 通过npm install -g eslint 安装
		diagnostics.eslint,
		-- diagnostics.buf,
		null_ls.builtins.code_actions.gitsigns,
		-- diagnostics.flake8
	},
})
