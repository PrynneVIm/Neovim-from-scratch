local capabilities = require("user.lsp.handlers").capabilities
capabilities.offsetEncoding = { "utf-16" }
local opts = {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		local lspComm = require("user.lsp.handlers")
		lspComm.keyAttach(bufnr)
		-- lspComm.shwLinDiaAtom(bufnr)
		-- lspComm.hlSymUdrCursor(client, bufnr)
		-- lspComm.disableFormat(client)
	end,
	handlers = require("user.lsp.handlers").handlers,
}
return {
	on_setup = function(server)
		server.setup(opts)
	end,
}