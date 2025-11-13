local go_fmt_group = vim.api.nvim_create_augroup("GoFormatOnSave", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
	group = go_fmt_group,
	pattern = "*.go",
	callback = function(args)
		local ok, conform = pcall(require, "conform")
		if not ok then
			return
		end

		conform.format({
			bufnr = args.buf,
			timeout_ms = 2000,
			lsp_fallback = true,
			quiet = true,
		})
	end,
})
