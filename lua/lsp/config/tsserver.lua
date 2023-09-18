local function config(opts)
	function opts.on_attach(client)
		client.server_capabilities.documentFormattingProvider = false
	end
end

return config
