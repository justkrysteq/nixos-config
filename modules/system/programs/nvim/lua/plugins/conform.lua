return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local ft = vim.bo[bufnr].filetype

			local allowed = {
				lua = true,
				go = true,
				rust = true,
			}

			if allowed[ft] then
				return {
					timeout_ms = 1000,
					lsp_fallback = true,
				}
			end

			return false
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports" },
			rust = { "rustfmt" },

			-- Conform can also run multiple formatters sequentially
			-- python = { "isort", "black" },
			--
			-- You can use a sub-list to tell conform to run *until* a formatter
			-- is found.
			-- javascript = { { "prettierd", "prettier" } },
		},
	},
}
