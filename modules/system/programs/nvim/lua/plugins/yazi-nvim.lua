return {
	"mikavilpas/yazi.nvim",
	version = "*", -- use the latest stable version
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		{
			"<leader>y",
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			"<leader>Y",
			"<cmd>Yazi cwd<cr>",
			desc = "Open yazi in nvim's working directory",
		},
		-- {
		-- 	"<c-up>",
		-- 	"<cmd>Yazi toggle<cr>",
		-- 	desc = "Resume the last yazi session",
		-- }
	},
	opts = {
		open_for_directories = true,
		keymaps = {
			show_help = "<f1>",
		},
	},
	init = function() -- use it only with `open_for_directories=true`
		vim.g.loaded_netrwPlugin = 1
	end,
}
