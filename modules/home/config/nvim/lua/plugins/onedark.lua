return {
	"navarasu/onedark.nvim",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	config = function()
		require("onedark").setup {
			-- Choose one of: dark, darker, cool, deep, warm, warmer
			style = "cool",
		}
		require("onedark").load()
	end
}
