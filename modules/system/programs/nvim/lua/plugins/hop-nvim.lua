return {
	"smoka7/hop.nvim",
	version = "*",
	-- opts = {
	-- 	keys = "etovxqpdygfblzhckisuran",
	-- },
	config = function()
		require("hop").setup({
			keys = 'etovxqpdygfblzhckisuran'
		})

		vim.keymap.set("n", "<leader>hh", ":HopWord<CR>", { desc = "[H]op Word" })
		vim.keymap.set("n", "<leader>hw", ":HopWordAC<CR>", { desc = "[H]op [W]ord after cursor" })
		vim.keymap.set("n", "<leader>hW", ":HopWordBC<CR>", { desc = "[H]op [W]ord before cursor" })
		vim.keymap.set("n", "<leader>ha", ":HopAnywhere<CR>", { desc = "[H]op [A]nywhere" })
		vim.keymap.set("n", "<leader>hn", ":HopNodes<CR>", { desc = "[H]op [N]odes" })
		vim.keymap.set("n", "<leader>hc", ":HopChar1<CR>", { desc = "[H]op [C]har" })
		vim.keymap.set("n", "<leader>hl", ":HopLine<CR>", { desc = "[H]op [L]ine" })
	end
}
