return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts = opts or {}
      opts.servers = opts.servers or {}

      -- Disable the stock tsserver setup in favor of the richer VTSLS experience.
      opts.servers.tsserver = false

      local inlay_hints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      }

      opts.servers.vtsls = vim.tbl_deep_extend("force", opts.servers.vtsls or {}, {
        settings = {
          vtsls = {
            enableMoveToFileCodeAction = true,
            experimental = {
              completion = { enableServerSideFuzzyMatch = true },
            },
          },
          typescript = {
            inlayHints = inlay_hints,
            suggest = {
              completeFunctionCalls = true,
              includeCompletionsForModuleExports = true,
              includeCompletionsWithSnippetText = true,
            },
            preferences = {
              includeCompletionsForImportStatements = true,
              includeAutomaticOptionalChainCompletions = true,
              includeCompletionsWithInsertText = true,
            },
          },
          javascript = {
            inlayHints = inlay_hints,
            suggest = {
              completeFunctionCalls = true,
              includeCompletionsForModuleExports = true,
              includeCompletionsWithSnippetText = true,
            },
            preferences = {
              includeCompletionsForImportStatements = true,
              includeAutomaticOptionalChainCompletions = true,
              includeCompletionsWithInsertText = true,
            },
          },
        },
      })

      -- Go
      opts.servers.gopls = opts.servers.gopls or {}

      -- Python: pyright for types, ruff for lint/format/imports
      opts.servers.pyright = opts.servers.pyright or {}
      opts.servers.ruff = opts.servers.ruff or {}

      return opts
    end,
    -- Explicit setup via the modern vim.lsp.config API. Without this, lazy.nvim
    -- falls back to require("lspconfig").setup() — the deprecated framework.
    config = function(_, opts)
      -- Neovim 0.11+ hides inline diagnostic text by default. Show errors
      -- inline, like VS Code, with the most severe diagnostic first.
      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        virtual_text = { spacing = 4, source = "if_many", prefix = "●" },
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok then
        capabilities = vim.tbl_deep_extend("force", capabilities, cmp_lsp.default_capabilities())
      end

      for server, server_opts in pairs(opts.servers or {}) do
        if server_opts ~= false then
          local cfg = server_opts == true and {} or vim.deepcopy(server_opts)
          cfg.capabilities = vim.tbl_deep_extend("force", capabilities, cfg.capabilities or {})
          vim.lsp.config(server, cfg)
          vim.lsp.enable(server)
        end
      end
    end,
  },
}
