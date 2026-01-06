return {
	"ahmedkhalf/project.nvim",
	config = function() 
		require("project_nvim").setup({
		manual_mode = false,
		detection_methods = { "lsp", "pattern" },
		pattern = { ".git", "CMakeLists.txt", "pyproject.toml" },
		show_hidden = false,
		silent_chdir = false,
		datapath = vim.fn.stdpath("data"),
	})
	end,
}
