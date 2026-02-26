{ config, flake-dir, hostname, ... }:
let
	link = f: config.lib.file.mkOutOfStoreSymlink "${flake-dir}/modules/home/config/${f}";
in
{
	xdg.configFile = {
		"hypr/hyprland.conf".source = link "hypr/shared/hyprland.conf";
		"hypr/hyprlock.conf".source = link "hypr/shared/hyprlock.conf";
		"hypr/hyprpaper.conf".source = link "hypr/shared/hyprpaper.conf";
		"hypr/hypridle.conf".source = link "hypr/${hostname}/hypridle.conf";
		"hypr/assets".source = link "hypr/shared/assets";
		"hypr/modules".source = link "hypr/shared/modules";
		"hypr/per-device/input.conf".source = link "hypr/${hostname}/input.conf";
		"hypr/per-device/monitors.conf".source = link "hypr/${hostname}/monitors.conf";

		"kitty/kitty.conf".source = link "kitty/kitty.conf";

		"fastfetch/config.jsonc".source = link "fastfetch/config.jsonc";

		"xdg-desktop-portal-termfilechooser" = {
			source = ./xdg-desktop-portal-termfilechooser;
			recursive = true;
		};

		# Brave Search Engines
		# NOTE: This does not work because the file needs to be in that directory, be mutable and not be a symlink
		# The solution for now is to copy the file to the config directory with this command
		# cp /etc/nixos/modules/home/config/brave/search-engines ~/.config/BraveSoftware/Brave-Browser/Default/Web Data

		# "BraveSoftware/Brave-Browser/Default/Web Data" = {
		# 	source = ./brave/search-engines;
		# 	force = true;
		# 	ignorelinks = true;
		# 	text = "test";
		# 	onChange = "cp ./brave/search-engines ~/.config/BraveSoftware/Brave-Browser/Default/Web Data";
		# };
	};
}
