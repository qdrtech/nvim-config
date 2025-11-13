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

      opts.servers.gopls = vim.tbl_deep_extend("force", opts.servers.gopls or {}, {
        settings = {
          gopls = {
            gofumpt = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
              unusedwrite = true,
              nilness = true,
              shadow = true,
              fieldalignment = false,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      })

      return opts
    end,
    config = function(_, opts)
      for server, server_opts in pairs(opts.servers or {}) do
        if server_opts ~= false then
          local cfg = server_opts == true and {} or vim.deepcopy(server_opts)
          vim.lsp.config(server, cfg)
          vim.lsp.enable(server)
        end
      end
    end,
  },
}
