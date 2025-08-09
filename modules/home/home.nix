{ pkgs, inputs, config, flake-dir, ... }:
let
	link = f: config.lib.file.mkOutOfStoreSymlink "${flake-dir}/modules/home/${f}";
in
{
	home = {
		username = "krysteq";
		homeDirectory = "/home/krysteq";
		stateVersion = "25.05";

		packages = with pkgs; [
			fastfetch
			btop
			nvtopPackages.intel
#			deepin.deepin-calculator # cool calc but there are some issues with it check journalctl for that and dark theme does not save
		];
	};

#	imports = [ inputs.ags.homeManagerModules.default ];
	imports = [
		inputs.walker.homeManagerModules.default
	];

	programs = {
		neovim = {
			enable = true;
#			defaultEditor = true;
			plugins = with pkgs.vimPlugins; [
				gruvbox-material
				nerdtree
			];
		};




		walker = {
			enable = true;
			runAsService = true;

			config = {
# 				app_launch_prefix = "";
# 				as_window = false;
# 				close_when_open = false;
# 				disable_click_to_close = false;
# 				force_keyboard_focus = false;
				hotreload_theme = true; # set to true when changing styles
# 				js_runtime = "node";
# 				locale = "";
# 				monitor = "";
# 				plugin_location = [];
# 				terminal_title_flag = "";
				theme = "custom";
# 				theme_location = [];
# 				timeout = 0;
#
# 				activation_mode = {
# 					labels = "jkl;asdf"
# 				};
#
# 				builtins = {
# 					ai = {
# 					icon = "help-browser";
# 					name = "ai";
# 					placeholder = "AI";
#
# 					};
# 				};
# 				search.placeholder = "";
# 				ui.fullscreen = true;
# 				list = {
# 					height = 200;
# 				};
				websearch.prefix = ":br";
				switcher.prefix = "/"; # No idea what's switcher
			};

			theme.style = ''
				* {
					color: #dcd7b1;
				}
			'';
		};
	};

#	wayland.windowManager.hyprland = {
#		enable = true;
#		settings = {
#
#		};
#	};

	xdg.configFile = {
		"hypr/hyprland.conf".source = link "config-files/hyprland.conf";
		"hypr/hyprpaper.conf".source = link "config-files/hyprpaper.conf";
		"hypr/wallpaper.png".source = link "config-files/wallpaper.png";
	};

#    programs.ags = {
#        enable = true;

        # null or path, leave as null if you don't want hm to manage the config
#        configDir = ../ags;

        # additional packages to add to gjs's runtime
#        extraPackages = with pkgs; [
#            gtksourceview
#            webkitgtk_6_0
#            accountsservice
#	    inputs.astal.packages.${pkgs.system}.battery
#            fzf
#        ];
#    };
}
