{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		# Dependencies
		tree-sitter
		imagemagick # for image previews
		go # for hexokinase
		ripgrep fd # for telescope
		# stdenv.cc.cc
		nix.doc
		universal-ctags
		nodejs typescript # for typescript-tools-nvim

		# Formatters
		stylua # Lua
		gotools # goimports - Go
		rustfmt # Rust

		# Linters
		markdownlint-cli

		# LSPs
		# C/C++
		clang-tools
		# ccls # Works only in a git repo

		bash-language-server # Bash
		gopls # Go
		templ # Templ
		vscode-langservers-extracted # HTML CSS JSON ESLint
		htmx-lsp # HTMX
		hyprls # Hyprlang
		lua-language-server # Lua
		markdown-oxide # Markdown
		nixd # Nix
		intelephense # PHP
		pyright # Python
		kdePackages.qtdeclarative # QML
		rust-analyzer # Rust
		lemminx # XML
		jdt-language-server # Java
		# kotlin-language-server # Kotlin
	];

	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
		configure = {
			customRC = ''
				luafile ~/.config/nvim/init.lua
			'';

			packages.myPlugins = with pkgs.vimPlugins; {
				start = [
					lazy-nvim
					comment-nvim
					which-key-nvim
					telescope-nvim
					telescope-fzf-native-nvim
					telescope-ui-select-nvim
					nvim-web-devicons
					plenary-nvim
					nvim-lspconfig
					lazydev-nvim
					fidget-nvim
					conform-nvim
					nvim-cmp
					luasnip
					friendly-snippets
					cmp_luasnip
					cmp-nvim-lsp
					cmp-path
					onedark-nvim
					todo-comments-nvim
					mini-nvim
					nvim-autopairs
					neo-tree-nvim
					nui-nvim
					nvim-lint
					typescript-tools-nvim
					supermaven-nvim
					tabby-nvim
					image-nvim
					vim-hexokinase
					hop-nvim
					render-markdown-nvim
					yazi-nvim

					(nvim-treesitter.withPlugins (p: with p; [
						# asm
						# astro
						awk
						bash
						c
						c_sharp
						cmake
						comment
						cpp
						css
						csv
						# dart
						desktop
						# dockerfile
						# elixir
						# elm
						git_config
						git_rebase
						gitattributes
						gitcommit
						gitignore
						go
						goctl
						gomod
						gosum
						gotmpl
						gowork
						# gpg
						haskell
						html
						http
						hyprlang
						ini
						java
						javadoc
						javascript
						jq
						jsdoc
						json
						# json5
						# julia
						# just
						kitty
						kotlin
						latex
						# p.llvm
						lua
						luadoc
						luap
						luau
						make
						markdown
						mermaid
						# nasm
						# nginx
						# ninja
						nix
						# nu
						# odin
						# perl
						# php
						# php_only
						# phpdoc
						# powershell
						printf
						# prisma
						python
						# qmldir
						# qmljs
						regex
						# ruby
						rust
						# scss
						sql
						# ssh_config
						# svelte
						templ
						terraform
						todotxt
						toml
						tsx
						typescript
						# typst
						# vala
						# vim
						# vimdoc
						# vue
						xml
						yaml
						zig
						zsh
					]))
				];
				# opt = [];
			};
		};
	};
}
