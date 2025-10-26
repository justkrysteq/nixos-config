{ pkgs, inputs, config, flake-dir, username, ... }:
let
	link = f: config.lib.file.mkOutOfStoreSymlink "${flake-dir}/modules/home/${f}";
in
{
	home = {
		username = "${username}";
		homeDirectory = "/home/${username}";
		stateVersion = "25.05";

		packages = with pkgs; [
			nvtopPackages.intel
		];

		# pointerCursor = {
		# 	enable = true;
		# 	hyprcursor = {
		# 		enable = true;
		# 		size = 24;
		# 	};
		# 	package = pkgs.kdePackages.breeze;
		# 	name = "breeze_cursors";
		# };
	};

	imports = [
		inputs.ags.homeManagerModules.default
		# inputs.walker.homeManagerModules.default
	];

	# gtk.cursorTheme = {
	# 	package = pkgs.kdePackages.breeze;
	# 	name = "breeze_cursors";
	# 	size = 24;
	# };

	programs = {
		btop = {
			enable = true;
#			themes = "";
#			extraConfig = "";
		};

		fastfetch = {
			enable = true;
#			settings = "";
		};

		ags = {
			enable = true;

			# If you want home manager to manage the config
			configDir = ./ags;

			extraPackages = [
				inputs.astal.packages.${pkgs.system}.battery
				inputs.astal.packages.${pkgs.system}.hyprland
				inputs.astal.packages.${pkgs.system}.network
				inputs.astal.packages.${pkgs.system}.notifd

				inputs.astal.packages.${pkgs.system}.powerprofiles
				inputs.astal.packages.${pkgs.system}.wireplumber
				inputs.astal.packages.${pkgs.system}.tray
				inputs.astal.packages.${pkgs.system}.mpris
				inputs.astal.packages.${pkgs.system}.apps
			];
		};
	};

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

		"kitty/kitty.conf".source = link "config-files/kitty.conf";

		"walker/config.toml".source = link "config-files/walker/config.toml";
		"walker/themes/default.toml".source = link "config-files/walker/themes/default.toml";
		"walker/themes/custom.toml".source = link "config-files/walker/themes/custom.toml";
		"walker/themes/default.css".source = link "config-files/walker/themes/default.css";
		"walker/themes/custom.css".source = link "config-files/walker/themes/custom.css";

		"scripts/lockscreen/weekday.sh".source = link "scripts/lockscreen/weekday.sh";
		"scripts/lockscreen/network-status.sh".source = link "scripts/lockscreen/network-status.sh";
		"scripts/lockscreen/battery-status.sh".source = link "scripts/lockscreen/battery-status.sh";
	};

	# Fonts
	xdg.dataFile = {
		"fonts/Anurati-Regular.otf".source = link "fonts/Anurati-Regular.otf";
		"fonts/OdinRounded-Regular.otf".source = link "fonts/OdinRounded-Regular.otf";
	};
}
