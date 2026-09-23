return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {        -- TODO: Find some cool linters
			-- eslint = { "eslint" }
			-- markdown = { "markdownlint" },
			-- clojure = { "clj-kondo" },
			-- dockerfile = { "hadolint" },
			-- inko = { "inko" },
			-- janet = { "janet" },
			-- json = { "jsonlint" },
			-- markdown = { "vale" },
			-- rst = { "vale" },
			-- ruby = { "ruby" },
			-- terraform = { "tflint" },
			-- text = { "vale" }
		}

		-- You can disable the default linters by setting their filetypes to nil:
		-- lint.linters_by_ft['clojure'] = nil
		-- lint.linters_by_ft['dockerfile'] = nil
		-- lint.linters_by_ft['json'] = nil

		-- Create autocommand which carries out the actual linting
		-- on the specified events.
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
