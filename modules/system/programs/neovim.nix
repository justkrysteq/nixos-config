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

					(nvim-treesitter.withPlugins (p: [
						# p.asm
						# p.astro
						p.awk
						p.bash
						p.c
						p.c_sharp
						p.cmake
						p.comment
						p.cpp
						p.css
						p.csv
						p.dart
						p.desktop
						# p.dockerfile
						# p.elixir
						# p.elm
						p.git_config
						p.git_rebase
						p.gitattributes
						p.gitcommit
						p.gitignore
						p.go
						p.goctl
						p.gomod
						p.gosum
						p.gotmpl
						p.gowork
						# p.gpg
						p.haskell
						p.html
						p.http
						p.hyprlang
						p.ini
						p.java
						p.javadoc
						p.javascript
						p.jq
						p.jsdoc
						p.json
						# p.json5
						# p.julia
						# p.just
						p.kitty
						p.kotlin
						p.latex
						# p.llvm
						p.lua
						p.luadoc
						p.luap
						p.luau
						p.make
						p.markdown
						p.mermaid
						# p.nasm
						# p.nginx
						# p.ninja
						p.nix
						# p.nu
						# p.odin
						# p.perl
						# p.php
						# p.php_only
						# p.phpdoc
						# p.powershell
						p.printf
						# p.prisma
						p.python
						# p.qmldir
						# p.qmljs
						p.regex
						# p.ruby
						p.rust
						# p.scss
						p.sql
						p.ssh_config
						# p.svelte
						p.templ
						p.terraform
						p.todotxt
						p.toml
						p.tsx
						p.typescript
						# p.typst
						# p.vala
						# p.vim
						# p.vimdoc
						# p.vue
						p.xml
						p.yaml
						p.zig
						p.zsh
					]))
				];
				# opt = [];
			};
		};
	};
}
