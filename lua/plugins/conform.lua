return {
	{
		"stevearc/conform.nvim",
		opts = function(_, opts)
			local function prettierd_first()
				return { "prettierd", "prettier", stop_after_first = true }
			end

			opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
				-- Lua
				lua = { "stylua" },

				-- JavaScript/TypeScript
				javascript = prettierd_first(),
				javascriptreact = prettierd_first(),
				typescript = prettierd_first(),
				typescriptreact = prettierd_first(),

				-- Web
				html = prettierd_first(),
				css = prettierd_first(),
				scss = prettierd_first(),
				less = prettierd_first(),

				-- Config/Data
				json = prettierd_first(),
				jsonc = prettierd_first(),
				yaml = prettierd_first(),

				-- Go
				go = { "gofumpt", "goimports", stop_after_first = true },

				-- Markdown
				markdown = prettierd_first(),
				["markdown.mdx"] = prettierd_first(),

				-- GraphQL
				graphql = prettierd_first(),

				-- Vue/Svelte
				vue = prettierd_first(),
				svelte = prettierd_first(),
			})

			return opts
		end,
	},
}
