return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	init = function()
		vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<CR>", { desc = "[S]earch [T]odo" })
	end,
	opts = {
		signs = false,
		keywords = {
			SECTION = { icon =  "", color = "section" }
			-- There are also: TODO, HACK, WARN (WARNING, XXX), PERF (PERFORMANCE, OPTIMIZE), NOTE (INFO), TEST (TESTING, PASSED, FAILED)
		},
		colors = {
			section = { "#B55EFF" }
		},
	},
}
