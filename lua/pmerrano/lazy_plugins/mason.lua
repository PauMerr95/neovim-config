return {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        ensure_installed = {
            "ts_ls",
            "html",
            "cssls",
            "lua_ls",
            "pyright",
            "clangd",
        }
    },
    config = function (_, opts)
      require("mason-lspconfig").setup(opts)
    end,
    handlers = {},
    dependencies = {
        {
            "mason-org/mason.nvim",
            cmd = { "Mason", "MasonInstall", "MasonUpdate" },
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
            config = function()
              -- C / C++
              vim.lsp.config("clangd", {
                root_markers = { "CMakeLists.txt", ".git" },
                cmd = {
                  "clangd",
                  "--compile-commands-dir=" .. vim.fn.getcwd():gsub("\\", "/") .. "/build/debug",
                }
              })

              -- Python
              vim.lsp.config("pyright", {
                root_dir = function(fname)
                  return vim.fs.root(fname, {
                    "pyproject.toml",
                    "uv.lock",
                    ".git",
                  })
                end,

                settings = {
                  python = {
                    analysis = {
                      diagnosticMode = "openFilesOnly",
                      autoSearchPaths = true,
                      useLibraryCodeForTypes = true,
                    },
                  },
                },

                on_new_config = function(config, root_dir)
                  local venv = root_dir .. "/.venv"
                  if vim.fn.isdirectory(venv) == 1 then
                    config.settings = config.settings or {}
                    config.settings.python = config.settings.python or {}

                    config.settings.python.pythonPath =
                      venv .. "\\Scripts\\python.exe" --Windows specific config!
                  end

                end,
              })
              -- enable configs
              vim.lsp.enable("clangd")
              vim.lsp.enable("pyright")
            end,
        },
    },
}
