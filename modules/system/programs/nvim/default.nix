{ inputs, ... }:
let
	utils = inputs.nixCats.utils;
in
{
	imports = [
		inputs.nixCats.nixosModules.default
	];
	config = {
		# this value, nixCats is the defaultPackageName you pass to mkNixosModules
		# it will be the namespace for your options.
		nixCats = {
			enable = true;
			# nixpkgs_version = inputs.nixpkgs;
			# this will add an overlay for any plugins
			# in inputs named "plugins-pluginName" to pkgs.neovimPlugins
			# It will not apply to overall system, just nixCats.
			addOverlays = [
				(utils.standardPluginOverlay inputs)
			];
			# see the packageDefinitions below.
			# This says which of those to install.
			packageNames = [ "nixCats" ];

			luaPath = ./.;

			# the .replace vs .merge options are for modules based on existing configurations,
			# they refer to how multiple categoryDefinitions get merged together by the module.
			# for useage of this section, refer to :h nixCats.flake.outputs.categories
			categoryDefinitions.replace = ({ pkgs, settings, categories, extra, name, mkPlugin, ... }@packageDef: {
				lspsAndRuntimeDeps = {
					general = with pkgs; [
						universal-ctags
						ripgrep
						fd
						stdenv.cc.cc
						nix.doc
						lua-language-server
						nixd
						stylua
						markdownlint-cli
						typescript-language-server
						rocmPackages.clang
						superhtml
						vscode-css-languageserver
						pyright
						rust-analyzer
						intelephense
						markdown-oxide
						lemminx # XML Language server
						kdePackages.qtdeclarative # QML Language server and stuff
						imagemagick # for image previews
						go # for hexokinase
					];
				};
				startupPlugins = {
					general = with pkgs.vimPlugins; [
						# vim-sluth # automatic tab width detection and changes it to spaces -_-
						lazy-nvim
						comment-nvim
						# gitsigns-nvim # :Gitsigns - shows git changes
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
						nvim-treesitter.withAllGrammars
						nvim-autopairs
						neo-tree-nvim
						nui-nvim
						nvim-lint
						typescript-tools-nvim
						supermaven-nvim
						tabby-nvim
						image-nvim
						vim-hexokinase

						# If you want only certain grammars
						# (nvim-treesitter.withPlugins (
						#	 plugins: with plugins; [
						#		 nix
						#		 lua
						#	 ]
						# ))
					];
					# themer = with pkgs; [
					#	 # you can even make subcategories based on categories and settings sets!
					#	 (builtins.getAttr packageDef.categories.colorscheme {
					#			 "onedark" = onedark-vim;
					#			 "catppuccin" = catppuccin-nvim;
					#			 "catppuccin-mocha" = catppuccin-nvim;
					#			 "tokyonight" = tokyonight-nvim;
					#			 "tokyonight-day" = tokyonight-nvim;
					#		 }
					#	 )
					# ];
				};
				optionalPlugins = {
					general = [];
				};
				# shared libraries to be added to LD_LIBRARY_PATH
				# variable available to nvim runtime
				sharedLibraries = {
					general = with pkgs; [
						# libgit2
					];
				};
				environmentVariables = {
					test = {
						CATTESTVAR = "It worked!";
					};
				};
				extraWrapperArgs = {
					test = [
						'' --set CATTESTVAR2 "It worked again!"''
					];
				};
				# lists of the functions you would have passed to
				# python.withPackages or lua.withPackages

				# get the path to this python environment
				# in your lua config via
				# vim.g.python3_host_prog
				# or run from nvim terminal via :!<packagename>-python3
				python3.libraries = {
					test = (_:[]);
				};
				# populates $LUA_PATH and $LUA_CPATH
				extraLuaPackages = {
					test = [ (_:[]) ];
				};
			});

			# see :help nixCats.flake.outputs.packageDefinitions
			packageDefinitions.replace = {
				# These are the names of your packages
				# you can include as many as you wish.
				nixCats = {pkgs, name, ... }: {
					# they contain a settings set defined above
					# see :help nixCats.flake.outputs.settings
					settings = {
						suffix-path = true;
						suffix-LD = true;
						wrapRc = true;
						# unwrappedCfgPath = "/path/to/config";
						# IMPORTANT:
						# your alias may not conflict with your other packages.
						aliases = [ "nvim" ];
						# neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
					};
					# and a set of categories that you want
					# (and other information to pass to lua)
					categories = {
						general = true;
					};
				};
			};

			# you can do it per user as well
			# users.REPLACE_ME = {
			#	 enable = true;
			#	 packageNames = [ "REPLACE_MEs_VIM" ];
			#	 categoryDefinitions.replace = ({ pkgs, settings, categories, extra, name, mkPlugin, ... }@packageDef: {});
			#	 packageDefinitions.replace = {
			#		 REPLACE_MEs_VIM = {pkgs, name, ...}: {
			#			 settings = {};
			#			 categories = {};
			#		 };
			#	 };
			# };
		};
	};
}
