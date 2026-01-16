local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "pmerrano.lazy_plugins" }
	},
	install = { colorscheme = { "material" } },
	change_detection = { notify = false },
	checker = { enable = true},
})
