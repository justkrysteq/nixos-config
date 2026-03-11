return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"williamboman/mason.nvim",
			-- NOTE: nixCats: use lazyAdd to only enable mason if nix wasnt involved.
			-- because we will be using nix to download things instead.
			enabled = require("nixCatsUtils").lazyAdd(true, false),
			config = true,
		},
		{
			"williamboman/mason-lspconfig.nvim",
			enabled = require("nixCatsUtils").lazyAdd(true, false),
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			enabled = require("nixCatsUtils").lazyAdd(true, false),
		},

		-- Useful status updates for LSP.
		{ "j-hui/fidget.nvim", opts = {} },

		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					-- adds type hints for nixCats global
					{ path = (nixCats.nixCatsPath or "") .. "/lua", words = { "nixCats" } },
				},
			},
		},
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- Jump to the definition of the word under your cursor.
				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

				-- Find references for the word under your cursor.
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

				-- Jump to the implementation of the word under your cursor.
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

				-- Jump to the type of the word under your cursor.
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

				-- Fuzzy find all the symbols in your current document.
				-- Symbols are things like variables, functions, types, etc.
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

				-- Fuzzy find all the symbols in your current workspace.
				-- Similar to document symbols, except searches over your entire project.
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

				-- Rename the variable under your cursor.
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

				-- Execute a code action
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				-- Opens a popup that displays documentation about the word under your cursor
				map("K", vim.lsp.buf.hover, "Hover Documentation")

				-- WARN: This is not Goto Definition, this is Goto Declaration.
				-- For example, in C this would take you to the header.
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				-- See `:help CursorHold` for information about when this is executed

				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					local highlight_augroup =
						vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				-- The following autocommand is used to enable inlay hints in your
				-- code, if the language server you are using supports them
				--
				-- This may be unwanted, since they displace some of your code
				if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		-- LSP servers and clients are able to communicate to each other what features they support.
		-- By default, Neovim doesn't support everything that is in the LSP specification.
		-- When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
		-- So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		vim.lsp.config("*", { capabilities = capabilities })

		-- Enable the following language servers
		--	Add any additional override configuration in the following tables. Available keys are:
		--	- cmd (table): Override the default command used to start the server
		--	- filetypes (table): Override the default list of associated filetypes for the server
		--	- capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
		--	- settings (table): Override the default settings passed when initializing the server.
		--				For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
		-- NOTE: nixCats: there is help in nixCats for lsps at `:h nixCats.LSPs` and also `:h nixCats.luaUtils`
		-- see https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/
		local servers = {
			-- C/C++
			-- clangd = {},
			ccls = {},

			-- HTML
			superhtml = {},

			-- CSS
			cssls = {},

			-- Hyprland
			hyprls = {},

			-- Go
			gopls = {},

			-- Python
			pyright = {},

			-- Rust
			rust_analyzer = {},

			-- Markdown
			markdown_oxide = {},

			-- Bash
			bashls = {},

			-- Java
			jdtls = {},

			-- Lua
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
						diagnostics = {
							globals = { "nixCats" },
							disable = { "missing-fields" },
						},
						telemetry = { enabled = false },
					},
				},
			},

			-- PHP
			intelephense = {
				settings = {
					intelephense = {
						telemetry = { enabled = false }
					}
				}
			},

			-- XML
			lemminx = {
				settings = {
					xml = {
						server = {
							workDir = "~/.cache/lemminx";
						}
					}
				}
			},

			-- QML
			qmlls = {
				cmd = { "qmlls", "-E" },
			}

		}

		-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs

		-- NOTE: nixCats: nixd is not available on mason.
		-- Feel free to check the nixd docs for more configuration options:
		-- https://github.com/nix-community/nixd/blob/main/nixd/docs/configuration.md
		if require("nixCatsUtils").isNixCats then
			servers.nixd = {}
		else
			servers.rnix = {}
			servers.nil_ls = {}
		end

-- NOTE: nixCats: if nix, use lspconfig instead of mason
		-- You could MAKE it work, using lspsAndRuntimeDeps and sharedLibraries in nixCats
		-- but don't... its not worth it. Just add the lsp to lspsAndRuntimeDeps.
		if require("nixCatsUtils").isNixCats then
			-- set up the servers to be loaded on the appropriate filetypes!
			for server_name, cfg in pairs(servers) do
				vim.lsp.config(server_name, cfg)
				vim.lsp.enable(server_name)
			end
		else
			-- NOTE: nixCats: and if no nix, use mason

			-- Ensure the servers and tools above are installed
			--	To check the current status of installed tools and/or manually install
			--	other tools, you can run
			--		:Mason
			--
			--	You can press `g?` for help in this menu.
			require("mason").setup()

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						vim.lsp.config(server_name, servers[server_name] or {})
						vim.lsp.enable(server_name)
					end,
				},
			})
		end
	end,
}
