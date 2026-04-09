return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost" },
    cond = function ()
      local file = vim.api.nvim_buf_get_name(0)
      if file == "" then return true end

      local ok, stats = pcall(vim.loop.fs_stat, file)
      if not ok or not stats then return true end

      return stats.size < 100 * 1024
    end,
    config = function ()
      require("gitsigns").setup()
    end
}
