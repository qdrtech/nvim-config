local M = {
   {
      "williamboman/mason.nvim",
      opts = {
			ensure_installed = {
				-- Formatters & Linters
				"prettierd",                    -- Fast Prettier daemon (preferred)
				"prettier",                     -- Fallback formatter
				"stylua",
				"shellcheck",                   -- Shell linter (driven by nvim-lint)
				"shfmt",

				-- Language Servers
				"typescript-language-server",  -- TypeScript/JavaScript
				"vtsls",                        -- Alternative TS server
				"gopls",                        -- Go
				"pyright",                      -- Python type checking
				"ruff",                         -- Python lint + format + import sorting (LSP)
			},
		},
		-- mason.nvim itself ignores `ensure_installed`; that key is a LazyVim
		-- convention. Install missing packages here via the bundled registry.
		config = function(_, opts)
			require("mason").setup(opts)
			local registry = require("mason-registry")
			registry.refresh(function()
				for _, tool in ipairs(opts.ensure_installed or {}) do
					local ok, pkg = pcall(registry.get_package, tool)
					if ok and not pkg:is_installed() then
						pkg:install()
					end
				end
			end)
		end,
   }
}


return M
