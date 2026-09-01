local M = {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters = {
				require_cwd = true,
			},
			formatters_by_ft = {
				-- Lua
				lua = { "stylua" },

				-- Go: goimports fixes imports, gofumpt applies strict formatting
				go = { "goimports", "gofumpt" },

				-- JavaScript/TypeScript
				javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
				typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },

				-- Web
				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				scss = { "prettierd", "prettier", stop_after_first = true },
				less = { "prettierd", "prettier", stop_after_first = true },

				-- Config/Data
				json = { "biome", "prettierd", "prettier", stop_after_first = true },
				jsonc = { "biome", "prettierd", "prettier", stop_after_first = true },
				yaml = { "prettierd", "prettier", stop_after_first = true },

				-- SQL
				sql = { "sqlfmt" },

				-- Markdown
				markdown = { "prettierd", "prettier", stop_after_first = true },
				["markdown.mdx"] = { "prettierd", "prettier", stop_after_first = true },

				-- GraphQL
				graphql = { "prettierd", "prettier", stop_after_first = true },

				-- Vue/Svelte
				vue = { "prettierd", "prettier", stop_after_first = true },
				svelte = { "prettierd", "prettier", stop_after_first = true },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
}

return M
