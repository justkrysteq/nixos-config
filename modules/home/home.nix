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

	imports = [
#		inputs.ags.homeManagerModules.default
		inputs.walker.homeManagerModules.default
	];

	programs = {
		neovim = {
			enable = true;
			defaultEditor = true;
			plugins = with pkgs.vimPlugins; [
				gruvbox-material
				nerdtree
			];

			viAlias = true;
			vimAlias = true;
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

#	ags = {
#		enable = true;

		# If you want home manager to manage the config
#		configDir = ../ags;

#		extraPackages = with pkgs; [
#			inputs.astal.packages.${pkgs.system}.battery
#			inputs.astal.packages.${pkgs.system}.network
#		];
#	};

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
		"hypr/hyprlock.conf".source = link "config-files/hyprlock.conf";
		"hypr/profile.webp".source = link "config-files/profile.webp";
		"hypr/profile.png".source = link "config-files/profile.png";
		"hypr/cat.png".source = link "config-files/cat.png";
		"hypr/background.png".source = link "config-files/background.png";
		"hypr/hypridle.conf".source = link "config-files/hypridle.conf";
		
		"scripts/lockscreen/weekday.sh".source = link "scripts/lockscreen/weekday.sh";
		"scripts/lockscreen/network-status.sh".source = link "scripts/lockscreen/network-status.sh";
		"scripts/lockscreen/battery-status.sh".source = link "scripts/lockscreen/battery-status.sh";
	};
	
	# Fonts
	xdg.dataFile = {
		"fonts/Anurati-Regular.otf".source = link "fonts/Anurati-Regular.otf";
		"fonts/OdinRounded-Regular.otf".source = link "fonts/OdinRounded-Regular.otf";
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
