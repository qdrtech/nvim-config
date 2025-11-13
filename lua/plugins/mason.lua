local M = {
   {
      "williamboman/mason.nvim",
      opts = {
			ensure_installed = {
				-- Formatters & Linters
				"prettierd",                    -- Fast Prettier daemon (preferred)
				"prettier",                     -- Fallback formatter
				"stylua",
				"shellcheck",
				"shfmt",
				"flake8",
				"gofumpt",
				"goimports",
				"golangci-lint",
				"gomodifytags",
				"gotests",
				"impl",
				"iferr",
				"delve",

				-- Language Servers
				"typescript-language-server",  -- TypeScript/JavaScript
				"vtsls",                        -- Alternative TS server
				"gopls",                        -- Go
				"omnisharp",                    -- C#
			},
		}
   }
}


return M
