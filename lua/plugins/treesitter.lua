return {
    "nvim-treesitter/nvim-treesitter",
    -- LazyVim's spec handles setup, highlight/indent, and installs tree-sitter-cli
    -- before building parsers. Extend its ensure_installed list with our languages.
    opts = {
        ensure_installed = { "c", "lua", "rust", "bash", "typescript", "sql", "go", "gomod", "gosum", "gowork" },
    },
}
