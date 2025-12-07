return {
	"navarasu/onedark.nvim",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	-- init = function()
	-- 	-- Load the colorscheme here. Some colorscheme plugins may offer multiple colorscheme choices or options.
	-- 	vim.cmd.colorscheme("onedark")
	--
	-- 	-- You can configure highlights by doing something like:
	-- 	vim.cmd.hi("Comment gui=none")
	-- end,
	config = function()
		-- You can configure the plugin here.
		require("onedark").setup {
			-- Choose one of: dark, darker, cool, deep, warm, warmer
			style = "cool",
		}
		require("onedark").load()
	end
}
