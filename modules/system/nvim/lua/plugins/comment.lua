return {
	-- "gc" to comment visual regions/lines
	-- NOTE: nixCats: nix downloads it with a different file name.
	-- tell lazy about that.
	{ "numToStr/Comment.nvim", name = "comment.nvim", opts = {} },

	-- Here is a more advanced example where we pass configuration
	-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
	--    require('gitsigns').setup({ ... })
	--
	-- See `:help gitsigns` to understand what the configuration keys do
	-- { -- Adds git related signs to the gutter, as well as utilities for managing changes
	--   'lewis6991/gitsigns.nvim',
	--   opts = {
	--     signs = {
	--       add = { text = '+' },
	--       change = { text = '~' },
	--       delete = { text = '_' },
	--       topdelete = { text = '‾' },
	--       changedelete = { text = '~' },
	--     },
	--   },
	-- },
}
