return {
  'DrKJeff16/project.nvim',
  cmd = { 'Project' }, -- Lazy-load by commands
  dependencies = { -- OPTIONAL. Choose any of the following
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    'ibhagwan/fzf-lua',
  },
  opts = {},
}
