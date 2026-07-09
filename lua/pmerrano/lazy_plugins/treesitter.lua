return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",

  config = function()
    local langs = {
        "c", "cpp",
        "lua", "vim", "vimdoc", "elixir",
        "python",
        "javascript", "angular", "typescript", "html", "css"
    }

    require("nvim-treesitter").install(langs)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "c", "cpp",
        "lua", "vim", "vimdoc", "elixir",
        "python",
        "javascript", "angular", "typescript", "html", "css"
      },
      callback = function ()
        vim.treesitter.start()
      end,
    })
  end,
}
