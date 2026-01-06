return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = {
	    filesystem = {
		    follow_current_file = true,
		    filtered_items = {
			    visible = true,
			    show_hidden_count = true,
			    hide_dotfiles = false,
			    hide_gitignore = false
			}
		}
	},
  }
}
