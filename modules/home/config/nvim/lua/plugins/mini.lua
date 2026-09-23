return {
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [']quote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - ysiw)       - [Y]add [S]urrounding [I]nner [W]ord [)]Paren
		-- - ds'         - [D]elete [S]urrounding [']quotes
		-- - cs)'        - [C]hange [S]urrounding [)] [']
		-- - ysiwtp<CR>  - [Y]add [S]urrounding [I]nner [W]ord [T]ag [p]
		require("mini.surround").setup({
			mappings = {
				add = "ys",
				delete = "ds",
				replace = "cs",
				find = '',
				find_left = '',
				highlight = '',
			}
		})

		-- Remap adding surrounding to Visual mode selection
		vim.keymap.del('x', 'ys')
		vim.keymap.set('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })

		-- Make special mapping for "add surrounding for line"
		vim.keymap.set('n', 'yss', 'ys_', { remap = true })

		-- Simple and easy statusline.
		--  You could remove this setup call if you dont like it,
		--  and try some other statusline plugin
		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}
