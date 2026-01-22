return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "ts_ls",
            "html",
            "cssls",
            "lua_ls",
            "pyright",
            "clangd"
        }
    },
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "→",
                        package_uninstalled = "𐄂",
                    },
                },
            },
        },
        {
            "neovim/nvim-lspconfig",
            lazy = false,
            dependencies = {
                { "ms-jpq/coq_nvim", branch = "coq" },
                { "ms-jpq/coq.artifacts", branch = "artifacts" },
                { 'ms-jpq/coq.thirdparty', branch = "3p" }
            },
            init = function()
                vim.g.coq_settings = {
                    auto_start = true,
                }
            end,
        },
    },
}
