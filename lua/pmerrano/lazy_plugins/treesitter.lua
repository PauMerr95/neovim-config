return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  main = "nvim-treesitter.config",
  build = ":TSUpdate",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "elixir", "javascript", "html", "python", "typescript", "cpp", "css"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
