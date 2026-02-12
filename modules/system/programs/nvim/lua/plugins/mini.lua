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
		-- - Saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - Sd'   - [S]urround [D]elete [']quotes
		-- - Sr)'  - [S]urround [R]eplace [)] []
		require("mini.surround").setup({

			mappings = {
				add = 'Sa', -- Add surrounding in Normal and Visual modes
				delete = 'Sd', -- Delete surrounding
				find = 'Sf', -- Find surrounding (to the right)
				find_left = 'SF', -- Find surrounding (to the left)
				highlight = 'Sh', -- Highlight surrounding
				replace = 'Sr', -- Replace surrounding
			},
		})

		-- Simple and easy statusline.
		--  You could remove this setup call if you dont like it,
		--  and try some other statusline plugin
		local statusline = require("mini.statusline")
		-- set use_icons to true if you have a Nerd Font
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
