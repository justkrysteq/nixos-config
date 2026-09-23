local plugin_specs = dofile(
	"/home/krysteq/.config/nvim-plugins-nix.lua" -- TODO: FIND A BETTER WAY
)

require("lazy").setup({
	spec = vim.list_extend({
		{ import = "plugins" },
	}, plugin_specs),

	install = {
		missing = false,
	},

	checker = {
		enabled = false,
	},
})

